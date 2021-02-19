import Foundation
import UserNotifications


class Notifications
{
    func SetNotifications()
    {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        var notificationCounter = 0
        var fajrAzaan = false
        var zuhrAzaan = false
        var asrAzaan = false
        var magribAzaan = false
        var ishaAzaan = false
        
        let preferences = UserDefaults.standard
        
        if preferences.object(forKey: "FajrAzaan") != nil
        {
            fajrAzaan = preferences.bool(forKey: "FajrAzaan")
            notificationCounter = notificationCounter + 1
        }
        
        if preferences.object(forKey: "ZuhrAzaan") != nil
        {
            zuhrAzaan = preferences.bool(forKey: "ZuhrAzaan")
            notificationCounter = notificationCounter + 1
        }
        
        if preferences.object(forKey: "AsrAzaan") != nil
        {
            asrAzaan = preferences.bool(forKey: "AsrAzaan")
            notificationCounter = notificationCounter + 1
        }
        
        if preferences.object(forKey: "MagribAzaan") != nil
        {
            magribAzaan = preferences.bool(forKey: "MagribAzaan")
            notificationCounter = notificationCounter + 1
        }
        
        if preferences.object(forKey: "IshaAzaan") != nil
        {
            ishaAzaan = preferences.bool(forKey: "IshaAzaan")
            notificationCounter = notificationCounter + 1
        }
        
        let eachNot = 60 / notificationCounter
        
        for var i in (0..<eachNot)
        {
            let calendar = NSCalendar.current
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd"
            
            let now = NSDate()
            let givenDate = dateFormatter.string(from: now as Date)
            
            var dateComponents = DateComponents()
            dateComponents.year = calendar.component(.year, from: now as Date)
            dateComponents.month = calendar.component(.month, from: now as Date)
            dateComponents.day = calendar.component(.day, from: now as Date) + i
            dateComponents.timeZone = TimeZone(abbreviation: "CST") // Japan Standard Time
            dateComponents.hour = calendar.component(.hour, from: now as Date)
            dateComponents.minute = calendar.component(.minute, from: now as Date)
            
            // Create date from components
            let userCalendar = Calendar.current // user calendar
            let scheduleDate = userCalendar.date(from: dateComponents)
            
            var timings = Theme_Two().getPrayerSchedule(date: givenDate)
            
            dateFormatter.dateFormat = "HH:mm"
            
            let fajrDate = dateFormatter.date(from: timings.fajrAzaan)!
            let zuhrDate = dateFormatter.date(from: timings.zuhrAzaan)!
            let asrDate = dateFormatter.date(from: timings.asrAzaan)!
            let magribDate = dateFormatter.date(from: timings.magribAzaan)!
            let ishaDate = dateFormatter.date(from: timings.ishaAzaan)!
            
            let fajrString = dateFormatter.string(from: fajrDate)
            let zuhrString = dateFormatter.string(from: zuhrDate)
            let asrString = dateFormatter.string(from: asrDate)
            let magribString = dateFormatter.string(from: magribDate)
            let ishaString = dateFormatter.string(from: ishaDate)
            
            if(fajrAzaan == true)
            {
                let prayerArr = fajrString.components(separatedBy: ":")
                let hours = Int(prayerArr[0])
                let minutes = Int(prayerArr[1])
                
                // Specify date components
                var dateComponents2 = DateComponents()
                dateComponents2.year = calendar.component(.year, from: scheduleDate as! Date)
                dateComponents2.month = calendar.component(.month, from: scheduleDate as! Date)
                dateComponents2.day = calendar.component(.day, from: scheduleDate as! Date)
                dateComponents.timeZone = TimeZone(abbreviation: "CST") // Central Standard Time
                dateComponents.hour = hours
                dateComponents.minute = minutes
                
                // Create date from components
                let userCalendar2 = Calendar.current // user calendar
                let someDateTime = userCalendar2.date(from: dateComponents)
                
                var endDate = Date()
                
                if((now as Date) < someDateTime!)
                {
                    endDate = someDateTime!
                }
                else
                {
                    endDate = Calendar.current.date(byAdding: .day, value: 1, to: dateFormatter.date(from: dateFormatter.string(from: someDateTime!))!)!
                }
                
                let differenceInSeconds = Int(endDate.timeIntervalSince(now as Date))
                
                //creating the notification content
                let content = UNMutableNotificationContent()
                content.title = "Fajr time has begun! " + String(fajrAzaan) + " AM"
                content.subtitle = ""
                content.body = "Time to pray Fajr."
                content.badge = 0
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(differenceInSeconds), repeats: false)
                
                //getting the notification request
                let request = UNNotificationRequest(identifier: "FajrAzaanReminder", content: content, trigger: trigger)
                
                //adding the notification to notification center
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
            
            if(zuhrAzaan == true)
            {
                let prayerArr = zuhrString.components(separatedBy: ":")
                let hours = Int(prayerArr[0])
                let minutes = Int(prayerArr[1])
                
                // Specify date components
                var dateComponents2 = DateComponents()
                dateComponents2.year = calendar.component(.year, from: scheduleDate as! Date)
                dateComponents2.month = calendar.component(.month, from: scheduleDate as! Date)
                dateComponents2.day = calendar.component(.day, from: scheduleDate as! Date)
                dateComponents.timeZone = TimeZone(abbreviation: "CST") // Central Standard Time
                dateComponents.hour = hours
                dateComponents.minute = minutes
                
                // Create date from components
                let userCalendar2 = Calendar.current // user calendar
                let someDateTime = userCalendar2.date(from: dateComponents)
                
                var endDate = Date()
                
                if((now as Date) < someDateTime!)
                {
                    endDate = someDateTime!
                }
                else
                {
                    endDate = Calendar.current.date(byAdding: .day, value: 1, to: dateFormatter.date(from: dateFormatter.string(from: someDateTime!))!)!
                }
                
                let differenceInSeconds = Int(endDate.timeIntervalSince(now as Date))
                
                //creating the notification content
                let content = UNMutableNotificationContent()
                content.title = "Zuhr time has begun! " + String(zuhrAzaan) + " PM"
                content.subtitle = ""
                content.body = "Time to pray Zuhr."
                content.badge = 0
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(differenceInSeconds), repeats: false)
                
                //getting the notification request
                let request = UNNotificationRequest(identifier: "ZuhrAzaanReminder", content: content, trigger: trigger)
                
                //adding the notification to notification center
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
            
            if(asrAzaan == true)
            {
                let prayerArr = asrString.components(separatedBy: ":")
                let hours = Int(prayerArr[0])
                let minutes = Int(prayerArr[1])
                
                // Specify date components
                var dateComponents2 = DateComponents()
                dateComponents2.year = calendar.component(.year, from: scheduleDate as! Date)
                dateComponents2.month = calendar.component(.month, from: scheduleDate as! Date)
                dateComponents2.day = calendar.component(.day, from: scheduleDate as! Date)
                dateComponents.timeZone = TimeZone(abbreviation: "CST") // Central Standard Time
                dateComponents.hour = hours
                dateComponents.minute = minutes
                
                // Create date from components
                let userCalendar2 = Calendar.current // user calendar
                let someDateTime = userCalendar2.date(from: dateComponents)
                
                var endDate = Date()
                
                if((now as Date) < someDateTime!)
                {
                    endDate = someDateTime!
                }
                else
                {
                    endDate = Calendar.current.date(byAdding: .day, value: 1, to: dateFormatter.date(from: dateFormatter.string(from: someDateTime!))!)!
                }
                
                let differenceInSeconds = Int(endDate.timeIntervalSince(now as Date))
                
                //creating the notification content
                let content = UNMutableNotificationContent()
                content.title = "Asr time has begun! " + String(zuhrAzaan) + " PM"
                content.subtitle = ""
                content.body = "Time to pray Asr."
                content.badge = 0
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(differenceInSeconds), repeats: false)
                
                //getting the notification request
                let request = UNNotificationRequest(identifier: "AsrAzaanReminder", content: content, trigger: trigger)
                
                //adding the notification to notification center
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
            
            if(magribAzaan == true)
            {
                let prayerArr = magribString.components(separatedBy: ":")
                let hours = Int(prayerArr[0])
                let minutes = Int(prayerArr[1])
                
                // Specify date components
                var dateComponents2 = DateComponents()
                dateComponents2.year = calendar.component(.year, from: scheduleDate as! Date)
                dateComponents2.month = calendar.component(.month, from: scheduleDate as! Date)
                dateComponents2.day = calendar.component(.day, from: scheduleDate as! Date)
                dateComponents.timeZone = TimeZone(abbreviation: "CST") // Central Standard Time
                dateComponents.hour = hours
                dateComponents.minute = minutes
                
                // Create date from components
                let userCalendar2 = Calendar.current // user calendar
                let someDateTime = userCalendar2.date(from: dateComponents)
                
                var endDate = Date()
                
                if((now as Date) < someDateTime!)
                {
                    endDate = someDateTime!
                }
                else
                {
                    endDate = Calendar.current.date(byAdding: .day, value: 1, to: dateFormatter.date(from: dateFormatter.string(from: someDateTime!))!)!
                }
                
                let differenceInSeconds = Int(endDate.timeIntervalSince(now as Date))
                
                //creating the notification content
                let content = UNMutableNotificationContent()
                content.title = "Magrib time has begun! " + String(zuhrAzaan) + " PM"
                content.subtitle = ""
                content.body = "Time to pray Magrib."
                content.badge = 0
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(differenceInSeconds), repeats: false)
                
                //getting the notification request
                let request = UNNotificationRequest(identifier: "MagribAzaanReminder", content: content, trigger: trigger)
                
                //adding the notification to notification center
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
            
            if(ishaAzaan == true)
            {
                let prayerArr = ishaString.components(separatedBy: ":")
                let hours = Int(prayerArr[0])
                let minutes = Int(prayerArr[1])
                
                // Specify date components
                var dateComponents2 = DateComponents()
                dateComponents2.year = calendar.component(.year, from: scheduleDate as! Date)
                dateComponents2.month = calendar.component(.month, from: scheduleDate as! Date)
                dateComponents2.day = calendar.component(.day, from: scheduleDate as! Date)
                dateComponents.timeZone = TimeZone(abbreviation: "CST") // Central Standard Time
                dateComponents.hour = hours
                dateComponents.minute = minutes
                
                // Create date from components
                let userCalendar2 = Calendar.current // user calendar
                let someDateTime = userCalendar2.date(from: dateComponents)
                
                var endDate = Date()
                
                if((now as Date) < someDateTime!)
                {
                    endDate = someDateTime!
                }
                else
                {
                    endDate = Calendar.current.date(byAdding: .day, value: 1, to: dateFormatter.date(from: dateFormatter.string(from: someDateTime!))!)!
                }
                
                let differenceInSeconds = Int(endDate.timeIntervalSince(now as Date))
                
                //creating the notification content
                let content = UNMutableNotificationContent()
                content.title = "Isha time has begun! " + String(zuhrAzaan) + " PM"
                content.subtitle = ""
                content.body = "Time to pray Isha."
                content.badge = 0
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(differenceInSeconds), repeats: false)
                
                //getting the notification request
                let request = UNNotificationRequest(identifier: "IshaAzaanReminder", content: content, trigger: trigger)
                
                //adding the notification to notification center
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
        }
    }
    
    
    
    
    
    func StartFajrChangeReminder(prayerTime : String)
    {
        
    }
    
    func CancelFajrChangeReminder()
    {
        
    }
    
    func StartZuhrChangeReminder(prayerTime : String)
    {
        
    }
    
    func CancelZuhrChangeReminder()
    {
        
    }
    
    func StartAsrChangeReminder(prayerTime : String)
    {
        
    }
    
    func CancelAsrChangeReminder()
    {
        
    }
    
    func StartIshaChangeReminder()
    {
        
    }
    
    func CancelIshaChangeReminder()
    {
        
    }
    
    
    
    
    
    func StartFajrAzaanReminder(prayerTime : String)
    {
        let prayerArr = prayerTime.components(separatedBy: ":")
        let hours = Double(prayerArr[0])
        let minutes = Double(prayerArr[1])
        
        
        
        //creating the notification content
        let content = UNMutableNotificationContent()
        
        //adding title, subtitle, body and badge
        content.title = "Fajr time has begun! " + prayerTime + " AM"
        content.subtitle = ""
        content.body = "Time to pray Fajr."
        content.badge = 0
        
        //getting the notification trigger
        //it will be called after 5 seconds
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        //getting the notification request
        let request = UNNotificationRequest(identifier: "FajrAzaanReminder", content: content, trigger: trigger)
        
        //adding the notification to notification center
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func CancelFajrAzaanReminder()
    {
        
    }
    
    func StartZuhrAzaanReminder(prayerTime : String)
    {
        let prayerArr = prayerTime.components(separatedBy: ":")
        let hours = Double(prayerArr[0])
        let minutes = Double(prayerArr[1])
        
        let seconds = (hours! * 3600) + (minutes! * 60)
        
        
        //creating the notification content
        let content = UNMutableNotificationContent()
        
        //adding title, subtitle, body and badge
        content.title = "Zuhr time has begun! " + prayerTime + " AM"
        content.subtitle = ""
        content.body = "Time to pray Zuhr."
        content.badge = 0
        
        //getting the notification trigger
        //it will be called after 5 seconds
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(seconds), repeats: false)
        
        //getting the notification request
        let request = UNNotificationRequest(identifier: "ZuhrAzaanReminder", content: content, trigger: trigger)
        
        //adding the notification to notification center
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func CancelZuhrAzaanReminder()
    {
        
    }
    
    func StartAsrAzaanReminder(prayerTime : String)
    {
        let prayerArr = prayerTime.components(separatedBy: ":")
        let hours = Int(prayerArr[0])
        let minutes = Int(prayerArr[1])
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        
        let asr = dateFormatter.date(from: prayerTime)
        let asrTime = dateFormatter.string(from: asr!)
        
        //creating the notification content
        let content = UNMutableNotificationContent()
        
        //adding title, subtitle, body and badge
        content.title = "Asr time has begun! " + asrTime + " PM"
        content.subtitle = ""
        content.body = "Time to pray Asr."
        content.badge = 0
        
        //getting the notification trigger
        var dateComponents = DateComponents()
        dateComponents.hour = hours
        dateComponents.minute = minutes
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //getting the notification request
        let request = UNNotificationRequest(identifier: "AsrAzaanReminder", content: content, trigger: trigger)
        
        //adding the notification to notification center
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func CancelAsrAzaanReminder()
    {
        
    }
    
    func StartMagribAzaanReminder(prayerTime : String)
    {
        let prayerArr = prayerTime.components(separatedBy: ":")
        let hours = Double(prayerArr[0])
        let minutes = Double(prayerArr[1])
        
        let seconds = (hours! * 3600) + (minutes! * 60)
        
        
        //creating the notification content
        let content = UNMutableNotificationContent()
        
        //adding title, subtitle, body and badge
        content.title = "Magrib time has begun! " + prayerTime + " AM"
        content.subtitle = ""
        content.body = "Time to pray Magrib."
        content.badge = 0
        
        //getting the notification trigger
        //it will be called after 5 seconds
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(seconds), repeats: false)
        
        //getting the notification request
        let request = UNNotificationRequest(identifier: "MagribAzaanReminder", content: content, trigger: trigger)
        
        //adding the notification to notification center
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func CancelMagribAzaanReminder()
    {
        
    }
    
    func StartIshaAzaanReminder(prayerTime : String)
    {
        let prayerArr = prayerTime.components(separatedBy: ":")
        let hours = Double(prayerArr[0])
        let minutes = Double(prayerArr[1])
        
        let seconds = (hours! * 3600) + (minutes! * 60)
        
        
        //creating the notification content
        let content = UNMutableNotificationContent()
        
        //adding title, subtitle, body and badge
        content.title = "Isha time has begun! " + prayerTime + " AM"
        content.subtitle = ""
        content.body = "Time to pray Isha."
        content.badge = 0
        
        //getting the notification trigger
        //it will be called after 5 seconds
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(seconds), repeats: false)
        
        //getting the notification request
        let request = UNNotificationRequest(identifier: "IshaAzaanReminder", content: content, trigger: trigger)
        
        //adding the notification to notification center
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func CancelIshaAzaanReminder()
    {
        
    }
    
    
    
    
    
    
    
    func StartFajrIqamaReminder()
    {
        
    }
    
    func CancelFajrIqamaReminder()
    {
        
    }
    
    func StartZuhrIqamaReminder()
    {
        
    }
    
    func CancelZuhrIqamaReminder()
    {
        
    }
    
    func StartAsrIqamaReminder()
    {
        
    }
    
    func CancelAsrIqamaReminder()
    {
        
    }
    
    func StartMagribIqamaReminder()
    {
        
    }
    
    func CancelMagribIqamaReminder()
    {
        
    }
    
    func StartIshaIqamaReminder()
    {
        
    }
    
    func CancelIshaIqamaReminder()
    {
        
    }
}
