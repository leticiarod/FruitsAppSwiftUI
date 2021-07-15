//
//  ContentView.swift
//  FruitsApp
//
//  Created by Leticia Rodriguez on 7/14/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @State private var isShowingSettings = false
    
    var fruits: [Fruit] = fruitsData
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(
                        destination: FruitDetailView(fruit: item)) {
                        FruitRowView(fruit: item)
                            .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(trailing:
            
                                    Button(action: {
                                        isShowingSettings = true
                                    }, label: {
                                        Image(systemName: "slider.horizontal.3")
                                    }) //: BUTTON
                                    .sheet(isPresented: $isShowingSettings, content: {
                                        SettingsView()
                                    })
            )
        } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle()) // <-- for fixing ipad
    }
}

// MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
            .previewDevice("iPhone 11 Pro")
    }
}
