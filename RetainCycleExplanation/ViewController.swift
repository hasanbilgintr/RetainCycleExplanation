/*
 Hafıza yönetimi ACR (Automatic Reference Counting)
 -https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting/ incelenebilir. Okunmaıs kesşnlşkle tavsiye edildi
 -nil yapılan Bişr değişken arka tarafta bu yapı onu temizler
 Weak ve strong referanslar
 */

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //STRONG
        //        //url ! koydukki bu bir linktir dedik rahat ol
        //        var course : Course? = Course(name: "IOS Course", url: URL(string: "www.hasanbilgin.web.tr")!)
        //        var instructor : Instructor? = Instructor(name: "Hasan Bilgin")
        //
        //
        //        //course = nil
        //        //instructor = nil
        //        /*
        //         //oluşturup direk nil yaparsak
        //         Course IOS Course deinitialized
        //         Instructor Hasan Bilgin deinitialized sonuçlarını alırızı yani hafızadan silinmiştir
        //         */
        //
        //
        //        //ama şölebir kod eklersek
        //                course!.instructor = instructor
        //        instructor!.course = course
        //        course = nil
        //        instructor = nil
        //        //bu sefer ikiside silinmedi ikiside hafızada
        //        //strong Referance olduğu için retain cycle(hafızada bunu tutumak için döngüye sokuyor) yapabilir
        //        //silinmesi için weak yapılması lazımdır
        
        
        
        
        //        //WEAK
        //        var course : WeakCourse? = WeakCourse(name: "IOS Course", url: URL(string: "www.hasanbilgin.web.tr")!)
        //        var instructor : WeakInstructor? = WeakInstructor(name: "Hasan Bilgin")
        ////        course = nil
        ////        instructor = nil
        ////        /*
        ////         //oluşturup direk nil yaparsak
        ////         Course IOS Course deinitialized
        ////         Instructor Hasan Bilgin deinitialized sonuçlarını alırızı yani hafızadan silinmiştir
        ////         */
        //        //weak referance
        //        course!.instructor = instructor
        //        instructor!.course = course
        //        course = nil
        //        instructor = nil
        //        //bölece ikiside silinmiş oldu
        //        //2 tane değişken için hafıza önemli değil ama internetten birşey indirirken sorunlar oluşabilir diyebiliriz
        //        //ondan dolayısıyla WeakSelfExamples açtık orda örnek var
        
        
        //WeakSelfExamples örneği için
        var course : WeakCourse2? = WeakCourse2(name: "IOS Course", url: URL(string: "www.hasanbilgin.com")!)
        var instructor : WeakInstructor2? = WeakInstructor2(name: "Hasan Bilgin")
        
        //weak referance
        course!.instructor = instructor
        instructor!.course = course
        
        course!.launch(launchedCourse: LaunchedCourse(title: "İOs"))
        course = nil
        instructor = nil
        
        
        
        
        
        
    }
    
    
}

