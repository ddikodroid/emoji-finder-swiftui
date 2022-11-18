//
//  EmojiDetailView.swift
//  EmojiFinder
//
//  Created by Ahmad Syarifuddin Randiko on 18/11/22.
//

import SwiftUI

struct EmojiDetailView: View {
    // MARK: - Properties
    let detail: EmojiModel
    
    // MARK: - Body
    var body: some View {
        ZStack{
            LinearGradient(colors: [.clear,.teal], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                Text(detail.emoji)
                    .font(.system(size: 120, design: .rounded))
                
                Text(detail.name)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                
                Text(detail.description)
                    .font(.system(size: 18, design: .rounded))
                    .lineSpacing(6)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
        
            } //: VStack
            .padding()
            
        } //: ZStack
    }
}

struct EmojiDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiDetailView(
            detail:
                EmojiModel( emoji: "👾", name: "Alien Monster", description: "A friendly-looking, tentacled space creature with two eyes."))
    }
}
