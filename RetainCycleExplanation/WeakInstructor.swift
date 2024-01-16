//
//  WeakInstructor.swift
//  RetainCycleExplanation
//
//  Created by hasan bilgin on 2.12.2023.
//

import Foundation

//tamamen Instructordan kopyaladık. Classların başına Weak ekledik. ve değişiklikler yapıldı . Birine weak ekledik
//eğitmen
class WeakInstructor {
    let name : String
    var course : WeakCourse?

    init(name: String) {
        self.name = name
    }
    

    deinit{
        print("Instructor \(name) deinitialized")
    }
    
    

}

//kurs
class WeakCourse {
    let name : String
    let url : URL
    //weak ekledik sadece buna ekledik
    weak var instructor : WeakInstructor?
    
    init(name: String, url: URL) {
        self.name = name
        self.url = url
    }
    
    deinit{
        print("Course \(name) deinitialized")
    }
    
}
