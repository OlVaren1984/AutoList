//
//  Auto.swift
//  Avto_list
//
//  Created by Олег Варенников  on 26.01.2024.
//

struct Auto {
    let brand: String
    let model: String
    
    // создаем гетер
    var name: String {
        "\(brand)-\(model)"
    }
}

extension Auto {
    static func getAuto() -> [Auto] {
        return [
            Auto(brand: "AUDI", model: "6 (2023)"),
            Auto(brand: "BMW", model: "F10 (M5 Version)"),
            Auto(brand: "FERRARI", model: "F12 (2022)"),
            Auto(brand: "HONDA", model: "ACCORD (2012)"),
            Auto(brand: "LAMBORGHINI", model: "AVENTADOR (2022)"),
            Auto(brand: "MAZDA", model: "6 (2022)"),
            Auto(brand: "MERSEDES", model: "S500 (Special version)"),
            Auto(brand: "PORSHCE", model: "MACAN (T 2023)"),
            Auto(brand: "SUBARU", model: "FORESTER"),
            Auto(brand: "VOLKSWAGEN", model: "PASSAT (2020)")
        ]
    }
}


