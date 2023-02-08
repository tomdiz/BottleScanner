//
//  BottleDetail.swift
//  BottleScanner
//
//  Created by Thomas DiZoglio on 2/7/23.
//

import SwiftUI

struct BottleDetail: View {
    var bottle: BottleData

    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            bottle.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250)
            Text(bottle.name)
                .font(.largeTitle)
            Text("\(bottle.sodiumMg) mg Sodium")
            Text("\(bottle.sizeOz) oz")
        }
    }
}

struct BottleDetail_Previews: PreviewProvider {
    static var bottles = viewModelBottles().bottles

    static var previews: some View {
        Group {
            BottleDetail(bottle: bottles[2])
        }
    }
}
