//
//  Initialize.swift
//  ASIA Center App
//
//  Created by Ilyas Khurshid on 1/8/18.
//  Copyright © 2018 IKapps. All rights reserved.
//

import Foundation
import UIKit
import SQLite
import Firebase
import FirebaseDatabase

class Initialize: UIViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        checkFirebaseDBForTimings()
        UserDefaults.standard.set(false, forKey: "Pref_FirstTime")
        
        let when = DispatchTime.now() + 2 // change # to desired number of seconds
        
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.performSegue(withIdentifier: "GoToTheme_Two", sender: self)
        }
    }
    
    func checkFirebaseDBForTimings()
    {
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        ref.child("schedule").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            let version = value?["version"] as? String ?? "0.0.0"
            
            if (UserDefaults.standard.object(forKey: "version") != nil)
            {
                //  Does exist
                if(UserDefaults.standard.string(forKey: "version") != version)
                {
                    self.savePrayerTimingsToDataBase(prayerTimings: value!)
                }
            }
            else
            {
                self.savePrayerTimingsToDataBase(prayerTimings: value!)
            }
            
            UserDefaults.standard.set(version, forKey: "version")
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func savePrayerTimingsToDataBase(prayerTimings : NSDictionary)
    {
        // Create Database
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PrayerSchedule.sqlite")
        
        var db: OpaquePointer?
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS PrayerSchedule (DATE TEXT, FAJRAZAAN TEXT, FAJRIQAMA TEXT, SUNRISE TEXT, ZUHRAZAAN TEXT, ZUHRIQAMA TEXT, ASRAZAAN TEXT, ASRIQAMA TEXT, MAGRIBAZAAN TEXT, ISHAAZAAN TEXT, ISHAIQAMA TEXT)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        print(paths[0])
        
        addDayToDatabase(db: db, actual_month : "01", prayerMonth: prayerTimings["01"] as! NSDictionary) // jan
        addDayToDatabase(db: db, actual_month : "02",prayerMonth: prayerTimings["02"] as! NSDictionary) // feb
        addDayToDatabase(db: db, actual_month : "03",prayerMonth: prayerTimings["03"] as! NSDictionary)
        addDayToDatabase(db: db, actual_month : "04",prayerMonth: prayerTimings["04"] as! NSDictionary)
        addDayToDatabase(db: db, actual_month : "05",prayerMonth: prayerTimings["05"] as! NSDictionary)
        addDayToDatabase(db: db, actual_month : "06",prayerMonth: prayerTimings["06"] as! NSDictionary)
        addDayToDatabase(db: db, actual_month : "07",prayerMonth: prayerTimings["07"] as! NSDictionary)
        addDayToDatabase(db: db, actual_month : "08",prayerMonth: prayerTimings["08"] as! NSDictionary)
        addDayToDatabase(db: db, actual_month : "09",prayerMonth: prayerTimings["09"] as! NSDictionary)
        addDayToDatabase(db: db, actual_month : "10",prayerMonth: prayerTimings["10"] as! NSDictionary)
        addDayToDatabase(db: db, actual_month : "11",prayerMonth: prayerTimings["11"] as! NSDictionary)
        addDayToDatabase(db: db, actual_month : "12",prayerMonth: prayerTimings["12"] as! NSDictionary)
    }
    
    func addDayToDatabase(db : OpaquePointer?, actual_month : NSString, prayerMonth : NSDictionary)
    {
        //creating a statement
        var stmt: OpaquePointer?
        
        //the insert query
        let queryString = "INSERT INTO PrayerSchedule (DATE, FAJRAZAAN, FAJRIQAMA, SUNRISE, ZUHRAZAAN, ZUHRIQAMA, ASRAZAAN, ASRIQAMA, MAGRIBAZAAN, ISHAAZAAN, ISHAIQAMA) VALUES (?,?,?,?,?,?,?,?,?,?,?)"
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        for n in 1...31
        {
            var day = "01"
            
            if(n == 1)
            {
                
            }
            else if(n == 2)
            {
                day = "02"
            }
            else if(n == 3)
            {
                day = "03"
            }
            else if(n == 4)
            {
                day = "04"
            }
            else if(n == 5)
            {
                day = "05"
            }
            else if(n == 6)
            {
                day = "06"
            }
            else if(n == 7)
            {
                day = "07"
            }
            else if(n == 8)
            {
                day = "08"
            }
            else if(n == 9)
            {
                day = "09"
            }
            else
            {
                day = String(n)
            }
            
            if(actual_month as String == "02" && day == "30")
            {
                return
            }
            else if(day == "31" && (actual_month as String == "04" || actual_month as String == "06" || actual_month as String == "09" || actual_month as String == "11"))
            {
                return
            }
            
            let prayerDay = prayerMonth[day] as! NSDictionary
            
            let fajr = prayerDay["fajr"] as! NSDictionary
            let sunrise = prayerDay["sunrise"] as! String
            let zuhr = prayerDay["zuhr"] as! NSDictionary
            let asr = prayerDay["asr"] as! NSDictionary
            let magrib = prayerDay["magrib"] as! NSDictionary
            let isha = prayerDay["isha"] as! NSDictionary
            
            
            let fajrAzaan = fajr["azaan"] as! String
            let fajrIqama = fajr["iqama"] as! String
            
            let zuhrAzaan = zuhr["azaan"] as! String
            let zuhrIqama = zuhr["iqama"] as! String
            
            let asrAzaan = asr["azaan"] as! String
            let asrIqama = asr["iqama"] as! String
            
            let magribAzaan = magrib["azaan"] as! String
            
            let ishaAzaan = isha["azaan"] as! String
            let ishaIqama = isha["iqama"] as! String
            
            let final_date = (actual_month as String) + "/" + day
            
            let SQLITE_TRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
            
            if sqlite3_bind_text(stmt, 1, final_date, -1, SQLITE_TRANSIENT) != SQLITE_OK
            {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt, 2, fajrAzaan, -1, SQLITE_TRANSIENT) != SQLITE_OK
            {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt, 3, fajrIqama, -1, SQLITE_TRANSIENT) != SQLITE_OK
            {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt, 4, sunrise, -1, SQLITE_TRANSIENT) != SQLITE_OK
            {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt, 5, zuhrAzaan, -1, SQLITE_TRANSIENT) != SQLITE_OK
            {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt, 6, zuhrIqama, -1, SQLITE_TRANSIENT) != SQLITE_OK
            {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt, 7, asrAzaan, -1, SQLITE_TRANSIENT) != SQLITE_OK
            {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt, 8, asrIqama, -1, SQLITE_TRANSIENT) != SQLITE_OK
            {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt, 9, magribAzaan, -1, SQLITE_TRANSIENT) != SQLITE_OK
            {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt, 10, ishaAzaan, -1, SQLITE_TRANSIENT) != SQLITE_OK
            {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt, 11, ishaIqama, -1, SQLITE_TRANSIENT) != SQLITE_OK
            {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            
            //executing the query to insert values
            if sqlite3_step(stmt) != SQLITE_DONE {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure inserting hero: \(errmsg)")
                return
            }
            
            sqlite3_reset(stmt)
        }
        
        sqlite3_finalize(stmt);
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
