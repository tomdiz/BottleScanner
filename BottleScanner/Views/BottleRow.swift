//
//  BottleRow.swift
//  BottleScanner
//
//  Created by Thomas DiZoglio on 2/7/23.
//

import SwiftUI

struct BottleRow: View {
    
    var bottle: BottleData
    
    var body: some View {
        HStack {
            bottle.image
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 2) {
                Text(bottle.name)
                Text("\(bottle.sodiumMg) mg Sodium")
                Text("\(bottle.sizeOz) oz")
            }

            Spacer()
            
            if bottle.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {

    static var bottles = viewModelBottles().bottles

    static var previews: some View {
        Group {
            BottleRow(bottle: bottles[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
     }
}
