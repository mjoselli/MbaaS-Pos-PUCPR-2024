//
//  ContentView.swift
//  FirebaseTeste
//
//  Created by Mark Joselli on 15/03/24.
//

import SwiftUI
import FirebaseFirestore


struct ContentView: View {
    @ObservedObject private var viewModel = ContactViewModel()
    
    @State private var name: String = ""
    var body: some View {
        NavigationView {
            List(viewModel.contacts) { contact in
                VStack(alignment: .leading) {
                    Text(contact.name ?? "-").font(.title)
                }
            }.onAppear() {
                self.viewModel.fetchData()
            }.navigationTitle("List")
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    TextField("Enter your name", text: $name)
                        .frame(minWidth: 100, idealWidth: 150, maxWidth: 240, minHeight: 30, idealHeight: 40, maxHeight: 50, alignment: .leading)
                    Spacer()
                    Button(action: {
                        self.viewModel.addData(name: name)

                    }) {
                        HStack {
                            Image(systemName: "plus")
                                .font(.title)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(40)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
