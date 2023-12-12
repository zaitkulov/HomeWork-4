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

//6.Задание: Поиск общих друзей пользователей

let friendList: [String: Set<String>] = ["Alice":["David", "Bob"], "Eve": ["David", "Bob"]]
func findCommonFriends(user1: String, user2: String) -> Set<String>? {
    guard let friends1 = friendList[user1], let friends2 = friendList[user2] else {
        print("Один из пользователей не найден в списке друзей")
        return nil
    }
    let result = friends1.intersection(friends2)
    print("Общие друзья \(user1) и \(user2): \(result)")
    return result
}


//7.Задание: Найти уникальные элементы в массиве

let array7 = [1,2,2,4,7,1,3,8]

func uniqueElements (array: [Int]) -> [Int] {
    Array(Set(array7))
}

let result7 = uniqueElements(array: array7)
print (result7)

//8.Задание: Телефонный справочник

class PhoneBook {
    var contacts: [String: String] = [:]
    func addNumber(name: String, number: String) {
        contacts[name] = number
        print ("Номер \(number) добавлен для \(name) в справочник.")
    }
    func removeNumber(name:String) {
        if let removeNumber = contacts.removeValue(forKey: name) {
            print ("Номер \(removeNumber) удален для \(name) из справочника")
        }
    }
    func findNumber(name: String) -> String? {
        if let foundNumber = contacts[name] {
            return foundNumber
        } else {
            print ("\(name) не найдено в справочнике.")
            return nil
        }
    }
}
let phonebook = PhoneBook()

phonebook.addNumber(name: "Shamil", number: "23423423")
phonebook.addNumber(name: "Artyom", number: "09848933")
phonebook.addNumber(name: "Islam", number: "23423445")

if let ShamilNumber = phonebook.findNumber(name: "Shamil") {
    print ("Найден номер Шамиля: \(ShamilNumber)")
}
phonebook.removeNumber(name: "Artyom")
let ArtyomNumber = phonebook.findNumber(name: "Artyom")

if let artyomNumber = ArtyomNumber {
    print ("Найден номер Артема: \(ArtyomNumber))")
} else {
    print ("Артем не найден в справочнике")
}

//9.Задание: Реализация теста по умножению

var questionAsked = Set<String>()
var questionsAndAnswers = [String: Int]()
var correctAnswers = 0

func generateUniqueMultiplicationQuestion() -> (question: String, answer: Int) {
    var question: String
    var answer: Int
    repeat {
        let num1 = Int.random(in: 1...10)
        let num2 = Int.random(in: 1...10)
        question = "\(num1) * \(num2) = ?"
        answer = num1 * num2
    } while questionAsked.contains(question)
    questionAsked.insert(question)
    questionsAndAnswers[question] = answer
    return (question, answer)
}

func determineGrade(correctAnswers: Int) -> String {
    switch correctAnswers {
    case 8...10:
        return "Отлично!"
    case 6...7:
        return "Хорошо"
    case 4...5:
        return "Удовлетворительно"
    default:
        return "Неудовлетворительно"
    }
}
for _ in 1...10 {
    let questionAndAnswer = generateUniqueMultiplicationQuestion()
    let question = questionAndAnswer.question
    var correctAnswer = questionAndAnswer.answer
    print (question)
    
    if let userAnswer = readLine(), let userAnswerInt = Int(userAnswer) {
        if userAnswerInt == correctAnswer {
            print ("Правильно!")
            correctAnswers += 1
        } else {
            print ("Неправильно. Правильный ответ: \(correctAnswer)")
        }
    } else {
        print ("Ошибка ввода. Правильный ответ: \(correctAnswer)")
    }
    print ("\n")
}
let result9 = determineGrade(correctAnswers: correctAnswers)
print("Тест завершен. Ваша оценка: \(result9)")


//10.Задание: Склонение слова "монета"

func coinCase(for number: Int) -> String {
    let cases: [Int: String] = [1: "монета", 2: "монеты", 3: "монеты", 4: "монеты"]
    let lastDigit = number % 10
    let lastTwoDigits = number % 100
    if (lastTwoDigits >= 11 && lastTwoDigits <= 14) {
        return "монет"
    }
    if let result = cases[lastDigit] {
        return "\(number) \(result)"
    } else {
        return ("\(number) монет")
    }
}
let numbers = [1, 2, 5, 12, 23]
for number in numbers {
    let result = coinCase(for: number)
    print (result)
}

//11.Задание:Сжатые строки

func compress(_ input: String) -> String {
    var compressedString = ""
    var currentChar: Character?
    var count = 0
    
    for char in input {
        if let current = currentChar {
            if char == current {
                count += 1
            } else {
                compressedString.append("\(current)\(count)")
                currentChar = char
                count = 1
            }
        } else {
            currentChar = char
            count = 1
        }
    }
    if let current = currentChar {
        compressedString.append("\(current)\(count)")
    }
    return compressedString.count < input.count ? compressedString : input
}
let result11 = compress("aabcccccaaaaa")
print(result11)

//12.Задание: Поиск двух чисел, сумма которых равна заданному числу

let nums = [1,2,3,4,5]
let target = 9

func findTwoSum(nums: [Int], target: Int) -> (Int,Int) {
    var result = (0,0)
    
    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            if nums[i] + nums[j] == target {
                result = (nums[i], nums[j])
            }
        }
    }
    return result
}
print (findTwoSum(nums: nums, target: target))

//13.Задание: Первый уникальный символ в строке

func firstUniqueCharacterIndex(in str: String) -> Int {
    for (index,char) in str.enumerated() {
        if str.firstIndex(of: char) == str.lastIndex(of: char) {
            return index
        }
    }
    return -1
}
print ("""
\(firstUniqueCharacterIndex(in: "000005"))
\(firstUniqueCharacterIndex(in: "Artyom"))
\(firstUniqueCharacterIndex(in: "bbbbb"))
""")
