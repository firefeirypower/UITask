//
//  ResortView.swift
//  uitask
//
//  Created by Анастасія Локайчук on 19.06.2022.
//
import SwiftUI


struct ResortView: View
{
    let resort : Resort
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var TypeSize
    var body: some View
    {
        ScrollView
        {
                VStack(alignment: .leading, spacing: 0)
            {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                HStack{
                    if sizeClass == .compact && TypeSize > .large {
                        VStack(spacing: 10)
                        {
                            ResortDetails(resort: resort)}
                        VStack(spacing:10) {SkieDetailsView(resort: resort)}
                    }else{
                    ResortDetails(resort: resort)
                    SkieDetailsView(resort: resort)
                    }}.padding(.vertical)
                    .background(Color.primary.opacity(0.1))
                Group
                {
                    Text(resort.description)
                        .padding(.vertical)
                    Text("Facilities")
                        .font(.headline)
                    Text(resort.facilities, format: .list(type: .and))
                        .padding(.vertical)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}


struct ResortView_Previews: PreviewProvider
{
    static var previews: some View
    {
        NavigationView
        {   ResortView(resort: Resort.example)
        }
    }
}

