//
//  ContentView.swift
//  iosTest
//
//  Created by 조승현 on 2021/08/29.
//

import SwiftUI

struct ContentView: View {
    
    @State private var serverResponse: ServerResponse?
    
    var body: some View{
        ZStack{
            NavigationView{
                ScrollViewReader{
                    proxyReader in
                    
                    
                    ScrollView() {

                        ForEach(serverResponse?.data ?? [], id : \.self) {
                            data in
                            NavigationLink(
                                destination: ListItemDetailView(
                                    data: data)
                            
                        ) {
                                ListItemView(
                                    name: data.centerName, centerBuildingName: data.facilityName, address: data.address, updateDate: data.updatedAt
                                )  .id("Scroll_to_top")
                                
                                
                            }
                            Divider()
                              
                            
                        }
                        
                    }
//                    List(serverResponse?.data ?? [], id: \.self){
//                        data in
//
//                        NavigationLink(
//                            destination: ListItemDetailView(
//                                data: data)
//
//                    ) {
//                            ListItemView(
//                                name: data.centerName, centerBuildingName: data.facilityName, address: data.address, updateDate: data.updatedAt
//                            )  .id("Scroll_to_top")
//                        }
//
//
//                    }
                    
                    .overlay(
                        Button(action: {
                            withAnimation(.spring()){
                                proxyReader.scrollTo("Scroll_to_top", anchor: .top)
                            }
                        }, label: {
                          Image("top-alignment")
                              .resizable()
                              .frame(width: 30, height: 30)
                        })
                        .frame(width: 60, height: 60)
                        .background(Color.white)
                        .cornerRadius(50)
                        .padding()
                        .shadow(color: Color.black.opacity(0.5),
                                radius: 3,
                                x: 3,
                                y: 3)
                        ,alignment: .bottomTrailing
                    )
                    .navigationBarTitle(Text("예방접종 센터 리스트"))
                    .onAppear() {
                        Api().loadData {(serverResponse) in
                            self.serverResponse = serverResponse
                            
                        }
                        
                    }
                }
                
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
