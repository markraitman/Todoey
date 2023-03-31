//
//  AppDelegate.swift
//  Todoey
//
//  Created by Марк Райтман on 28.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Точка переопределения для настройки после запуска приложения.
        print ("didFinishLaunchingWithOptions" )
        print (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Вызывается при создании новой сессии сцены.
        // Используйте этот метод для выбора конфигурации для создания новой сцены.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Вызывается, когда пользователь отбрасывает сеанс сцены.
        // Если какие-либо сессии были отброшены, пока приложение не было запущено, этот метод будет вызван вскоре после application:didFinishLaunchingWithOptions.
        // Используйте этот метод для освобождения любых ресурсов, которые были специфичны для отброшенных сцен, поскольку они не вернутся.
    }
    
    
}

