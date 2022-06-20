//
//  ContentView.swift
//  uitask
//
//  Created by Анастасія Локайчук on 18.06.2022.
//

import SwiftUI

extension View
{
    @ViewBuilder func phoneNavigationView()-> some View {
        if UIDevice.current.userInterfaceIdiom == .phone
        {
            self.navigationViewStyle(.stack)
        } else
        {
            self
        }
    }
}

struct ContentView: View
{
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    @State private var SearchText = ""
    var body: some View
    {
        NavigationView
        {
            List(filtredResorts)
            {
                resort in
                NavigationLink
                {
                    ResortView(resort: resort)
                }
            label:
                {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(.black,lineWidth:1))
                        .frame(width: 40, height: 25)
                    VStack(alignment: .leading)
                    {
                        Text(resort.name).font(.headline)
                        Text("\(resort.runs) runs")
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $SearchText,prompt: "Search for a resort")
        }
        .phoneNavigationView()
    }
    var filtredResorts: [Resort]
    {
        if SearchText.isEmpty
        {
            return resorts
        }else
        {
            return resorts.filter{$0.name.localizedCaseInsensitiveContains(SearchText)}
        }
    }
}


struct ContentView_Previews: PreviewProvider
{
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 11")
                .previewInterfaceOrientation(.portraitUpsideDown)
            ContentView()
                .previewDevice("iPhone 11")
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}

