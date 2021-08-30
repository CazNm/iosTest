import SwiftUI

struct ListItemDetailView: View {
    
    var data : CenterData
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack {
                HStack {
                    ContainerView(imageName: "hospital", paddingsize: 20, width: 170, height: 200,
                    dataName: "센터명",
                    data: "\(data.centerName)"
                    )
                        .padding(.leading, 15)
                    Spacer()
                    ContainerView(imageName: "building", paddingsize: 20, width: 170, height: 200,
                                  dataName: "건물명",
                                  data: "\(data.facilityName)"
)
                        .padding(.trailing, 15)
                }
                
                HStack {
                    ContainerView(imageName: "telephone", paddingsize: 20, width: 170, height: 200,
                                  dataName: "전화번호",
                                  data: "\(data.phoneNumber)"
                    )
                        .padding(.leading, 15)
                    Spacer()

                    ContainerView(imageName: "chat", paddingsize: 20, width: 170, height: 200,
                                  dataName: "업데이트 시간",
                                  data: "\(data.updatedAt)"
)
                        .padding(.trailing, 15)
                }
                
                ContainerView(imageName: "placeholder", paddingsize: 20, width: 360, height: 250,
                              dataName: "주소",
                              data: "\(data.address)"
)
                
            }
        }
    }
}

struct ContainerView: View {
    
    var imageName : String
    var paddingsize : CGFloat
    var width : CGFloat
    var height : CGFloat
    var dataName : String
    var data : String
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                Image("\(imageName)")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.bottom, 0)
                
                Text("\(dataName)")
                
                Text("\(data)")
            }
            
        }.frame(width: width, height: height)
        .padding(.bottom, 10)
        
    }
}

struct ListItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text("hello world")
    }
}
