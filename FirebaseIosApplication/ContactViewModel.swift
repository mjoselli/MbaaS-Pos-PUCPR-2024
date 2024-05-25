//
//  CardListViewModel.swift
//  FirebaseTeste
//
//  Created by Mark Joselli on 15/03/24.
//

import Foundation
import Combine
import FirebaseFirestore


class ContactViewModel: ObservableObject {
    
    @Published var contacts = [Contact]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("contacts").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.contacts = documents.map { (queryDocumentSnapshot) -> Contact in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                return Contact(name: name)
            }
        }
    }
    
    func addData(name: String) {
       db.collection("contacts").addDocument(data: ["name": name])
    }
}
