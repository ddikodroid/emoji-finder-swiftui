//
//  EmojiListView.swift
//  EmojiFinder
//
//  Created by Ahmad Syarifuddin Randiko on 18/11/22.
//

import SwiftUI

struct EmojiListView: View {
    // MARK: - Properties
    
    // useState di React Native
    @State private var query: String = ""
    
    //   Variabel emojiSearchResult dengan bentuk array of EmojiModel yang akan me-return showEmoji() dari Emoji Provider di EmojiModel
    private var emojiSearchResult: [EmojiModel]{
        let allEmojis = EmojiModel.EmojiProvider.showEmoji()
        
        if query.isEmpty{
            return allEmojis
        } else {
            return allEmojis.filter{
//                e in
//                e.name.lowercased().contains(query.lowercased()) || e.emoji.contains(query.lowercased())
                $0.name.lowercased().contains(query.lowercased()) || $0.emoji.contains(query.lowercased())
            }
        }
    }
    
    private var suggestions: [EmojiModel] {
        if query.isEmpty {
            return []
        } else {
            return emojiSearchResult
        }
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack{
         
                //   List tampilkan emojiSearchResult dalam variabel result di dalam closure.
            List(emojiSearchResult.shuffled()){ result in
                    NavigationLink(destination: EmojiDetailView(detail: result)){
                        
                        Text("\(result.emoji) \(result.name)")
                            .font(.title3)
                            .padding(8)
                        
                    }
                } //: List
                .navigationTitle("Emoji")
                .searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always),
                            prompt: "Search emoji..."){
                    
                    // Menampilkan suggestion berdasarkan query
                    ForEach(suggestions) { suggestion in
                        Text("Looking for \(suggestion.emoji) - \(suggestion.name)?")
                            .searchCompletion(suggestion.name)
                    }
                }
            }
        } //: NavigationStack
}

// MARK: - Preview
struct EmojiListView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiListView()
    }
}
