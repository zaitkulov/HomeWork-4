//
//  main.swift
//  HomeWork-4
//
//  Created by Артем Заиткулов on 12.12.2023.
//

import Foundation

//1.Задание: Текстовое приложение для календаря

var eventsDictionary = [String: [String]]()
func addEvent(date: String, event: String) {
    if var events = eventsDictionary[date] {
        events.append(event)
        eventsDictionary[date] = events
    } else {
        eventsDictionary[date] = [event]
    }
}

func displayEvents(date: String) {
    if let events = eventsDictionary[date] {
        if events.isEmpty {
            print ("На \(date) событий нет.")
        } else {
            print ("События на \(date):")
            for event in events {
                print (" - \(event)")
            }
        }
    } else {
        print ("На \(date) нет событий.")
    }
}

func mainMenu() {
    print("Меню:")
    print ("1. Добавить мероприятие")
    print ("2. Показать мероприятие на определенную дату")
    print ("3. Выйти из приложения")
    if let choice = readLine(), let option = Int(choice) {
        switch option {
        case 1:
            print ("Введите дату (в формате dd.MM.yyyy):")
            if let date = readLine() {
                print ("Введите мероприятие:")
                if let event = readLine() {
                    addEvent(date: date, event: event)
                    print ("Мероприятие добавлено!")
                } else {
                    print ("Ошибка ввода мероприятия.")
                }
            } else {
                print ("Ошибка ввода даты.")
            }
        case 2:
            print ("Введите дату (в формате dd.MM.yyyy):")
            if let date = readLine() {
                displayEvents(date: date)
            } else {
                print ("Ошибка ввода даты.")
            }
        case 3:
            print ("Выход из приложения.")
            return
        default:
            print ("Неверный ввод. Пожалуйста, выберите пункт меню.")
        }
    } else {
        print ("Ошибка ввода. Пожалуйста, введите число.")
    }
    mainMenu()
}
mainMenu()


