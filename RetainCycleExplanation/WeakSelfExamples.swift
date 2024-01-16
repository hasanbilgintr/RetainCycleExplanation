//
//  WeakSelfExamples.swift
//  RetainCycleExplanation
//
//  Created by hasan bilgin on 2.12.2023.
//

import Foundation

//struct ile class arasında class referans ile struct ise value type yani herseferinde instance oluşturur herseferinde avcantajıda o diyebiliriz genel olarak
struct LaunchedCourse {
    let title : String
    var isLaunched : Bool = false
    init(title: String) {
        self.title = title

    }
}

//eğitmen
class WeakInstructor2 {
    let name : String
    var course : WeakCourse2?

    init(name: String) {
        self.name = name
    }
    deinit{
        print("WeakInstructor2 \(name) deinitialized")
    }
}

//kurs
class WeakCourse2 {
    let name : String
    let url : URL
    //weak ekledik sadece buna ekledik
    weak var instructor : WeakInstructor2?
    var launchedCourses : [LaunchedCourse] = []
    var onlaunched : ((_ launchedCourse : LaunchedCourse) -> Void)?
    
    func launch (launchedCourse : LaunchedCourse) {
        //async 1 saniye sonra işlemini yapacak demektir
        DispatchQueue.main.asyncAfter(deadline: .now()+1) { /* [weak self] in*/
            //burdaydı kaldırıldı çünkü direk bağlantıyı nil ediyo işlem yapamdna ondna dolayı aşağı alındı
//            self?.launchedCourses.append(launchedCourse)
//            print("launch course count: \(self?.launchedCourses.count)")
            
            self.onlaunched?(launchedCourse)
        }
    }
    
    init(name: String, url: URL) {
        self.name = name
        self.url = url
        
        //weak opsional yapar tüm değişkenlerini. nil olucağı kesinse kullanılabilir yada yüklü bir değişkendir temizlenmesi gerekiyordu filan
        //unowned ise opsional istemez ama  bide değişken nil olmazsa bile  ben onun temizleme yolunu ararım bağlantı koptuysa temizlerim ama bu doğru kullanılmazsa creşlere yol açar temizlenmemesi gereken birşeyide temizlettirebilirsiniz. ondan dolayı ne yaptığını bilmiyorsan kullanma  unowned yı
        onlaunched = { [weak self] launchedCourse in
            self?.launchedCourses.append(launchedCourse)
            print("launch course count: \(self?.launchedCourses.count)")
        }
        
        
    }
    
    deinit{
        print("WeakCourse2 \(name) deinitialized")
    }
    
    
    /*
     WeakInstructor2 Hasan Bilgin deinitialized
     launch course count: Optional(1)
     WeakCourse2 IOS Course deinitialized  somnuç verdi
     WeakCourse2 IOS Course deinitialized  somnuç verdi
     */
}
