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


//2.Задание: Хранилище настроек.

class SettingsStorage {
    private var settings: [String: String] = [:]
    
    func setSetting(key: String, value: String) {
        settings[key] = value
        print("Setting '\(key)' is set to '\(value)'")
    }
    func getSetting(key: String) -> String? {
        return settings[key]
    }
    func printAllSettings() {
        print ("Current settings:")
        for (key, value) in settings {
            print ("\(key): \(value)")
        }
    }
}
let storage = SettingsStorage()
storage.setSetting(key: "Language", value: "Russian")
storage.setSetting(key: "Theme", value: "Dark")

if let language = storage.getSetting(key: "Language") {
    print ("Current laguage is \(language)")
} else {
    print ("Language settings not found")
}

storage.printAllSettings()

//3.Задание: Простой англо-русский переводчик.

let dictionary = ["hello": "привет", "world": "мир", "apple": "яблоко"]
func translateWord(word: String) -> String? {
    return dictionary[word]
}
func showMenu() {
    print ("Простой англо-русский переводчик")
    print ("1.Перевести слово")
    print ("2.Выйти из приложения")
    if let choice = readLine(), let option = Int(choice) {
        switch option {
        case 1:
            print ("Введите слово на английском:")
            if let inputWord = readLine() {
                if let translation = translateWord(word: inputWord) {
                    print ("Перевод: \(translation)")
                } else {
                    print ("Перевод не найден")
                }
            }
            showMenu()
        case 2:
            print ("Выход из приложения")
        default:
            print ("Некорректный выбор. Попробуйте еще раз.")
            showMenu()
        }
    }
}
showMenu()

//4.Задание: Справочник городов по странам

var countryDatabase = [String: Set<String>]()
func addCity() {
    func addCity(country: String, city: String) {
        countryDatabase[country] = Set(arrayLiteral: city)
    }
    print ("Введите страну:")
    let userAnswerCountry = readLine()
    guard let userAnswerCountry else { return }
    guard !userAnswerCountry.isEmpty else { print("Вы ничего не ввели"); return }
    print ("Введите город:")
    let userAnswerCity = readLine()
    guard let userAnswerCity else { return }
    guard !userAnswerCity.isEmpty else { print("Вы ничего не ввели"); return }
    addCity(country: userAnswerCountry, city: userAnswerCity)
}
func deleteCity() {
    func deleteCity(country: String, city: String) {
        countryDatabase[country]?.remove(city)
    }
    print ("Введите страну:")
    let userAnswerCountry = readLine()
    guard let userAnswerCountry else { return }
    guard !userAnswerCountry.isEmpty else { print ("Вы ничего не ввели"); return }
    print ("Введите город:")
    let userAnswerCity = readLine()
    guard let userAnswerCity else { return }
    guard !userAnswerCity.isEmpty else { print ("Вы ничего не ввели"); return }
    deleteCity(country: userAnswerCountry, city: userAnswerCity)
}
func viewCities() {
    func viewCities(in country: String) {
        print (countryDatabase[country] ?? "Данных нет")
    }
    print ("Введите страну:")
    let userAnswerCountry = readLine()
    guard let userAnswerCountry else { return }
    guard !userAnswerCountry.isEmpty else { print ("Вы ничего не ввели"); return }
    viewCities(in: userAnswerCountry)
}
func citiesByCountry() {
    print ("""
Выберите действие (выберите число):
1 - Добавить город
2 - Удалить город
3 - Посмотреть города
4 - Закрыть
""")
    let userAnswer = readLine()
    switch userAnswer {
    case "1":
        addCity()
        print("")
        citiesByCountry()
    case "2":
        deleteCity()
        print("")
        citiesByCountry()
    case "3":
        viewCities()
        print ("")
        citiesByCountry()
    case "4":
        print ("Работа приложения завершена")
    default:
        print ("Ошибка ввода, попробуйте еще раз\n")
        citiesByCountry()
    }
}
citiesByCountry()

//5.Задание: Нахождение общих элементов двух массивов

let arrayA = [1,2,3,4,5,6]
let arrayB = [4,2,1,7,8,9]

func commonElements(array1: [Int], array2: [Int]) -> [Int] {
    Array(Set(array1).intersection(Set(array2)))
}
let result5 = commonElements(array1: arrayA, array2: arrayB)
print (result5)

