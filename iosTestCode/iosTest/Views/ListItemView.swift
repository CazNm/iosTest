//
//  ListItemView.swift
//  iosTest
//
//  Created by 조승현 on 2021/08/29.
//

import SwiftUI

struct ListItemView: View {
    var name : String
    var centerBuildingName : String
    var address : String
    var updateDate : String

    var body: some View {
        HStack {
            VStack(alignment : .leading) {
                HStack {
                    Text("센터명")
                        .foregroundColor(Color.black)
                    Spacer()
                    Text("\(name)")                        .foregroundColor(Color.black)

                }
                HStack {
                    Text("건물명")                        .foregroundColor(Color.black)
                    Spacer()
                    Text("\(centerBuildingName)")                        .foregroundColor(Color.black)

                }
                HStack {
                    Text("주소")                        .foregroundColor(Color.black)
                    Spacer()
                    Text("\(address)")                        .foregroundColor(Color.black)

                }
                HStack {
                    Text("업데이트 시간")                        .foregroundColor(Color.black)
                    Spacer()
                    Text("\(updateDate)")                        .foregroundColor(Color.black)

                }
                
            }.padding(.leading,10)
            .padding(.trailing, 10)
        
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)

    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(
        name: "testname", centerBuildingName: "center", address: "Seoul", updateDate: "2021-02-21"
        )
    }
}
