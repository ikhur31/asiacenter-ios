//
//  MonthlySchedule.swift
//  ASIA Center App
//
//  Created by Ilyas Khurshid on 1/21/18.
//  Copyright © 2018 IKapps. All rights reserved.
//
import UIKit
import SQLite
import SpreadsheetView

class MonthlySchedule: UIViewController, SpreadsheetViewDataSource, SpreadsheetViewDelegate
{
    @IBOutlet weak var PickerView: UIView!
    @IBOutlet weak var MonthPicker: UIButton!
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var DatePicker: MonthYearPickerView!
    
    @IBOutlet weak var spreadsheetView: SpreadsheetView!
    
    var database: Connection!
    
    var monthPicked = String()
    
    @IBAction func ButtonPressed(sender: UIButton)
    {
        switch sender
        {
        case DoneButton: // Azaan
            
            setPrayerSchedule(givenMonth: monthPicked)
            setTable()
            PickerView.isHidden = true
            spreadsheetView.frame.origin.y -= 200
            
            break
        case MonthPicker: // Iqama
            PickerView.isHidden = false
            
            spreadsheetView.frame.origin.y += 200
            
            
            break
        default:
            break
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParentViewController {
            // Your code...
            appDel.myOrientation = .portrait
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }

    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    
    
    
    
    
    
    var F01 = String()
    var Z01 = String()
    var A01 = String()
    var M01 = String()
    var I01 = String()
    var F02 = String()
    var Z02 = String()
    var A02 = String()
    var M02 = String()
    var I02 = String()
    var F03 = String()
    var Z03 = String()
    var A03 = String()
    var M03 = String()
    var I03 = String()
    var F04 = String()
    var Z04 = String()
    var A04 = String()
    var M04 = String()
    var I04 = String()
    var F05 = String()
    var Z05 = String()
    var A05 = String()
    var M05 = String()
    var I05 = String()
    var F06 = String()
    var Z06 = String()
    var A06 = String()
    var M06 = String()
    var I06 = String()
    var F07 = String()
    var Z07 = String()
    var A07 = String()
    var M07 = String()
    var I07 = String()
    var F08 = String()
    var Z08 = String()
    var A08 = String()
    var M08 = String()
    var I08 = String()
    var F09 = String()
    var Z09 = String()
    var A09 = String()
    var M09 = String()
    var I09 = String()
    var F10 = String()
    var Z10 = String()
    var A10 = String()
    var M10 = String()
    var I10 = String()
    var F11 = String()
    var Z11 = String()
    var A11 = String()
    var M11 = String()
    var I11 = String()
    var F12 = String()
    var Z12 = String()
    var A12 = String()
    var M12 = String()
    var I12 = String()
    var F13 = String()
    var Z13 = String()
    var A13 = String()
    var M13 = String()
    var I13 = String()
    var F14 = String()
    var Z14 = String()
    var A14 = String()
    var M14 = String()
    var I14 = String()
    var F15 = String()
    var Z15 = String()
    var A15 = String()
    var M15 = String()
    var I15 = String()
    var F16 = String()
    var Z16 = String()
    var A16 = String()
    var M16 = String()
    var I16 = String()
    var F17 = String()
    var Z17 = String()
    var A17 = String()
    var M17 = String()
    var I17 = String()
    var F18 = String()
    var Z18 = String()
    var A18 = String()
    var M18 = String()
    var I18 = String()
    var F19 = String()
    var Z19 = String()
    var A19 = String()
    var M19 = String()
    var I19 = String()
    var F20 = String()
    var Z20 = String()
    var A20 = String()
    var M20 = String()
    var I20 = String()
    var F21 = String()
    var Z21 = String()
    var A21 = String()
    var M21 = String()
    var I21 = String()
    var F22 = String()
    var Z22 = String()
    var A22 = String()
    var M22 = String()
    var I22 = String()
    var F23 = String()
    var Z23 = String()
    var A23 = String()
    var M23 = String()
    var I23 = String()
    var F24 = String()
    var Z24 = String()
    var A24 = String()
    var M24 = String()
    var I24 = String()
    var F25 = String()
    var Z25 = String()
    var A25 = String()
    var M25 = String()
    var I25 = String()
    var F26 = String()
    var Z26 = String()
    var A26 = String()
    var M26 = String()
    var I26 = String()
    var F27 = String()
    var Z27 = String()
    var A27 = String()
    var M27 = String()
    var I27 = String()
    var F28 = String()
    var Z28 = String()
    var A28 = String()
    var M28 = String()
    var I28 = String()
    var F29 = String()
    var Z29 = String()
    var A29 = String()
    var M29 = String()
    var I29 = String()
    var F30 = String()
    var Z30 = String()
    var A30 = String()
    var M30 = String()
    var I30 = String()
    var F31 = String()
    var Z31 = String()
    var A31 = String()
    var M31 = String()
    var I31 = String()
    
    var FI01 = String()
    var ZI01 = String()
    var AI01 = String()
    var MI01 = String()
    var II01 = String()
    var FI02 = String()
    var ZI02 = String()
    var AI02 = String()
    var MI02 = String()
    var II02 = String()
    var FI03 = String()
    var ZI03 = String()
    var AI03 = String()
    var MI03 = String()
    var II03 = String()
    var FI04 = String()
    var ZI04 = String()
    var AI04 = String()
    var MI04 = String()
    var II04 = String()
    var FI05 = String()
    var ZI05 = String()
    var AI05 = String()
    var MI05 = String()
    var II05 = String()
    var FI06 = String()
    var ZI06 = String()
    var AI06 = String()
    var MI06 = String()
    var II06 = String()
    var FI07 = String()
    var ZI07 = String()
    var AI07 = String()
    var MI07 = String()
    var II07 = String()
    var FI08 = String()
    var ZI08 = String()
    var AI08 = String()
    var MI08 = String()
    var II08 = String()
    var FI09 = String()
    var ZI09 = String()
    var AI09 = String()
    var MI09 = String()
    var II09 = String()
    var FI10 = String()
    var ZI10 = String()
    var AI10 = String()
    var MI10 = String()
    var II10 = String()
    var FI11 = String()
    var ZI11 = String()
    var AI11 = String()
    var MI11 = String()
    var II11 = String()
    var FI12 = String()
    var ZI12 = String()
    var AI12 = String()
    var MI12 = String()
    var II12 = String()
    var FI13 = String()
    var ZI13 = String()
    var AI13 = String()
    var MI13 = String()
    var II13 = String()
    var FI14 = String()
    var ZI14 = String()
    var AI14 = String()
    var MI14 = String()
    var II14 = String()
    var FI15 = String()
    var ZI15 = String()
    var AI15 = String()
    var MI15 = String()
    var II15 = String()
    var FI16 = String()
    var ZI16 = String()
    var AI16 = String()
    var MI16 = String()
    var II16 = String()
    var FI17 = String()
    var ZI17 = String()
    var AI17 = String()
    var MI17 = String()
    var II17 = String()
    var FI18 = String()
    var ZI18 = String()
    var AI18 = String()
    var MI18 = String()
    var II18 = String()
    var FI19 = String()
    var ZI19 = String()
    var AI19 = String()
    var MI19 = String()
    var II19 = String()
    var FI20 = String()
    var ZI20 = String()
    var AI20 = String()
    var MI20 = String()
    var II20 = String()
    var FI21 = String()
    var ZI21 = String()
    var AI21 = String()
    var MI21 = String()
    var II21 = String()
    var FI22 = String()
    var ZI22 = String()
    var AI22 = String()
    var MI22 = String()
    var II22 = String()
    var FI23 = String()
    var ZI23 = String()
    var AI23 = String()
    var MI23 = String()
    var II23 = String()
    var FI24 = String()
    var ZI24 = String()
    var AI24 = String()
    var MI24 = String()
    var II24 = String()
    var FI25 = String()
    var ZI25 = String()
    var AI25 = String()
    var MI25 = String()
    var II25 = String()
    var FI26 = String()
    var ZI26 = String()
    var AI26 = String()
    var MI26 = String()
    var II26 = String()
    var FI27 = String()
    var ZI27 = String()
    var AI27 = String()
    var MI27 = String()
    var II27 = String()
    var FI28 = String()
    var ZI28 = String()
    var AI28 = String()
    var MI28 = String()
    var II28 = String()
    var FI29 = String()
    var ZI29 = String()
    var AI29 = String()
    var MI29 = String()
    var II29 = String()
    var FI30 = String()
    var ZI30 = String()
    var AI30 = String()
    var MI30 = String()
    var II30 = String()
    var FI31 = String()
    var ZI31 = String()
    var AI31 = String()
    var MI31 = String()
    var II31 = String()
    
    func mergedCells(in spreadsheetView: SpreadsheetView) -> [CellRange] {
        return [CellRange(from: (row: 0, column: 1), to: (row: 0, column: 2)),
                CellRange(from: (row: 0, column: 3), to: (row: 0, column: 4)),
                CellRange(from: (row: 0, column: 5), to: (row: 0, column: 6)),
                CellRange(from: (row: 0, column: 8), to: (row: 0, column: 9))]
    }
    
    
    let dates = ["Fajr", "", "Zuhr", "", "Asr", "", "Magrib", "Isha", ""]
    let days = ["Azaan", "Iqama", "Azaan", "Iqama", "Azaan", "Iqama", "Azaan", "Azaan", "Iqama"]
    let dayColors = [UIColor(red: 0.918, green: 0.224, blue: 0.153, alpha: 1),
                     UIColor(red: 0.106, green: 0.541, blue: 0.827, alpha: 1),
                     UIColor(red: 0.918, green: 0.224, blue: 0.153, alpha: 1),
                     UIColor(red: 0.106, green: 0.541, blue: 0.827, alpha: 1),
                     UIColor(red: 0.918, green: 0.224, blue: 0.153, alpha: 1),
                     UIColor(red: 0.106, green: 0.541, blue: 0.827, alpha: 1),
                     UIColor(red: 0.918, green: 0.224, blue: 0.153, alpha: 1),
                     UIColor(red: 0.918, green: 0.224, blue: 0.153, alpha: 1),
                     UIColor(red: 0.106, green: 0.541, blue: 0.827, alpha: 1)]
    
    let hours = ["01", "02", "03", "04", "05", "06", "07", "08", "09",
                 "10", "11", "12", "13", "14", "15", "16", "17", "18",
                 "19", "20", "21", "22", "23", "24", "25", "26", "27",
                 "28", "29", "30", "31"]
    let evenRowColor = UIColor(red: 0.914, green: 0.914, blue: 0.906, alpha: 1)
    let oddRowColor: UIColor = .white
    
    var data = [
        ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
         "", "", "", "", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
         "", "", "", "", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
         "", "", "", "", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
         "", "", "", "", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
         "", "", "", "", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
         "", "", "", "", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
         "", "", "", "", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
         "", "", "", "", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
         "", "", "", "", "", "", "", "", "", "", ""]
    ]
    
    // MARK: DataSource
    
    func numberOfColumns(in spreadsheetView: SpreadsheetView) -> Int {
        return 1 + days.count
    }
    
    func numberOfRows(in spreadsheetView: SpreadsheetView) -> Int {
        return 1 + 1 + hours.count
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, widthForColumn column: Int) -> CGFloat {
        if case 0 = column {
            return 40
        } else {
            return 70
        }
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, heightForRow row: Int) -> CGFloat {
        if case 0 = row {
            return 24
        } else if case 1 = row {
            return 32
        } else {
            return 40
        }
    }
    
    /*func frozenColumns(in spreadsheetView: SpreadsheetView) -> Int {
        return 1
    }*/
    
    func frozenRows(in spreadsheetView: SpreadsheetView) -> Int {
        return 2
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, cellForItemAt indexPath: IndexPath) -> Cell? {
        if case (1...(dates.count + 1), 0) = (indexPath.column, indexPath.row) {
            let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: String(describing: DateCell.self), for: indexPath) as! DateCell
            cell.label.text = dates[indexPath.column - 1]
            return cell
        } else if case (1...(days.count + 1), 1) = (indexPath.column, indexPath.row) {
            let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: String(describing: DayTitleCell.self), for: indexPath) as! DayTitleCell
            cell.label.text = days[indexPath.column - 1]
            cell.label.textColor = dayColors[indexPath.column - 1]
            return cell
        } else if case (0, 1) = (indexPath.column, indexPath.row) {
            let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: String(describing: TimeTitleCell.self), for: indexPath) as! TimeTitleCell
            cell.label.text = "DAY"
            return cell
        } else if case (0, 2...(hours.count + 2)) = (indexPath.column, indexPath.row) {
            let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: String(describing: TimeCell.self), for: indexPath) as! TimeCell
            cell.label.text = hours[indexPath.row - 2]
            cell.backgroundColor = indexPath.row % 2 == 0 ? evenRowColor : oddRowColor
            return cell
        } else if case (1...(days.count + 1), 2...(hours.count + 2)) = (indexPath.column, indexPath.row) {
            let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: String(describing: ScheduleCell.self), for: indexPath) as! ScheduleCell
            let text = data[indexPath.column - 1][indexPath.row - 2]
            if !text.isEmpty {
                cell.label.text = text
                let color = dayColors[indexPath.column - 1]
                cell.label.textColor = color
                cell.color = color.withAlphaComponent(0.2)
                cell.borders.top = .solid(width: 2, color: color)
                cell.borders.bottom = .solid(width: 2, color: color)
            } else {
                cell.label.text = nil
                cell.color = indexPath.row % 2 == 0 ? evenRowColor : oddRowColor
                cell.borders.top = .none
                cell.borders.bottom = .none
            }
            return cell
        }
        return nil
    }
    
    /// Delegate
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, didSelectItemAt indexPath: IndexPath) {
        print("Selected: (row: \(indexPath.row), column: \(indexPath.column))")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        appDel.myOrientation = .landscape
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
        
        let now = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        monthPicked = dateFormatter.string(from: now as Date)
        
        print(monthPicked)
        
        DatePicker.onDateSelected = { (month: Int) in
            self.monthPicked = String(format: "%02d", month)
            //print(string) // should show something like 05/2015
        }
        
        do
        {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("prayerSchedule").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
        }
        catch
        {
            print(error)
        }
        
        setPrayerSchedule(givenMonth: monthPicked)
        setTable()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        spreadsheetView.flashScrollIndicators()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTable()
    {
        data = [
            [F01, F02, F03, F04, F05, F06, F07, F08, F09, F10, F11, F12, F13, F14, F15, F16, F17, F18, F19, F20,
             F21, F22, F23, F24, F25, F26, F27, F28, F29, F30, F31],
            [FI01, FI02, FI03, FI04, FI05, FI06, FI07, FI08, FI09, FI10, FI11, FI12, FI13, FI14, FI15, FI16, FI17, FI18, FI19, FI20,
             FI21, FI22, FI23, FI24, FI25, FI26, FI27, FI28, FI29, FI30, FI31],
            [Z01, Z02, Z03, Z04, Z05, Z06, Z07, Z08, Z09, Z10, Z11, Z12, Z13, Z14, Z15, Z16, Z17, Z18, Z19, Z20,
             Z21, Z22, Z23, Z24, Z25, Z26, Z27, Z28, Z29, Z30, Z31],
            [ZI01, ZI02, ZI03, ZI04, ZI05, ZI06, ZI07, ZI08, ZI09, ZI10, ZI11, ZI12, ZI13, ZI14, ZI15, ZI16, ZI17, ZI18, ZI19, ZI20,
             ZI21, ZI22, ZI23, ZI24, ZI25, ZI26, ZI27, ZI28, ZI29, ZI30, ZI31],
            [A01, A02, A03, A04, A05, A06, A07, A08, A09, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20,
             A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31],
            [AI01, AI02, AI03, AI04, AI05, AI06, AI07, AI08, AI09, AI10, AI11, AI12, AI13, AI14, AI15, AI16, AI17, AI18, AI19, AI20,
             AI21, AI22, AI23, AI24, AI25, AI26, AI27, AI28, AI29, AI30, AI31],
            [M01, M02, M03, M04, M05, M06, M07, M08, M09, M10, M11, M12, M13, M14, M15, M16, M17, M18, M19, M20,
             M21, M22, M23, M24, M25, M26, M27, M28, M29, M30, M31],
            [I01, I02, I03, I04, I05, I06, I07, I08, I09, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20,
             I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31],
            [II01, II02, II03, II04, II05, II06, II07, II08, II09, II10, II11, II12, II13, II14, II15, II16, II17, II18, II19, II20,
             II21, II22, II23, II24, II25, II26, II27, II28, II29, II30, II31]
        ]
        
        spreadsheetView.dataSource = self
        spreadsheetView.delegate = self
        
        spreadsheetView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        
        spreadsheetView.intercellSpacing = CGSize(width: 4, height: 1)
        spreadsheetView.gridStyle = .none
        
        spreadsheetView.register(DateCell.self, forCellWithReuseIdentifier: String(describing: DateCell.self))
        spreadsheetView.register(TimeTitleCell.self, forCellWithReuseIdentifier: String(describing: TimeTitleCell.self))
        spreadsheetView.register(TimeCell.self, forCellWithReuseIdentifier: String(describing: TimeCell.self))
        spreadsheetView.register(DayTitleCell.self, forCellWithReuseIdentifier: String(describing: DayTitleCell.self))
        spreadsheetView.register(ScheduleCell.self, forCellWithReuseIdentifier: String(describing: ScheduleCell.self))
    }
    
    func getPrayerSchedule(date givenMonth:String) -> [Model_Prayer]
    {
        var arrayOfModelPrayer = [Model_Prayer]()
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PrayerSchedule.sqlite")
        
        var db: OpaquePointer?
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        //this is our select query
        let queryString = "SELECT * FROM PrayerSchedule WHERE DATE LIKE '%" + givenMonth + "/%'"
        
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
        
        while (sqlite3_step(stmt) == SQLITE_ROW)
        {
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
            
            if(date_final == "03/08" || date_final == "03/09" || date_final == "03/10" || date_final == "03/11" || date_final == "03/12" || date_final == "03/13")
            {
                //Here I’m creating the calendar instance that we will operate with:
                
                let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.gregorian)
                
                //Now asking the calendar what year are we in today’s date:
                
                let currentYearInt = (calendar?.component(NSCalendar.Unit.year, from: Date()))!
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd HH:mm"
                
                let tz = TimeZone.current
                
                if tz.isDaylightSavingTime(for: formatter.date(from: "\(currentYearInt)" + "/" + date_final + " 10:30")!)
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
            else if(date_final == "11/01" || date_final == "11/02" || date_final == "11/03" || date_final == "11/04" || date_final == "11/05" || date_final == "11/06")
            {
                //Here I’m creating the calendar instance that we will operate with:
                
                let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.gregorian)
                
                //Now asking the calendar what year are we in today’s date:
                
                let currentYearInt = (calendar?.component(NSCalendar.Unit.year, from: Date()))!
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd HH:mm"
                
                let tz = TimeZone.current
                
                if !tz.isDaylightSavingTime(for: formatter.date(from: "\(currentYearInt)" + "/" + date_final + " 10:30")!)
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
        
            arrayOfModelPrayer.append(timings)
        }
        
        return arrayOfModelPrayer
    }
    
    func setPrayerSchedule(givenMonth:String)
    {
        var timings = [String]()
        let arrayOfModelPrayer = getPrayerSchedule(date: givenMonth)
        
        for model in arrayOfModelPrayer
        {
            let fajr = model.fajrAzaan
            let fajrI = model.fajrIqama
            let zuhr = model.zuhrAzaan
            let zuhrI = model.zuhrIqama
            let asr = model.asrAzaan
            let asrI = model.asrIqama
            let magrib = model.magribAzaan
            let isha = model.ishaAzaan
            let ishaI = model.ishaIqama
            
            timings.append(fajr)
            timings.append(fajrI)
            timings.append(zuhr)
            timings.append(zuhrI)
            timings.append(asr)
            timings.append(asrI)
            timings.append(magrib)
            timings.append(isha)
            timings.append(ishaI)
        }
        
        /*do
        {
            let timingsFromDB = try self.database.prepare(self.table_Name)
            
            
            for time in timingsFromDB
            {
                if(time[self.col_1].contains(givenMonth + "/"))
                {
                    dateFormatter.dateFormat = "HH:mm"
                    var fajr = dateFormatter.date(from: time[self.col_2])!
                    var fajrI = dateFormatter.date(from: time[self.col_3])!
                    var zuhr = dateFormatter.date(from: time[self.col_4])!
                    var zuhrI = dateFormatter.date(from: time[self.col_5])!
                    var asr = dateFormatter.date(from: time[self.col_6])!
                    var asrI = dateFormatter.date(from: time[self.col_7])!
                    var magrib = dateFormatter.date(from: time[self.col_8])!
                    var isha = dateFormatter.date(from: time[self.col_9])!
                    var ishaI = dateFormatter.date(from: time[self.col_10])!
                    
                    if(time[self.col_1] == "03/08" || time[self.col_1] == "03/09" || time[self.col_1] == "03/10" || time[self.col_1] == "03/11" || time[self.col_1] == "03/12" || time[self.col_1] == "03/13")
                    {
                        //Here I’m creating the calendar instance that we will operate with:
                        
                        let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.gregorian)
                        
                        //Now asking the calendar what year are we in today’s date:
                        
                        let currentYearInt = (calendar?.component(NSCalendar.Unit.year, from: Date()))!
                        
                        let formatter = DateFormatter()
                        formatter.dateFormat = "yyyy/MM/dd HH:mm"
                        
                        let tz = TimeZone.current
                        
                        if tz.isDaylightSavingTime(for: formatter.date(from: "\(currentYearInt)" + "/" + time[self.col_1] + " 10:30")!)
                        {
                            let fajrArr = time[self.col_2].components(separatedBy: ":")
                            fajr = dateFormatter.date(from: String(Int(fajrArr[0])! + 1) + ":" + fajrArr[1])!
                            
                            fajrI = dateFormatter.date(from: "06:45")!
                            
                            let zuhrArr = time[self.col_4].components(separatedBy: ":")
                            zuhr = dateFormatter.date(from: String(Int(zuhrArr[0])! + 1) + ":" + zuhrArr[1])!
                            
                            zuhrI = dateFormatter.date(from: "02:00")!
                            
                            let asrArr = time[self.col_6].components(separatedBy: ":")
                            asr = dateFormatter.date(from: String(Int(asrArr[0])! + 1) + ":" + asrArr[1])!
                            
                            asrI = dateFormatter.date(from: "06:15")!
                            
                            let magribArr = time[self.col_8].components(separatedBy: ":")
                            magrib = dateFormatter.date(from: String(Int(magribArr[0])! + 1) + ":" + magribArr[1])!
                            
                            let ishaArr = time[self.col_9].components(separatedBy: ":")
                            isha = dateFormatter.date(from: String(Int(ishaArr[0])! + 1) + ":" + ishaArr[1])!
                            
                            ishaI = dateFormatter.date(from: "09:00")!
                        }
                        
                        
                    }
                    else if(time[self.col_1] == "11/01" || time[self.col_1] == "11/02" || time[self.col_1] == "11/03" || time[self.col_1] == "11/04" || time[self.col_1] == "11/05" || time[self.col_1] == "11/06")
                    {
                        //Here I’m creating the calendar instance that we will operate with:
                        
                        let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.gregorian)
                        
                        //Now asking the calendar what year are we in today’s date:
                        
                        let currentYearInt = (calendar?.component(NSCalendar.Unit.year, from: Date()))!
                        
                        let formatter = DateFormatter()
                        formatter.dateFormat = "yyyy/MM/dd HH:mm"
                        
                        let tz = TimeZone.current
                        
                        if !tz.isDaylightSavingTime(for: formatter.date(from: "\(currentYearInt)" + "/" + time[self.col_1] + " 10:30")!)
                        {
                            let fajrArr = time[self.col_2].components(separatedBy: ":")
                            fajr = dateFormatter.date(from: String(Int(fajrArr[0])! - 1) + ":" + fajrArr[1])!
                            
                            fajrI = dateFormatter.date(from: "06:00")!
                            
                            let zuhrArr = time[self.col_4].components(separatedBy: ":")
                            zuhr = dateFormatter.date(from: String(Int(zuhrArr[0])! - 1) + ":" + zuhrArr[1])!
                            
                            zuhrI = dateFormatter.date(from: "01:00")!
                            
                            let asrArr = time[self.col_6].components(separatedBy: ":")
                            asr = dateFormatter.date(from: String(Int(asrArr[0])! - 1) + ":" + asrArr[1])!
                            
                            asrI = dateFormatter.date(from: "04:15")!
                            
                            let magribArr = time[self.col_8].components(separatedBy: ":")
                            magrib = dateFormatter.date(from: String(Int(magribArr[0])! - 1) + ":" + magribArr[1])!
                            
                            let ishaArr = time[self.col_9].components(separatedBy: ":")
                            isha = dateFormatter.date(from: String(Int(ishaArr[0])! - 1) + ":" + ishaArr[1])!
                            
                            ishaI = dateFormatter.date(from: "07:30")!
                        }
                    }
                    
                    
                    dateFormatter.dateFormat = "hh:mm"
                    timings.append(dateFormatter.string(from: fajr))
                    timings.append(dateFormatter.string(from: fajrI))
                    timings.append(dateFormatter.string(from: zuhr))
                    timings.append(dateFormatter.string(from: zuhrI))
                    timings.append(dateFormatter.string(from: asr))
                    timings.append(dateFormatter.string(from: asrI))
                    timings.append(dateFormatter.string(from: magrib))
                    timings.append(dateFormatter.string(from: isha))
                    timings.append(dateFormatter.string(from: ishaI))
                    
                }
            }
        }
        catch
        {
            print(error)
        }*/
        
        if(monthPicked == "01")
        {
            MonthPicker.setTitle("January", for: .normal)
        }
        else if(monthPicked == "02")
        {
            MonthPicker.setTitle("February", for: .normal)
        }
        else if(monthPicked == "03")
        {
            MonthPicker.setTitle("March", for: .normal)
        }
        else if(monthPicked == "04")
        {
            MonthPicker.setTitle("April", for: .normal)
        }
        else if(monthPicked == "05")
        {
            MonthPicker.setTitle("May", for: .normal)
        }
        else if(monthPicked == "06")
        {
            MonthPicker.setTitle("June", for: .normal)
        }
        else if(monthPicked == "07")
        {
            MonthPicker.setTitle("July", for: .normal)
        }
        else if(monthPicked == "08")
        {
            MonthPicker.setTitle("August", for: .normal)
        }
        else if(monthPicked == "09")
        {
            MonthPicker.setTitle("September", for: .normal)
        }
        else if(monthPicked == "10")
        {
            MonthPicker.setTitle("October", for: .normal)
        }
        else if(monthPicked == "11")
        {
            MonthPicker.setTitle("November", for: .normal)
        }
        else if(monthPicked == "12")
        {
            MonthPicker.setTitle("December", for: .normal)
        }
        
        
        F01 = timings[0]
        FI01 = timings[1]
        Z01 = timings[2]
        ZI01 = timings[3]
        A01 = timings[4]
        AI01 = timings[5]
        M01 = timings[6]
        I01 = timings[7]
        II01 = timings[8]
        F02 = timings[9]
        FI02 = timings[10]
        Z02 = timings[11]
        ZI02 = timings[12]
        A02 = timings[13]
        AI02 = timings[14]
        M02 = timings[15]
        I02 = timings[16]
        II02 = timings[17]
        F03 = timings[18]
        FI03 = timings[19]
        Z03 = timings[20]
        ZI03 = timings[21]
        A03 = timings[22]
        AI03 = timings[23]
        M03 = timings[24]
        I03 = timings[25]
        II03 = timings[26]
        F04 = timings[27]
        FI04 = timings[28]
        Z04 = timings[29]
        ZI04 = timings[30]
        A04 = timings[31]
        AI04 = timings[32]
        M04 = timings[33]
        I04 = timings[34]
        II04 = timings[35]
        F05 = timings[36]
        FI05 = timings[37]
        Z05 = timings[38]
        ZI05 = timings[39]
        A05 = timings[40]
        AI05 = timings[41]
        M05 = timings[42]
        I05 = timings[43]
        II05 = timings[44]
        F06 = timings[45]
        FI06 = timings[46]
        Z06 = timings[47]
        ZI06 = timings[48]
        A06 = timings[49]
        AI06 = timings[50]
        M06 = timings[51]
        I06 = timings[52]
        II06 = timings[53]
        F07 = timings[54]
        FI07 = timings[55]
        Z07 = timings[56]
        ZI07 = timings[57]
        A07 = timings[58]
        AI07 = timings[59]
        M07 = timings[60]
        I07 = timings[61]
        II07 = timings[62]
        F08 = timings[63]
        FI08 = timings[64]
        Z08 = timings[65]
        ZI08 = timings[66]
        A08 = timings[67]
        AI08 = timings[68]
        M08 = timings[69]
        I08 = timings[70]
        II08 = timings[71]
        F09 = timings[72]
        FI09 = timings[73]
        Z09 = timings[74]
        ZI09 = timings[75]
        A09 = timings[76]
        AI09 = timings[77]
        M09 = timings[78]
        I09 = timings[79]
        II09 = timings[80]
        F10 = timings[81]
        FI10 = timings[82]
        Z10 = timings[83]
        ZI10 = timings[84]
        A10 = timings[85]
        AI10 = timings[86]
        M10 = timings[87]
        I10 = timings[88]
        II10 = timings[89]
        F11 = timings[90]
        FI11 = timings[91]
        Z11 = timings[92]
        ZI11 = timings[93]
        A11 = timings[94]
        AI11 = timings[95]
        M11 = timings[96]
        I11 = timings[97]
        II11 = timings[98]
        F12 = timings[99]
        FI12 = timings[100]
        Z12 = timings[101]
        ZI12 = timings[102]
        A12 = timings[103]
        AI12 = timings[104]
        M12 = timings[105]
        I12 = timings[106]
        II12 = timings[107]
        F13 = timings[108]
        FI13 = timings[109]
        Z13 = timings[110]
        ZI13 = timings[111]
        A13 = timings[112]
        AI13 = timings[113]
        M13 = timings[114]
        I13 = timings[115]
        II13 = timings[116]
        F14 = timings[117]
        FI14 = timings[118]
        Z14 = timings[119]
        ZI14 = timings[120]
        A14 = timings[121]
        AI14 = timings[122]
        M14 = timings[123]
        I14 = timings[124]
        II14 = timings[125]
        F15 = timings[126]
        FI15 = timings[127]
        Z15 = timings[128]
        ZI15 = timings[129]
        A15 = timings[130]
        AI15 = timings[131]
        M15 = timings[132]
        I15 = timings[133]
        II15 = timings[134]
        F16 = timings[135]
        FI16 = timings[136]
        Z16 = timings[137]
        ZI16 = timings[138]
        A16 = timings[139]
        AI16 = timings[140]
        M16 = timings[141]
        I16 = timings[142]
        II16 = timings[143]
        F17 = timings[144]
        FI17 = timings[145]
        Z17 = timings[146]
        ZI17 = timings[147]
        A17 = timings[148]
        AI17 = timings[149]
        M17 = timings[150]
        I17 = timings[151]
        II17 = timings[152]
        F18 = timings[153]
        FI18 = timings[154]
        Z18 = timings[155]
        ZI18 = timings[156]
        A18 = timings[157]
        AI18 = timings[158]
        M18 = timings[159]
        I18 = timings[160]
        II18 = timings[161]
        F19 = timings[162]
        FI19 = timings[163]
        Z19 = timings[164]
        ZI19 = timings[165]
        A19 = timings[166]
        AI19 = timings[167]
        M19 = timings[168]
        I19 = timings[169]
        II19 = timings[170]
        F20 = timings[171]
        FI20 = timings[172]
        Z20 = timings[173]
        ZI20 = timings[174]
        A20 = timings[175]
        AI20 = timings[176]
        M20 = timings[177]
        I20 = timings[178]
        II20 = timings[179]
        F21 = timings[180]
        FI21 = timings[181]
        Z21 = timings[182]
        ZI21 = timings[183]
        A21 = timings[184]
        AI21 = timings[185]
        M21 = timings[186]
        I21 = timings[187]
        II21 = timings[188]
        F22 = timings[189]
        FI22 = timings[190]
        Z22 = timings[191]
        ZI22 = timings[192]
        A22 = timings[193]
        AI22 = timings[194]
        M22 = timings[195]
        I22 = timings[196]
        II22 = timings[197]
        F23 = timings[198]
        FI23 = timings[199]
        Z23 = timings[200]
        ZI23 = timings[201]
        A23 = timings[202]
        AI23 = timings[203]
        M23 = timings[204]
        I23 = timings[205]
        II23 = timings[206]
        F24 = timings[207]
        FI24 = timings[208]
        Z24 = timings[209]
        ZI24 = timings[210]
        A24 = timings[211]
        AI24 = timings[212]
        M24 = timings[213]
        I24 = timings[214]
        II24 = timings[215]
        F25 = timings[216]
        FI25 = timings[217]
        Z25 = timings[218]
        ZI25 = timings[219]
        A25 = timings[220]
        AI25 = timings[221]
        M25 = timings[222]
        I25 = timings[223]
        II25 = timings[224]
        F26 = timings[225]
        FI26 = timings[226]
        Z26 = timings[227]
        ZI26 = timings[228]
        A26 = timings[229]
        AI26 = timings[230]
        M26 = timings[231]
        I26 = timings[232]
        II26 = timings[233]
        F27 = timings[234]
        FI27 = timings[235]
        Z27 = timings[236]
        ZI27 = timings[237]
        A27 = timings[238]
        AI27 = timings[239]
        M27 = timings[240]
        I27 = timings[241]
        II27 = timings[242]
        F28 = timings[243]
        FI28 = timings[244]
        Z28 = timings[245]
        ZI28 = timings[246]
        A28 = timings[247]
        AI28 = timings[248]
        M28 = timings[249]
        I28 = timings[250]
        II28 = timings[251]
        
        
        
        if(monthPicked != "02")
        {
            F29 = timings[252]
            FI29 = timings[253]
            Z29 = timings[254]
            ZI29 = timings[255]
            A29 = timings[256]
            AI29 = timings[257]
            M29 = timings[258]
            I29 = timings[259]
            II29 = timings[260]
            F30 = timings[261]
            FI30 = timings[262]
            Z30 = timings[263]
            ZI30 = timings[264]
            A30 = timings[265]
            AI30 = timings[266]
            M30 = timings[267]
            I30 = timings[268]
            II30 = timings[269]
        }
        else
        {
            
        }
        
        print(monthPicked)
        
        if(monthPicked == "01" || monthPicked == "03" || monthPicked == "05" || monthPicked == "07" || monthPicked == "08"
             || monthPicked == "10"  || monthPicked == "12")
        {
            F31 = timings[270]
            FI31 = timings[271]
            Z31 = timings[272]
            ZI31 = timings[273]
            A31 = timings[274]
            AI31 = timings[275]
            M31 = timings[276]
            I31 = timings[277]
            II31 = timings[278]
        }
        else
        {
            
        }
    }
}
