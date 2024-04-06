package com.example.retrofitapp

import retrofit2.http.GET

interface ChuckNorrisApi {
    @GET("jokes/random/")
    suspend fun getRandomFact() : Fact
}