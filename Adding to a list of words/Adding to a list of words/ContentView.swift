//
//  ContentView.swift
//  Adding to a list of words
//
//  Created by Bishowjit Ray on 31/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var useWords = [String]()
    @State private var rootword = ""
    @State private var newWord = ""
    var body: some View {
        NavigationView{
            List{
                Section{
                    TextField("Enter your word", text: $newWord)
                        .autocapitalization(.none)
                }
                Section{
                    ForEach(useWords, id:\.self){ word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                        }
                        Text(word)
                        
                        
                    }
                }
                
            }
            .navigationTitle(rootword)
            .onSubmit(addNewWord)
        }
    }
    func addNewWord()
    {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        // Extra validation to come
        withAnimation{
        useWords.insert(answer, at: 0)
        }
        newWord = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
