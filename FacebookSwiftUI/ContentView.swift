//
//  ContentView.swift
//  FacebookSwiftUI
//
//  Created by Bruno Lopes de Mello on 08/06/19.
//  Copyright © 2019 Bruno Lopes de Mello. All rights reserved.
//

import SwiftUI

struct Post {
    let id: Int
    let userName, text, imageName: String
}

struct ContentView : View {
    
    let posts: [Post] = [
        .init(id: 0, userName: "Hillary Clinton", text: "Good old bill up to his usual ways and dirty tricks", imageName: "burger"),
        .init(id: 1, userName: "Trump", text: "Good old bill up to his usual ways and dirty tricks", imageName: "burger"),
        .init(id: 2, userName: "Hillary Clinton", text: "Good old bill up to his usual ways and dirty tricks", imageName: "burger")
    ]
    
    var body: some View {
        
        NavigationView {
            List {
                
                ScrollView {
                    VStack (alignment: .leading) {
                        Text("Trending")
                        HStack (spacing: -10){
                            NavigationButton(destination: GroupDetailView()) {
                                GroupView()
                            }
                            GroupView()
                            GroupView()
                            GroupView()
                            GroupView()
                            GroupView()
                            GroupView()
                        }
                    }
                    
                }.frame(height: 200)
                
                // post rows
                
                ForEach(posts.identified(by: \.id)) { post in
                    NavigationButton(destination: PostDetail()) {
                        PostView(post: post)
                    }
                }
                
            }.navigationBarTitle(Text("Group1"))
            
        }
    }
}

struct GroupDetailView: View {
    var body: some View {
        Text("Group Detail View")
    }
}

struct PostDetail: View {
    var body: some View {
        Text("Post Detail View")
    }
}

struct PostView: View {
    
    let post: Post
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 16) {
            
            HStack {
                Image("burger")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                    .clipped()
                VStack (alignment: .leading, spacing: 4) {
                    Text(post.userName)
                        .font(.headline)
                    Text("Posted 8 hrs ago")
                        .font(.headline)
                }.padding(.leading, 8)
            }.padding(.leading, 20)
            
            Text(post.text)
                .lineLimit(nil)
                .padding(.leading, 20)
                .padding(.trailing, 32)
            Image(post.imageName)
                .scaledToFill()
                .frame(height: 350)
                .clipped()
        }.padding(.leading, -20).padding(.top, 16).padding(.bottom, -8)
    }
}

struct GroupView: View {
    var body: some View {
        VStack (alignment: .leading) {
            Image("hike")
                .renderingMode(.original)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(5)
            Text("Co-Ed Hikes of Colorado")
                .color(.primary)
                .lineLimit(nil)
                .padding(.leading, 0)
            }.frame(width: 110, height: 170)
            .padding(.top, -8)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
