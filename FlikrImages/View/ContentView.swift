//
//  ContentView.swift
//  FlikrImages
//
//  Created by Sean Adhikari on 2/17/22.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @ObservedObject var imageVM = ImageViewModel()
    @State var searchText = ""
    @State var isSearching = false
    
    let layout = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    HStack {
                        TextField("Search images", text: $searchText)
                            .padding(.leading, 24)
                            .submitLabel(.done)
                            .onChange(of: searchText) { _ in
                                imageVM.getImages(searchText)
                            }
                    }
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(6)
                    .padding(.horizontal)
                    .onTapGesture(perform: {
                        isSearching = true
                    })
                    .overlay {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Spacer()
                            
                            if isSearching {
                                Button(action: { searchText = "" }, label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .padding(.vertical)
                                })
                            }
                        }
                        .padding(.horizontal, 32)
                        .foregroundColor(.gray)
                    }
                    .transition(.move(edge: .trailing))
                    .animation(.spring())
                    
                    if isSearching {
                        Button(action: {
                            isSearching = false
                            searchText = ""
                            
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }) {
                            Text("Cancel")
                                .padding(.trailing)
                                .padding(.leading, 0)
                        }
                        .transition(.move(edge: .trailing))
                        .animation(.spring())
                    }
                }
                
                LazyVGrid(columns: layout, spacing: 16, content: {
                    ForEach(imageVM.images) { image in
                        NavigationLink(destination: ImageDetailView(imageItem: image)) {
                            ImageInfo(item: image)
                                .frame(height: 150)
                        }
                    }
                }).padding([.horizontal, .top], 12)
            }.navigationTitle("Image Search")
        }
        .onAppear {
            imageVM.getImages()
        }
    }
}

struct ImageInfo: View {
    
    let item: ImageItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            KFImage(URL(string: item.media.m))
                .resizable()
                .frame(height: 100)
                .scaledToFit()
                .cornerRadius(10)
            Text(item.title)
                .font(.system(size: 10, weight: .semibold))
                .padding(.top, 4)
            Text(item.published)
                .font(.system(size: 9, weight: .regular))
            Text(item.author)
                .font(.system(size: 9, weight: .regular))
                .foregroundColor(.gray)
            
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
