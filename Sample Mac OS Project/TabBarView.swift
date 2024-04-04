//
//  TabBarView.swift
//  Sample Mac OS Project
//
//  Created by Mallikarjuunarao. Mupparaju on 09/09/22.
//

import SwiftUI

struct Lists : Hashable{
    let name :  String
    let imageName :   String
}

struct TabBarView: View {
    @State var currentTab = 0
    let list : [Lists]  = [
        .init(name: "Discover", imageName: "star"),
        .init(name: "Arcade", imageName: "gamecontroller"),
        .init(name: "Create", imageName: "paintbrush"),
        .init(name: "Work", imageName: "location"),
        .init(name: "Play", imageName: "sunrise"),
        .init(name: "Develop", imageName: "hammer"),
        .init(name: "Categories", imageName: "square.grid.2x2"),
        .init(name: "Updates", imageName: "square.and.arrow.down"),
    ]
    var body: some View {
        NavigationView{
            ListView(list: list, currentTab: $currentTab)
            switch currentTab{
            case 1:
                Text("Arcade View")
            case 2:
                Text("Create View")
            case 3:
                Text("Work View")
            case 4:
                Text("Play View")
            case 5:
                Text("Develop View")
            case 6:
                Text("Categories View")
            case 7:
                Text("Updates View")
            default:
                MainView()
            }
        }.frame(minWidth: 600, minHeight: 480)
    }
}


struct ListView: View {
    let list : [Lists]
    @Binding var currentTab : Int
  @State var search = ""
    var body: some View {
        VStack{
            TextField("Search", text:$search)
                
                .textFieldStyle(.roundedBorder)
            let current = list[currentTab]
                ForEach(Array(list.enumerated()), id: \.offset) { index, list in
                HStack{
                    Image(systemName: list.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15)
                        .foregroundColor(.blue)
                    Text(list.name)
                    Spacer()
                }
                .padding(5)
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(current == list ? Color.gray.opacity(0.2) : .clear))
                .onTapGesture {
                    self.currentTab = index
                }
            }
            Spacer()
        }.padding(5)
    }
}

struct MainView: View {
    let cols : [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
    ]
    let videoImages = Array(1...9).map { "video\($0)" }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
        Image("header")
            .resizable()
            .aspectRatio(contentMode:.fit)
        LazyVGrid(columns: cols){
            ForEach(videoImages, id: \.self){imageName  in
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        Spacer()
        }
    }
}
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
