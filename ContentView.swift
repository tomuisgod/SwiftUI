//
//  ContentView.swift
//  SUI
//
//  Created by tomu on 19/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    let facebookBlue = UIColor(red: 23/255.0,
                               green: 120/255.0,
                               blue: 242/255.0,
                               alpha: 1)
    @Binding var text: String
    
    let stories = ["story1", "story2", "story3"]
    
    var body: some View {
        VStack {
            HStack{
                Text("facebook")
                    .font(.system(size: 48, weight: .bold, design: .default))
                    .foregroundColor(Color(facebookBlue))
                Spacer()
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.secondaryLabel))
            }
            .padding()
            
            TextField("Search", text: $text)
                .padding(7)
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .padding(.horizontal, 15)
            
            ZStack {
                Color(.secondarySystemBackground)
                ScrollView(.vertical) {
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 5) {
                                ForEach(stories, id: \.self) { name in
                                    Image(name)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 140, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .background(Color.red)
                                        .cornerRadius(7)
                                        .clipped()
                                }
                                
                            }
                            .padding()
                        }
                        FBPost(name: "Volkan Volkitsu Volkish", time: "Now",post: "i love bread so fucking much i cant-", imageName: "kitsu")
                        Spacer()
                        FBPost(name: "Ebisu-Chan", time: "A few minutes ago", post: "ye ye ily2", imageName: "ebisu")
                        Spacer()
                        FBPost(name: "Tomu Tomish", time: "An Hour ago", post: "ily ok?", imageName: "tomu")
                        Spacer()
                        
                    }
                }
            }
            
            Spacer()
        }
    }
}


struct FBPost: View {
    
    @State var isLiked: Bool = false
    
    let name: String
    let time: String
    let post: String
    let imageName: String
    
    var body: some View {
        VStack {
            //Profilová fotka a meno
            
            HStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(25)
                VStack {
                    HStack {
                        Text(name)
                            .font(.system(size: 18, weight: .semibold, design: .default))
                        Spacer()
                    }
                    HStack {
                        Text(time)
                            .foregroundColor(Color(.secondaryLabel))
                        Spacer()
                    }
                }
                Spacer()
            }
            //Text postu
            Spacer()
            HStack {
                Text(post)
                    .font(.system(size: 24, weight: .regular, design: .default))
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            //Like, Comment, Share
            Spacer()
            
            HStack{
                //Like
                Button(action: {
                    isLiked.toggle()
                }, label: {
                    Text(isLiked ? "Liked" : "Like")
                        .foregroundColor(isLiked ? (Color.gray) : (Color.blue))
                })
                Spacer()
                //Comment
                Button(action: {
                    
                }, label: {
                    Text("Comment")
                })
                Spacer()
                //Share
                Button(action: {
                    
                }, label: {
                    Text("Share")
                })
            }
            .padding()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: .constant(""))
    }
}
