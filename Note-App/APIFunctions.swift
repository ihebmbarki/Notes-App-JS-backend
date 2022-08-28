//
//  APIFunctions.swift
//  Note-App
//
//  Created by iheb mbarki on 19/8/2022.
//

import Foundation
import Alamofire



struct Note: Decodable {
    var _id: String
    var title: String
    var date: String
    var note: String
}


class APIFunctions {
    
    var delegate: DataDelegate?
    static let functions = APIFunctions()
    
    func fetchNotes() {
        
        AF.request("http://192.168.1.175:8081/fetch").response { response in
            
            print(response.data!)
            let data = String(data: response.data!, encoding: .utf8)
            self.delegate?.updateArray(newArray: data!)
        }
    }
}




func addNote(title: String, date: String, note: String){
    
    AF.request("http://192.168.1.175:8081/create", method: .post, encoding: URLEncoding.httpBody, headers: ["title":title, "date": date, "note": note]).responseJSON { response in
        print(response)
    }
}

func updateNote(title: String, date: String, note: String, id: String) {
    AF.request("http://192.168.1.175:8081/update", method: .post ,encoding: URLEncoding.httpBody, headers: ["title": title, "date": date, "note": note, "id": id]).responseJSON { response in
        print(response)
    }
}


