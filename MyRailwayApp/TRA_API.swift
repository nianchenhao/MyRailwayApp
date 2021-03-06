//
//  TRA_API.swift
//  MyRailwayApp
//
//  Created by 粘辰晧 on 2021/5/5.
//

import Foundation
import CryptoKit

struct Station: Codable {
    var StationID: String
    var StationName: NameType
    var StationPosition: StationPositionType
    var StationClass: String
    
    static func saveToFile(stations:[Station]){
        let saveStations = try? JSONEncoder().encode(stations)
        UserDefaults.standard.set(saveStations, forKey: "Stations")
    }
    static func loadFromFile() -> [Station]? {
        guard let loadDate = UserDefaults.standard.data(forKey: "Stations") else {return nil}
        return try? JSONDecoder().decode([Station].self, from: loadDate)
    }
}

struct StationDetail: Codable {
    var StationID: String
    var StationName: NameType
    var Direction: Int
    var TrainTypeName: NameType
    var EndingStationName: NameType
    var ScheduledDepartureTime: String
    var DelayTime: Int
}

struct NameType: Codable {
    var Zh_tw: String
    var En: String
}

struct StationPositionType: Codable {
    var PositionLat: Float
    var PositionLon: Float
    
}

// 自己申請的ID,KEY
let APP_ID = "a83758b88e3247e9b0e8d9556b23bcd1"
let APP_KEY = "u6nXlxGB2dNLBFYbKrPEK11f3gk"

let xdate = getTimeString()
let signDate = "x-date: " + xdate

let key = SymmetricKey(data: Data(APP_KEY.utf8))
let hmac = HMAC<SHA256>.authenticationCode(for: Data(signDate.utf8), using: key)
let base64HmacString = Data(hmac).base64EncodedString()
let authorization = """
    hmac username="\(APP_ID)", algorithm="hmac-sha256", headers="x-date", signature="\(base64HmacString)"
    """

func getTimeString() -> String {
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = "EEE, dd MMM yyyy HH:mm:ww zzz"
    dateFormater.locale = Locale(identifier: "en_US")
    dateFormater.timeZone = TimeZone(secondsFromGMT: 0)
    
    let time = dateFormater.string(from: Date())
    return time
}
