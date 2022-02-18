//
//  ContentView.swift
//  FlikrImages
//
//  Created by Sean Adhikari on 2/17/22.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let imgColor: Color
}

struct ContentView: View {
    
    let items = [
        Item(title: "Home", image: "home", imgColor: .orange),
        Item(title: "Money", image: "money", imgColor: .orange),
        Item(title: "Bank", image: "bank", imgColor: .orange),
        Item(title: "Vacation", image: "vacation", imgColor: .orange),
        Item(title: "User", image: "user", imgColor: .orange),
        Item(title: "Charts", image: "chart", imgColor: .orange),
        Item(title: "Support", image: "support", imgColor: .orange)
    ]
    
    let spacing: CGFloat = 10
    @State private var numberOfRows = 3
    
    var body: some View {
        
        let columns = Array(
            repeating: GridItem(.flexible(), spacing: spacing), count: numberOfRows)
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: spacing) {
                ForEach(items) { item in
                    ItemView(item: item)
                }
            }
            .padding(.horizontal)
        }
        .background(Color.white)
        
        Text("Hello, world!")
            .padding()
    }
}

struct ItemView: View {
    let item: Item
    
    var body: some View {
        GeometryReader { reader in
            VStack(spacing: 5) {
                Image(item.image)
                    .foregroundColor(item.imgColor)
                    .frame(width: 50)
                Text(item.title)
                Spacer()
            } .background(item.imgColor)
        }
        .frame(height: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
