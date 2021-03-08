//
//  LocalNotificationManager.swift
//  ToDoList
//
//  Created by Grace Carroll on 3/8/21.
//

import Foundation
import UserNotifications

struct LocalNotificationManager{
    
    static func authorizeLocalNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            guard error == nil else{
                print("ERROR \(error!.localizedDescription)")
                return
            }
            if granted {
                print("Authorization Granted")
            } else {
                print("Authorization Denied")
                //TODO: Put an alert in here telling the user what to do
            }
        }
    }
    
    static func setCalendarNotifications(title: String, subtitle: String, body: String, badgeNumber: NSNumber?, sound: UNNotificationSound, date: Date) -> String {
        
         //create content
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.sound = sound
        content.badge = badgeNumber
        
        //create trigger
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        dateComponents.second = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // create request
        let notificationID = UUID().uuidString
        let request = UNNotificationRequest(identifier: notificationID, content: content, trigger: trigger)
        
        // register request with notification center
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error{
                print("Error: \(error.localizedDescription), Adding notification request went wrong")
            } else{
                print("Notification scheduled \(notificationID); title: \(content.title)")
            }
        }
        return notificationID
    }
    
}
