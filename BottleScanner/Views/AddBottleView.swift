//
//  AddBottleView.swift
//  BottleScanner
//
//  Created by Thomas DiZoglio on 2/7/23.
//

import SwiftUI
import CodeScanner

struct AddBottleView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isPresented = false
    @EnvironmentObject var modelData: viewModelBottles

    var body: some View {
        VStack {
            Text("Pick A Method")
                .font(.headline)

            Button(action: {}) {
                HStack {
                    Image(systemName: "list.bullet")
                    Text("Select Item From List")
                }
            }
            .font(.system(size: 17))
            .fontWeight(.none)
            .foregroundColor(.black)
            .frame(width: 300.0, height: 100.0)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 2))

            Button(action: {
                isPresented.toggle()
            }) {
                HStack {
                    Image(systemName: "barcode.viewfinder")
                    Text("Select Item's Barcode")
                }
            }
            .font(.system(size: 17))
            .fontWeight(.none)
            .foregroundColor(.black)
            .frame(width: 300.0, height: 100.0)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 2))
            .fullScreenCover(isPresented: $isPresented) {
                CodeScannerView(codeTypes: [.qr, .ean13, .code128]) { response in
                    if case let .success(result) = response {
                        print("scannedCode = " + result.string)
                        var newBottle = BottleData.init()
                        newBottle.name = result.string
                        newBottle.isFavorite = true
                        newBottle.id = 1005
                        modelData.bottles.append(newBottle)
                        dismiss()
                    }
                }

            }

            Button(action: {}) {
                HStack {
                    Image(systemName: "pencil")
                    Text("Enter Item Manually")
                }
            }
            .font(.system(size: 17))
            .fontWeight(.none)
            .foregroundColor(.black)
            .frame(width: 300.0, height: 100.0)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 2))

        }
    }
}

struct AddBottleView_Previews: PreviewProvider {
    static var previews: some View {
        AddBottleView()
            .environmentObject(viewModelBottles())
    }
}
