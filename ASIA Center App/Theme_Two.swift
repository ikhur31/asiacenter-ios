//
//  ViewController.swift
//  ASIA Center App
//
//  Created by Ilyas Khurshid on 1/3/18.
//  Copyright © 2018 IKapps. All rights reserved.
//

import UIKit
import CountdownLabel
import SQLite

class Theme_Two: UIViewController
{
    
    @IBOutlet weak var DonateButton: UIImageView!
    
    @IBOutlet weak var EmailButton: UIImageView!
    
    @IBOutlet weak var WebsiteButton: UIImageView!
    
    @IBOutlet weak var TwitterButton: UIImageView!
    
    @IBOutlet weak var FacebookButton: UIImageView!
    
    @IBOutlet weak var QuoteofTheDayLabel: UILabel!
    @IBOutlet weak var icon_Calender: UIButton!
    @IBOutlet weak var icon_Right: UIButton!
    @IBOutlet weak var icon_Left: UIButton!
    @IBOutlet weak var fajrTime: UILabel!
    @IBOutlet weak var zuhrTime: UILabel!
    @IBOutlet weak var asrTime: UILabel!
    @IBOutlet weak var magribTime: UILabel!
    @IBOutlet weak var ishaTime: UILabel!
    @IBOutlet weak var azaanIqamaSegment: UISegmentedControl!
    @IBOutlet weak var sunriseTime: UILabel!
    @IBOutlet weak var SelectedDateLabel: UITextField!
    
    @IBOutlet weak var zuhrTitle: UILabel!
    
    @IBOutlet weak var layout_IslamicQuote: UIView!
    
    @IBOutlet weak var layout_IslamicQuoteTitle: UIView!
    
    @IBOutlet weak var layout_Quote: UIView!
    
    @IBOutlet weak var toolbar: UINavigationItem!
    @IBOutlet weak var root: UIView!
    @IBOutlet weak var layout_date: UIView!
    
    @IBOutlet weak var label_day: UILabel!
    @IBOutlet weak var label_date: UILabel!
    @IBOutlet weak var label_islamicDate: UILabel!
    @IBOutlet weak var label_islamicYear: UILabel!
    @IBOutlet weak var label_nextPrayer: UILabel!
    @IBOutlet weak var countDownLabel: CountdownLabel!
    
    @IBOutlet weak var layout_prayers: UIView!
    @IBOutlet weak var layout_azaan_iqama: UIView!
    
    @IBOutlet weak var layout_right_left: UIView!
    
    @IBOutlet weak var layout_externalLinks: UIView!
    
    @IBOutlet weak var layout_externalLinksTitle: UIView!
    
    @IBOutlet weak var layout_externalLinksBody: UIView!
    
    @IBOutlet weak var label_version: UILabel!
    
    
    
    
    
    
    
    
    var date = String()
    var wrongDate = Bool()
    var azaanIqamaOptions = ["Azaan","Iqama"]
    var countdownTimer: Timer!
    var differenceInSeconds = 60
    var database: Connection!
    var selectedDate = "Empty"
    private var datePicker: UIDatePicker?

    
    @IBAction func azaanIqamaSegmentChanged(_ sender: Any)
    {
        switch azaanIqamaSegment.selectedSegmentIndex
        {
        case 0: // Azaan
            setAzaanIqama(date: date, currentSegment: "Azaan")
            break
        case 1: // Iqama
            setAzaanIqama(date: date, currentSegment: "Iqama")
            break
        default:
            break
        }
    }
    
    @IBAction func ButtonPressed(sender: UIButton)
    {
        if(selectedDate == "Empty")
        {
            selectedDate = date;
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        
        switch sender
        {
        case icon_Right:
            let givenDate = Calendar.current.date(byAdding: .day, value: 1, to: dateFormatter.date(from: selectedDate)!)
            
            selectedDate = dateFormatter.string(from: givenDate!)
            setAzaanIqama(date: selectedDate, currentSegment: azaanIqamaOptions[azaanIqamaSegment.selectedSegmentIndex])
            break
        case icon_Left:
            let givenDate = Calendar.current.date(byAdding: .day, value: -1, to: dateFormatter.date(from: selectedDate)!)
            
            selectedDate = dateFormatter.string(from: givenDate!)
            setAzaanIqama(date: selectedDate, currentSegment: azaanIqamaOptions[azaanIqamaSegment.selectedSegmentIndex])
            break
        case icon_Calender:
            break
        default:
            break
        }
        
        if(selectedDate == date)
        {
            SelectedDateLabel.text = "Today"
        }
        else
        {
            SelectedDateLabel.text = selectedDate
        }
    }

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: CGFloat(98.0/255.0), green: CGFloat(0/255.0), blue: CGFloat(238.0/255.0), alpha: CGFloat(1.0))
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // Set Cardview effects
        
        layout_date.layer.cornerRadius = 5.0
        layout_date.layer.shadowColor = UIColor.gray.cgColor
        layout_date.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layout_date.layer.shadowRadius = 5.0
        layout_date.layer.shadowOpacity = 0.7
        
        layout_prayers.layer.cornerRadius = 5.0
        layout_prayers.layer.shadowColor = UIColor.gray.cgColor
        layout_prayers.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layout_prayers.layer.shadowRadius = 5.0
        layout_prayers.layer.shadowOpacity = 0.7
        
        layout_IslamicQuote.layer.cornerRadius = 5.0
        layout_IslamicQuote.layer.shadowColor = UIColor.gray.cgColor
        layout_IslamicQuote.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layout_IslamicQuote.layer.shadowRadius = 5.0
        layout_IslamicQuote.layer.shadowOpacity = 0.7
        
        layout_externalLinks.layer.cornerRadius = 5.0
        layout_externalLinks.layer.shadowColor = UIColor.gray.cgColor
        layout_externalLinks.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layout_externalLinks.layer.shadowRadius = 5.0
        layout_externalLinks.layer.shadowOpacity = 0.7
        
        SelectedDateLabel.layer.masksToBounds = true
        SelectedDateLabel.layer.cornerRadius = 5.0
        SelectedDateLabel.layer.shadowColor = UIColor.gray.cgColor
        SelectedDateLabel.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        SelectedDateLabel.layer.shadowRadius = 5.0
        SelectedDateLabel.layer.shadowOpacity = 0.7
        
        layout_azaan_iqama.layer.cornerRadius = 5.0
        layout_right_left.layer.cornerRadius = 5.0
        
        layout_IslamicQuoteTitle.layer.cornerRadius = 5.0
        layout_Quote.layer.cornerRadius = 5.0
        
        layout_externalLinksTitle.layer.cornerRadius = 5.0
        layout_externalLinksBody.layer.cornerRadius = 5.0
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(Theme_Two.dateChanged(datePicker:)),
                              for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action:
            #selector(Theme_Two.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        SelectedDateLabel.inputView = datePicker
        
        setDate()
        setIslamicDay()
        wrongDate = false
        
        let now = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, YYYY"
        let todaysDateTemp = dateFormatter.string(from: now as Date)
        
        //TodaysDate.text = todaysDateTemp
        
        setProgessBar(date: date)
        setAzaanIqama(date: date, currentSegment: "Iqama")
        setIslamicQuote()
        
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        label_version.text = "Version " + appVersion!
        
        let facebookTap = UITapGestureRecognizer(target: self, action: #selector(openFacebook))
        FacebookButton.isUserInteractionEnabled = true
        FacebookButton.addGestureRecognizer(facebookTap)
        
        let twitterTap = UITapGestureRecognizer(target: self, action: #selector(openTwitter))
        TwitterButton.isUserInteractionEnabled = true
        TwitterButton.addGestureRecognizer(twitterTap)
        
        let websiteTap = UITapGestureRecognizer(target: self, action: #selector(openWebsite))
        WebsiteButton.isUserInteractionEnabled = true
        WebsiteButton.addGestureRecognizer(websiteTap)
        
        let emailTap = UITapGestureRecognizer(target: self, action: #selector(openEmail))
        EmailButton.isUserInteractionEnabled = true
        EmailButton.addGestureRecognizer(emailTap)
        
        let donateTap = UITapGestureRecognizer(target: self, action: #selector(openDonate))
        DonateButton.isUserInteractionEnabled = true
        DonateButton.addGestureRecognizer(donateTap)
    }
    
    @objc func openFacebook()
    {
        let url = URL(string: "fb://page/312909795553580")!
        if UIApplication.shared.canOpenURL(url)
        {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            //If you want handle the completion block than
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                print("Open url : \(success)")
            })
        }
        else
        {
            let url = URL(string: "http://www.facebook.com/ASIAcentermasjid")!
            if UIApplication.shared.canOpenURL(url)
            {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                //If you want handle the completion block than
                UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                    print("Open url : \(success)")
                })
            }
        }
    }
    
    @objc func openTwitter()
    {
        let url = URL(string: "twitter://user?user_id=501303058")!
        if UIApplication.shared.canOpenURL(url)
        {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            //If you want handle the completion block than
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                print("Open url : \(success)")
            })
        }
        else
        {
            let url = URL(string: "https://twitter.com/ASIACenter786")!
            if UIApplication.shared.canOpenURL(url)
            {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                //If you want handle the completion block than
                UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                    print("Open url : \(success)")
                })
            }
        }
    }
    
    @objc func openEmail()
    {
        let url = URL(string: "mailto:asiacenter618@gmail.com")!
        if UIApplication.shared.canOpenURL(url)
        {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            //If you want handle the completion block than
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                print("Open url : \(success)")
            })
        }
        else
        {
            let url = URL(string: "mailto:asiacenter618@gmail.com")!
            if UIApplication.shared.canOpenURL(url)
            {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                //If you want handle the completion block than
                UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                    print("Open url : \(success)")
                })
            }
        }
    }
    
    @objc func openWebsite()
    {
        let url = URL(string: "https://us.mohid.co/tx/houston/asiacenter")!
        if UIApplication.shared.canOpenURL(url)
        {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            //If you want handle the completion block than
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                print("Open url : \(success)")
            })
        }
    }
    
    @objc func openDonate()
    {
        let url = URL(string: "https://us.mohid.co/tx/houston/asiacenter/masjid/online/donation")!
        if UIApplication.shared.canOpenURL(url)
        {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            //If you want handle the completion block than
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                print("Open url : \(success)")
            })
        }
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        SelectedDateLabel.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
        
        selectedDate = dateFormatter.string(from: datePicker.date)
        setAzaanIqama(date: selectedDate, currentSegment: azaanIqamaOptions[azaanIqamaSegment.selectedSegmentIndex])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getWeekDay(givenDate: String) -> String
    {
        let dateTemp = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let formattedDate = format.string(from: dateTemp)
        
        let finalDate = givenDate + "/" + formattedDate
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.date(from: finalDate)
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.setLocalizedDateFormatFromTemplate("EEE")
        let weekDay = (dateFormatter2.string(from: date!))
        
        return weekDay
    }
    
    func getIslamicQuote()
    {
        if let path = Bundle.main.path(forResource: "islamic_quotes", ofType: "txt")
        {
            do
            {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                
                // Create a CharacterSet of delimiters.
                let separators = CharacterSet(charactersIn: "/\r\n")
                
                let myStrings = data.components(separatedBy: separators)
                
                let random = Int(arc4random_uniform(UInt32(myStrings.count)))
                
                UserDefaults.standard.set(myStrings[random], forKey: "Pref_Quote") //setObject
            }
            catch
            {
                print(error)
            }
        }
    }
    
    func setIslamicQuote()
    {
        let islamicQuote = UserDefaults.standard.string(forKey: "Pref_Quote")!
        
        QuoteofTheDayLabel.text = islamicQuote
    }
    
    func setDate()
    {
        let weekday = Calendar.current.component(.weekday, from: Date())
        
        switch weekday
        {
        case 1:
            label_day.text = "Sunday"
            break
        case 2:
            label_day.text = "Monday"
            break
        case 3:
            label_day.text = "Tuesday"
            break
        case 4:
            label_day.text = "Wednesday"
            break
        case 5:
            label_day.text = "Thursday"
            break
        case 6:
            label_day.text = "Friday"
            break
        case 7:
            label_day.text = "Saturday"
            break
        default:
            break
        }
        
        
        
        var todaysDate = String()
        let now = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd"
        label_date.text = dateFormatter.string(from: now as Date)
        
        dateFormatter.dateFormat = "MM/dd"
        date = dateFormatter.string(from: now as Date)
        
        if UserDefaults.standard.object(forKey: "Pref_Date") != nil
        {
            //  Does exist
            todaysDate = UserDefaults.standard.string(forKey: "Pref_Date")!
        }
        
        if(date != todaysDate)
        {
            getIslamicQuote()
            UserDefaults.standard.set(date, forKey: "Pref_Date") //setObject
        }
    }
    
    func setIslamicDay()
    {
        let now = NSDate()
        
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US") as Locale
        
        let islamic = NSCalendar(identifier: NSCalendar.Identifier.islamicUmmAlQura)
        
        var components = islamic?.components(NSCalendar.Unit(rawValue: UInt.max), from: now as Date)

        switch (components!.month) {
        case 1:
            label_islamicDate.text = "Muharram \(components!.day!)"
            break
        case 2:
            label_islamicDate.text = "Safar \(components!.day!)"
            break
        case 3:
            label_islamicDate.text = "Rabi Al-Awal \(components!.day!)"
            break
        case 4:
            label_islamicDate.text = "Rabi Al-Thani \(components!.day!)"
            break
        case 5:
            label_islamicDate.text = "Jumada Al-Awal \(components!.day!)"
            break
        case 6:
            label_islamicDate.text = "Jumada Al-Thani \(components!.day!)"
            break
        case 7:
            label_islamicDate.text = "Rajab \(components!.day!)"
            break
        case 8:
            label_islamicDate.text = "Sha'ban \(components!.day!)"
            break
        case 9:
            label_islamicDate.text = "Ramadan \(components!.day!)"
            break
        case 10:
            label_islamicDate.text = "Shawwal \(components!.day!)"
            break
        case 11:
            label_islamicDate.text = "Dhu Al-Qa'dah \(components!.day!)"
            break
        case 12:
            label_islamicDate.text = "Dhu Al-Hijjah \(components!.day!)"
            break
        default:
            break
        }
        
        label_islamicYear.text = "\(components!.year!)"
    }
    
    func getPrayerSchedule(date givenDate:String) -> Model_Prayer
    {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PrayerSchedule.sqlite")
        
        var db: OpaquePointer?
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        //this is our select query
        let queryString = "SELECT * FROM PrayerSchedule WHERE DATE = '" + givenDate + "'"
        
        //statement pointer
        var stmt:OpaquePointer?
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            //return
        }
        
        //traversing through all the records
        
        var queryStatement: OpaquePointer? = nil
        
        /*if sqlite3_step(queryString) == SQLITE_ROW
        {
            
            
        } else {
            print("Query returned no results")
        }*/
        
        sqlite3_step(stmt)
        
        let date_final = String(cString: sqlite3_column_text(stmt, 0))
        let fajrAzaan = String(cString: sqlite3_column_text(stmt, 1))
        let fajrIqama = String(cString: sqlite3_column_text(stmt, 2))
        let sunrise = String(cString: sqlite3_column_text(stmt, 3))
        let zuhrAzaan = String(cString: sqlite3_column_text(stmt, 4))
        let zuhrIqama = String(cString: sqlite3_column_text(stmt, 5))
        let asrAzaan = String(cString: sqlite3_column_text(stmt, 6))
        let asrIqama = String(cString: sqlite3_column_text(stmt, 7))
        let magribAzaan = String(cString: sqlite3_column_text(stmt, 8))
        let ishaAzaan = String(cString: sqlite3_column_text(stmt, 9))
        let ishaIqama = String(cString: sqlite3_column_text(stmt, 10))
        
        var timings = Model_Prayer(date: date_final, fajrAzaan: fajrAzaan, fajrIqama: fajrIqama, sunrise: sunrise, zuhrAzaan: zuhrAzaan,
                                   zuhrIqama: zuhrIqama, asrAzaan: asrAzaan, asrIqama: asrIqama, magribAzaan: magribAzaan,
                                   ishaAzaan: ishaAzaan, ishaIqama: ishaIqama)
        
        
        /*do
        {
            let timingsFromDB = try self.database.prepare(self.table_Name)
            
            for time in timingsFromDB
            {
                if(time[self.col_1] == givenDate)
                {
                    timings.append(time[self.col_1])
                    timings.append(time[self.col_2])
                    timings.append(time[self.col_3])
                    timings.append(time[self.col_4])
                    timings.append(time[self.col_5])
                    timings.append(time[self.col_6])
                    timings.append(time[self.col_7])
                    timings.append(time[self.col_8])
                    timings.append(time[self.col_9])
                    timings.append(time[self.col_10])
                }
            }
        }
        catch
        {
            print(error)
        }*/
        
        if(givenDate == "03/08" || givenDate == "03/09" || givenDate == "03/10" || givenDate == "03/11" || givenDate == "03/12" || givenDate == "03/13")
        {
            //Here I’m creating the calendar instance that we will operate with:
            
            let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.gregorian)
            
            //Now asking the calendar what year are we in today’s date:
            
            let currentYearInt = (calendar?.component(NSCalendar.Unit.year, from: Date()))!
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd HH:mm"
            
            let tz = TimeZone.current
            
            if tz.isDaylightSavingTime(for: formatter.date(from: "\(currentYearInt)" + "/" + givenDate + " 10:30")!)
            {
                let fajrArr = timings.fajrAzaan.components(separatedBy: ":")
                timings.fajrAzaan = String(Int(fajrArr[0])! + 1) + ":" + fajrArr[1]
                
                if(timings.fajrAzaan.count == 4)
                {
                    timings.fajrAzaan = "0" + timings.fajrAzaan
                }
                
                timings.fajrIqama = "06:45"
                
                let sunriseArr = timings.sunrise.components(separatedBy: ":")
                timings.sunrise = String(Int(sunriseArr[0])! + 1) + ":" + sunriseArr[1]
                
                if(timings.sunrise.count == 4)
                {
                    timings.sunrise = "0" + timings.sunrise
                }
                
                let zuhrArr = timings.zuhrAzaan.components(separatedBy: ":")
                timings.zuhrAzaan = String(Int(zuhrArr[0])! + 1) + ":" + zuhrArr[1]
                
                if(timings.zuhrAzaan.count == 4)
                {
                    timings.zuhrAzaan = "0" + timings.zuhrAzaan
                }
                
                if(Int(zuhrArr[0])! == 12)
                {
                    timings.zuhrAzaan =  "01:" + zuhrArr[1]
                }
                
                timings.zuhrIqama = "02:00"
                
                let asrArr = timings.asrAzaan.components(separatedBy: ":")
                timings.asrAzaan = String(Int(asrArr[0])! + 1) + ":" + asrArr[1]
                
                if(timings.asrAzaan.count == 4)
                {
                    timings.asrAzaan = "0" + timings.asrAzaan
                }
                
                timings.asrIqama = "06:15"
                
                let magribArr = timings.magribAzaan.components(separatedBy: ":")
                timings.magribAzaan = String(Int(magribArr[0])! + 1) + ":" + magribArr[1]
                
                if(timings.magribAzaan.count == 4)
                {
                    timings.magribAzaan = "0" + timings.magribAzaan
                }
                
                let ishaArr = timings.ishaAzaan.components(separatedBy: ":")
                timings.ishaAzaan = String(Int(ishaArr[0])! + 1) + ":" + ishaArr[1]
                
                if(timings.ishaAzaan.count == 4)
                {
                    timings.ishaAzaan = "0" + timings.ishaAzaan
                }
                
                timings.ishaIqama = "09:00"
            }
            
            
        }
        else if(givenDate == "11/01" || givenDate == "11/02" || givenDate == "11/03" || givenDate == "11/04" || givenDate == "11/05" || givenDate == "11/06")
        {
            //Here I’m creating the calendar instance that we will operate with:
            
            let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.gregorian)
            
            //Now asking the calendar what year are we in today’s date:
            
            let currentYearInt = (calendar?.component(NSCalendar.Unit.year, from: Date()))!
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd HH:mm"
            
            let tz = TimeZone.current
            
            if !tz.isDaylightSavingTime(for: formatter.date(from: "\(currentYearInt)" + "/" + givenDate + " 10:30")!)
            {
                let fajrArr = timings.fajrAzaan.components(separatedBy: ":")
                timings.fajrAzaan = String(Int(fajrArr[0])! - 1) + ":" + fajrArr[1]
                
                if(timings.fajrAzaan.count == 4)
                {
                    timings.fajrAzaan = "0" + timings.fajrAzaan
                }
                
                timings.fajrIqama = "06:00"
                
                let sunriseArr = timings.sunrise.components(separatedBy: ":")
                timings.sunrise = String(Int(sunriseArr[0])! - 1) + ":" + sunriseArr[1]
                
                if(timings.sunrise.count == 4)
                {
                    timings.sunrise = "0" + timings.sunrise
                }
                
                let zuhrArr = timings.zuhrAzaan.components(separatedBy: ":")
                timings.zuhrAzaan = String(Int(zuhrArr[0])! - 1) + ":" + zuhrArr[1]
                
                if(timings.zuhrAzaan.count == 4)
                {
                    timings.zuhrAzaan = "0" + timings.zuhrAzaan
                }
                
                timings.zuhrIqama = "01:00"
                
                let asrArr = timings.asrAzaan.components(separatedBy: ":")
                timings.asrAzaan = String(Int(asrArr[0])! - 1) + ":" + asrArr[1]
                
                if(timings.asrAzaan.count == 4)
                {
                    timings.asrAzaan = "0" + timings.asrAzaan
                }
                
                timings.asrIqama = "04:15"
                
                let magribArr = timings.magribAzaan.components(separatedBy: ":")
                timings.magribAzaan = String(Int(magribArr[0])! - 1) + ":" + magribArr[1]
                
                if(timings.magribAzaan.count == 4)
                {
                    timings.magribAzaan = "0" + timings.magribAzaan
                }
                
                let ishaArr = timings.ishaAzaan.components(separatedBy: ":")
                timings.ishaAzaan = String(Int(ishaArr[0])! - 1) + ":" + ishaArr[1]
                
                if(timings.ishaAzaan.count == 4)
                {
                    timings.ishaAzaan = "0" + timings.ishaAzaan
                }
                
                timings.ishaIqama = "07:30"
            }
        }
        
        return timings
    }
    
    func setProgessBar(date givenDate:String)
    {
        let timings = getPrayerSchedule(date: givenDate)
        var nextPrayer = String()
        var endDate = Date()
        var startDate = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.timeZone = TimeZone(identifier: "CST")
        
        let fajr = dateFormatter.date(from: timings.fajrAzaan + " AM")!
        let zuhr = dateFormatter.date(from: timings.zuhrAzaan + " PM")!
        let asr = dateFormatter.date(from: timings.asrAzaan + " PM")!
        let magrib = dateFormatter.date(from: timings.magribAzaan + " PM")!
        let isha = dateFormatter.date(from: timings.ishaAzaan + " PM")!
        
        let t = Date()
        let myString = dateFormatter.string(from: t)
        
        let time = dateFormatter.date(from: myString)
        startDate = time!
        
        if(time! < fajr)
        {
            print(startDate)
            
            startDate = Calendar.current.date(byAdding: .day, value: -1, to: dateFormatter.date(from: dateFormatter.string(from: isha))!)!
            
            print(startDate)
            
            endDate = fajr
            nextPrayer = "Fajr"
        }
        else if(time! < zuhr)
        {
            endDate = zuhr
            nextPrayer = "Zuhr"
        }
        else if(time! < asr)
        {
            endDate = asr
            nextPrayer = "Asr"
        }
        else if(time! < magrib)
        {
            endDate = magrib
            nextPrayer = "Magrib"
        }
        else if(time! < isha)
        {
            endDate = isha
            nextPrayer = "Isha"
        }
        else if(time! > isha)
        {
            endDate = Calendar.current.date(byAdding: .day, value: 1, to: dateFormatter.date(from: dateFormatter.string(from: fajr))!)!
            nextPrayer = "Fajr"
        }
        
        let totalDifference = endDate.timeIntervalSince(startDate)
        
        countDownLabel.addTime(time: totalDifference) // you can use NSDate as well
        countDownLabel.start()
        
        label_nextPrayer.text = nextPrayer
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        let hours: Int = ((totalSeconds / 60) / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func setAzaanIqama(date givenDate:String, currentSegment:String)
    {
        var timings = getPrayerSchedule(date: givenDate)
        
        if(currentSegment == "Iqama")
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let zuhr = dateFormatter.date(from: timings.zuhrIqama)!
            let asr = dateFormatter.date(from: timings.asrIqama)!
            let magrib = dateFormatter.date(from: timings.magribAzaan)!
            let isha = dateFormatter.date(from: timings.ishaIqama)!
            dateFormatter.dateFormat = "hh:mm"
            
            fajrTime.text = timings.fajrIqama + " AM"
            sunriseTime.text = timings.sunrise + " AM"
            zuhrTime.text = dateFormatter.string(from: zuhr) + " PM"
            asrTime.text = dateFormatter.string(from: asr) + " PM"
            magribTime.text = dateFormatter.string(from: magrib) + " PM"
            ishaTime.text = dateFormatter.string(from: isha) + " PM"
            
            if(getWeekDay(givenDate: givenDate).elementsEqual("Fri"))
            {
                zuhrTitle.text = "Jumuah"
                zuhrTime.text = "02:00 PM"
            }
            else
            {
                zuhrTitle.text = "Zuhr"
            }
        }
        else
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let zuhr = dateFormatter.date(from: timings.zuhrAzaan)!
            let asr = dateFormatter.date(from: timings.asrAzaan)!
            let magrib = dateFormatter.date(from: timings.magribAzaan)!
            let isha = dateFormatter.date(from: timings.ishaAzaan)!
            dateFormatter.dateFormat = "hh:mm"
            
            fajrTime.text = timings.fajrAzaan + " AM"
            sunriseTime.text = timings.sunrise + " AM"
            zuhrTime.text = dateFormatter.string(from: zuhr) + " PM"
            asrTime.text = dateFormatter.string(from: asr) + " PM"
            magribTime.text = dateFormatter.string(from: magrib) + " PM"
            ishaTime.text = dateFormatter.string(from: isha) + " PM"
        }
    }
}

