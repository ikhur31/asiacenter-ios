//
//  AzaanReminders.swift
//  ASIA Center App
//
//  Created by Ilyas Khurshid on 2/25/18.
//  Copyright © 2018 IKapps. All rights reserved.
//

import UIKit
import UserNotifications

class AzaanReminders: UIViewController {

    @IBOutlet weak var FajrAzaanSwitch: UISwitch!
    @IBOutlet weak var ZuhrAzaanSwitch: UISwitch!
    @IBOutlet weak var AsrAzaanSwitch: UISwitch!
    @IBOutlet weak var MagribAzaanSwitch: UISwitch!
    @IBOutlet weak var IshaAzaanSwitch: UISwitch!
    
    @IBAction func SwitchPressed(_ sender: UISwitch)
    {
        //requesting for authorization
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        })
        
        let now = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        let date = dateFormatter.string(from: now as Date)
        
        var timings = Theme_Two().getPrayerSchedule(date: date)
        dateFormatter.dateFormat = "HH:mm"
        
        let fajr = dateFormatter.date(from: timings.fajrAzaan)!
        let zuhr = dateFormatter.date(from: timings.zuhrAzaan)!
        let asr = dateFormatter.date(from: timings.asrAzaan)!
        let magrib = dateFormatter.date(from: timings.magribAzaan)!
        let isha = dateFormatter.date(from: timings.ishaAzaan)!
        
        dateFormatter.dateFormat = "hh:mm"
        let preferences = UserDefaults.standard
        
        switch sender
        {
        case FajrAzaanSwitch:
            
            if(FajrAzaanSwitch.isOn)
            {
                preferences.set(true, forKey: "FajrAzaan")
                
                //  Save to disk
                preferences.synchronize()
                
                //Notifications().StartFajrAzaanReminder(prayerTime: dateFormatter.string(from: fajr))
                Notifications().SetNotifications()
            }
            else
            {
                preferences.set(false, forKey: "FajrAzaan")
                
                //  Save to disk
                preferences.synchronize()
                
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["FajrAzaanReminder"])
            }
            
            break
        case ZuhrAzaanSwitch:
            
            if(ZuhrAzaanSwitch.isOn)
            {
                preferences.set(true, forKey: "ZuhrAzaan")
                
                //  Save to disk
                preferences.synchronize()
                
                Notifications().StartZuhrAzaanReminder(prayerTime: dateFormatter.string(from: zuhr))
            }
            else
            {
                preferences.set(false, forKey: "ZuhrAzaan")
                
                //  Save to disk
                preferences.synchronize()
                
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["ZuhrAzaanReminder"])
            }
            
            break
        case AsrAzaanSwitch:
            
            if(AsrAzaanSwitch.isOn)
            {
                preferences.set(true, forKey: "AsrAzaan")
                
                //  Save to disk
                preferences.synchronize()
                
                Notifications().StartAsrAzaanReminder(prayerTime: dateFormatter.string(from: asr))
            }
            else
            {
                preferences.set(false, forKey: "AsrAzaan")
                
                //  Save to disk
                preferences.synchronize()
                
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["AsrAzaanReminder"])
            }
            
            break
        case MagribAzaanSwitch:
            
            if(MagribAzaanSwitch.isOn)
            {
                preferences.set(true, forKey: "MagribAzaan")
                
                //  Save to disk
                preferences.synchronize()
                
                Notifications().StartMagribAzaanReminder(prayerTime: dateFormatter.string(from: magrib))
            }
            else
            {
                preferences.set(false, forKey: "MagribAzaan")
                
                //  Save to disk
                preferences.synchronize()
                
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["MagribAzaanReminder"])
            }
            
            break
        case IshaAzaanSwitch:
            
            if(IshaAzaanSwitch.isOn)
            {
                preferences.set(true, forKey: "IshaAzaan")
                
                //  Save to disk
                preferences.synchronize()
                
                Notifications().StartIshaAzaanReminder(prayerTime: dateFormatter.string(from: isha))
            }
            else
            {
                preferences.set(false, forKey: "IshaAzaan")
                
                //  Save to disk
                preferences.synchronize()
                
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["IshaAzaanReminder"])
            }
            
            break
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let preferences = UserDefaults.standard
        
        if preferences.object(forKey: "FajrAzaan") != nil
        {
            FajrAzaanSwitch.setOn(true, animated: true)
        }
        
        if preferences.object(forKey: "ZuhrAzaan") != nil
        {
            ZuhrAzaanSwitch.setOn(true, animated: true)
        }
        
        if preferences.object(forKey: "AsrAzaan") != nil
        {
            AsrAzaanSwitch.setOn(true, animated: true)
        }
        
        if preferences.object(forKey: "MagribAzaan") != nil
        {
            MagribAzaanSwitch.setOn(true, animated: true)
        }
        
        if preferences.object(forKey: "IshaAzaan") != nil
        {
            IshaAzaanSwitch.setOn(true, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
