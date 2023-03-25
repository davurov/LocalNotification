//
//  ViewController.swift
//  LocalNotifications
//
//  Created by Abduraxmon on 26/03/23.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - 1. ask user permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.sound, .alert, .badge]) { grantedd, error in
        }
        //MARK: - 2. create notification content
        
        let content = UNMutableNotificationContent()
        content.title = "Hi there is notification"
        content.body = "after 10 seconds"
        
        //MARK: - 3. create triger
        
        let date = Date().addingTimeInterval(8)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //MARK: - 4. create request
        
        let uuiString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuiString, content: content, trigger: trigger)
        
        //MARK: - 5. Register
        
        center.add(request) { error in
            
        }
        
    }


}

