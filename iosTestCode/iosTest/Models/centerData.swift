//
//  centerData.swift
//  iosTest
//
//  Created by 조승현 on 2021/08/29.
//

import Foundation

struct ServerResponse : Decodable {
    var currentCount : Int
    var data : [CenterData]
}

struct CenterData : Decodable, Identifiable, Hashable {
    
    var address : String
    var centerName : String
    var centerType : String
    var createdAt : String
    var facilityName : String
    var id : Int
    var lat : String
    var lng : String
    var org : String
    var phoneNumber : String
    var sido : String
    var sigungu : String
    var updatedAt : String
    var zipCode : String

}
//"address": "울산시 중구 염포로 85",
//     "centerName": "코로나19 울산광역시 중구 예방접종센터",
//     "centerType": "지역",
//     "createdAt": "2021-03-15 00:03:44",
//     "facilityName": "동천체육관",
//     "id": 11,
//     "lat": "35.562451",
//     "lng": "129.350436",
//     "org": "",
//     "phoneNumber": "052-290-4941",
//     "sido": "울산광역시",
//     "sigungu": "중구",
//     "updatedAt": "2021-07-16 04:55:11",
//     "zipCode": "44497"




// "currentCount": 10,
//"data"

class Api : ObservableObject{
//    @Published var centerDatas = [CenterData]()
    
    func loadData(completion:@escaping (ServerResponse) -> ()) {
        
        print("why cant test")
        guard let url = URL(string: "https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=10&serviceKey=bNmSjmL3NWL%2FmAmsQV0SyDT%2B8DCdZckhVg5%2FtSsmJHa47eBZBE%2BaFvCHYxeM1Dsz2FcgQ64elqYL3mr6GUyjOg%3D%3D") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            let datas = try! JSONDecoder().decode(ServerResponse.self, from: data!)
            print(datas)
            DispatchQueue.main.async {
                completion(datas)
            }
        }.resume()
        
    }
}

