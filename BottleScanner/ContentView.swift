//
//  ContentView.swift
//  BottleScanner
//
//  Created by Thomas DiZoglio on 2/7/23.
//

import SwiftUI

struct ContentView: View {

    @State private var showFavoritesOnly = false
    @EnvironmentObject var modelData: viewModelBottles
    @State private var addMode = false

    var filteredBottles: [BottleData] {
        modelData.bottles.filter { bottle in
            (!showFavoritesOnly || bottle.isFavorite)
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Toggle(isOn: $showFavoritesOnly) {
                         Text("Favorites only")
                    }
                    ForEach(filteredBottles) { bottle in
                        NavigationLink {
                            BottleDetail(bottle: bottle)
                        } label: {
                            BottleRow(bottle: bottle)
                        }
                    }
                }
                .navigationBarTitle(Text("Your Menu Items"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.addMode = true
                } ) {
                    Image(systemName: "plus")
                        .resizable()
                        .padding(6)
                        .frame(width: 24, height: 24)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                } )
                .navigationDestination(isPresented: $addMode) {
                    AddBottleView()
               }
            }
        }
    }
 
 }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(viewModelBottles())
    }
}
