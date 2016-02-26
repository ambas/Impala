//
//  CalendarPickerViewController.swift
//  Impala
//
//  Created by Ambas Chobsanti on 1/22/16.
//  Copyright © 2016 AM. All rights reserved.
//

import FSCalendar
import UIKit

private struct Config {
    static let storyboardName = "CalendarPicker"
    static let viewControllerIdentifier = "CalendarPickerViewController"
}

@objc protocol CalendarPickerViewControllerDelegate: class {
    func calendarPicker(calendarPickerViewController: CalendarPickerViewController, didSaveWithDate: NSDate)
    func calendarPickerDidCancel(calendarPickerViewController: CalendarPickerViewController)
}

@objc protocol CalendarPickerViewControllerDataSource: class {
    func dateForCalendarPickerViewController(calendarPickerViewController: CalendarPickerViewController) -> NSDate?
}

class CalendarPickerViewController: UIViewController {

    @IBOutlet weak var dateSelectLabel: UILabel!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var timePicker: UIDatePicker!
    var dateFormatter: NSDateFormatter = {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .LongStyle
        dateFormatter.timeStyle = .ShortStyle
        return dateFormatter
    }()
    weak var delegate: CalendarPickerViewControllerDelegate?
    weak var dataSource: CalendarPickerViewControllerDataSource?
    
    static func create() -> CalendarPickerViewController {
        return UIStoryboard.init(name: Config.storyboardName, bundle: nil).instantiateViewControllerWithIdentifier(Config.viewControllerIdentifier) as! CalendarPickerViewController
    }
    
    static func createWithNavigationController() -> UINavigationController {
        return UIStoryboard.init(name: Config.storyboardName, bundle: nil).instantiateInitialViewController() as! UINavigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePicker.addTarget(self, action: Selector("timeDidChange:"), forControlEvents: .ValueChanged)
        timePicker.minuteInterval = 15
        
        let dateSelected = dataSource?.dateForCalendarPickerViewController(self) ?? NSDate()
        timePicker.date = dateSelected
        calendar.selectDate(dateSelected)
        updateSelectedDateLabel()
        
         calendar.appearance.caseOptions = .WeekdayUsesSingleUpperCase
    }
    
    @IBAction func saveButtonDidTouch(sender: AnyObject) {
        guard let dateSelected = combineDateWithTime(calendar.selectedDate, time: timePicker.date) else {
            assertionFailure("Something wrong with concat date process!")
            return
        }
        delegate?.calendarPicker(self, didSaveWithDate: dateSelected)
    }
    
    @IBAction func cancelButtonDidTouch(sender: AnyObject) {
        delegate?.calendarPickerDidCancel(self)
    }
   
    func timeDidChange(timePicker: UIDatePicker) {
       updateSelectedDateLabel()
    }
    
    //https://gist.github.com/justinmfischer/0a6edf711569854c2537 from this gist
    private func combineDateWithTime(date: NSDate, time: NSDate) -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        
        let dateComponents = calendar.components([.Year, .Month, .Day], fromDate: date)
        let timeComponents = calendar.components([.Hour, .Minute, .Second], fromDate: time)
        
        let mergedComponments = NSDateComponents()
        mergedComponments.year = dateComponents.year
        mergedComponments.month = dateComponents.month
        mergedComponments.day = dateComponents.day
        mergedComponments.hour = timeComponents.hour
        mergedComponments.minute = timeComponents.minute
        mergedComponments.second = timeComponents.second
        
        return calendar.dateFromComponents(mergedComponments)
    }
    
    private func updateSelectedDateLabel() {
        guard let dateSelected = combineDateWithTime(calendar.selectedDate, time: timePicker.date) else {
            assertionFailure("Something wrong with concat date process!")
            return
        }
        dateSelectLabel.text = dateFormatter.stringFromDate(dateSelected)
    }
}

extension CalendarPickerViewController: FSCalendarDelegate {
   
    func calendar(calendar: FSCalendar, didSelectDate date: NSDate) {
      updateSelectedDateLabel()
    }
}
