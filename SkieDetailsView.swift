//
//  SkieDetailsView.swift
//  uitask
//
//  Created by Анастасія Локайчук on 19.06.2022.
//

import SwiftUI


struct SkieDetailsView: View
{
    let resort : Resort
    var body: some View
    {
        Group
        {
            VStack
            {
                Text("Elevation")
                    .font(.caption.bold())
                Text("\(resort.elevation)m").font(.title3)
            }
            
            VStack
            {
                Text("Snow")
                    .font(.caption.bold())
                Text("\(resort.snowDepth)cm")
                    .font(.title3)
            }
            
        }.frame(maxWidth:.infinity)
        
    }
    
}


struct SkieDetailsView_Previews: PreviewProvider
{
    static var previews: some View
    {
        NavigationView
        {   SkieDetailsView(resort: Resort.example)
        }
    }
}

