//
//  AppDelegate.swift
//  Task 4
//
//  Created by Amais Sheikh on 26/10/2020.
//  Copyright © 2020 AmaisSheikh. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var realm: Realm?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let url = Realm.Configuration.defaultConfiguration.fileURL
//        let config = Realm.Configuration(fileURL: url, inMemoryIdentifier: nil, syncConfiguration: nil, encryptionKey: .none, readOnly: false, schemaVersion: 1, migrationBlock: nil, deleteRealmIfMigrationNeeded: true, shouldCompactOnLaunch: nil, objectTypes: .none)
//        Realm.Configuration.defaultConfiguration = config
//        realm = try! Realm(configuration: config)
//        print(config.fileURL)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

