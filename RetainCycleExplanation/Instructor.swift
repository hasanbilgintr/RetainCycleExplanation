//
//  Instructor.swift
//  RetainCycleExplanation
//
//  Created by hasan bilgin on 2.12.2023.
//

import Foundation

//eğitmen
class Instructor {
    let name : String
    var course : Course?
    
    //init istemesinin  objelerin bir değeri olması lazım name in bir değeri yoktur , = "" olmsaydı, = nil , = "hasan"  yada ? opsional denilseydi init istemezdi course istemediği gibi
    //init hafızaya almak gibi düşünebiliriz
    init(name: String) {
        self.name = name
    }
    
    //çok fazla kullanmıyoruz
    //hafızadan çıkarıldığında bu çalışır!!!
    deinit{
        print("Instructor \(name) deinitialized")
    }
    
    

}

//kurs
class Course {
    let name : String
    let url : URL
    var instructor : Instructor?
    
    init(name: String, url: URL) {
        self.name = name
        self.url = url
    }
    
    deinit{
        print("Course \(name) deinitialized")
    }
    
}
