//
//  ContentView.swift
//  MultyplyTable
//
//  Created by @andreev2k on 13.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animals = ["bear","buffalo","chik","chicken","cow","crocodile","dog","duck","elephant","frog","giraffe","goat","gorilla","hippo","horse","monkey","moose","narwhal","owl","panda","parrot","penguin","pig","rabbit","rhino","sloth","snake","walrus","whale","zebra"].shuffled()
    
    
    @State private var number = Int.random(in: 2...12)
    @State private var numbers = Int.random(in: 2...12)
    
    @State private var correctTitle = ""
    
    @State private var showingFail = false
    
    @State private var selected = -1
    @State private var amount = ""
    
    
    var multiply: Int {
        let multiPly = number * numbers
        return multiPly
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Text("Выбери число")
                            .font(.title.bold())
                        
                        Stepper("Число     \(number)", value: $number, in: 2...12)
                            .font(.title2.bold())
                    } header: {
                        Text("")
                    }
                    
                    Text("Сколько будет       \(number)  х  \(numbers)")
                        .font(.title2.bold())
                    
                    
                    Section {
                        TextField("ОТВЕТ", text: $amount)
                            .padding()
                            .font(.title.bold())
                        
                    
                            HStack {
                                Spacer()
                                Button {
                                    tapped(Int(self.amount) ?? selected)
                                } label: {
                                    Image(animals[9])
                                       
                                }
                                Spacer()
                            }
                    }
                } .navigationBarTitle("Умножение")
            }
            
            .alert(correctTitle, isPresented: $showingFail) {
                Button("Продолжить", action: askQuestion)
            }  message: {
                Text("") }
        }
    }
    
    
    func askQuestion() {
        animals.shuffle()
        selected = -1
        numbers = Int.random(in: 2...12)
    }
    
    func tapped(_ number: Int) {
        selected = number
        if number == multiply {
            correctTitle = "Верно, МОЛОДЕЦ!"
            showingFail = true
        } else {
            correctTitle = "HE Верно, правильный ответ:  \(multiply)"
            showingFail = true
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
