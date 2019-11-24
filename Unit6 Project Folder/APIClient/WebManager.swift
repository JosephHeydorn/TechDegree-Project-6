import Foundation

//These help pass array data to the VC
var pickerViewAttribute1 = [String]()
var displayAttribute2 = [String]()
var displayAttribute3 = [String]()
var displayAttribute4 = [String]()
var displayAttribute5 = [String]()

//Fills picker view
func assignPickerViewPeople() {
    WebManager.downloaderPeopleAPI()
}

func pickerViewCharacterDisplay() {
    pickerViewAttribute1 = arrayOfCharacterAttribute1
    displayAttribute2 = arrayOfCharacterAttribute2
    displayAttribute3 = arrayOfCharacterAttribute3
    displayAttribute4 = arrayOfCharacterAttribute4
    displayAttribute5 = arrayOfCharacterAttribute5
    print("\(pickerViewAttribute1.count) Values In Character Array!")
}

func pickerViewVehicleDisplay() {
    pickerViewAttribute1 = arrayOfVehicleAttribute1
    displayAttribute2 = arrayOfVehicleAttribute2
    displayAttribute3 = arrayOfVehicleAttribute3
    displayAttribute4 = arrayOfVehicleAttribute4
    displayAttribute5 = arrayOfVehicleAttribute5
    print("\(pickerViewAttribute1.count) Values In Vehicle Array!")
}

func pickerViewStarshipDisplay() {
    pickerViewAttribute1 = arrayOfStarshipAttribute1
    displayAttribute2 = arrayOfStarshipAttribute2
    displayAttribute3 = arrayOfStarshipAttribute3
    displayAttribute4 = arrayOfStarshipAttribute4
    displayAttribute5 = arrayOfStarshipAttribute5
    print("\(pickerViewAttribute1.count) Values In Starship Array!")
}

class WebManager {
    
    let downloader = JSONDownloader()
    
    class func downloaderPeopleAPI() {
        let jsonURLString = "https://swapi.co/api/people/"
        guard let url = URL(string: jsonURLString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
            guard let data = data else { return }
            do {
                let characterData = try
                    JSONDecoder().decode(PeopleResultsData.self, from: data)
                clearAllCharacterArrays() //Clears the array for a fresh start up of names.
                let characterResults = characterData.results
                for characterNamesList in characterResults {
                    arrayOfCharacterAttribute1.append(characterNamesList.name)
                    arrayOfCharacterAttribute2.append(characterNamesList.homeworld)
                    arrayOfCharacterAttribute3.append(characterNamesList.height)
                    arrayOfCharacterAttribute4.append(characterNamesList.eye_color)
                    arrayOfCharacterAttribute5.append(characterNamesList.hair_color)
                }
            } catch let jsonError {
                print("Error Getting JSON:", jsonError)
            }
            }
            }.resume()
    }
    
    class func downloaderVehicleAPI() {
        let jsonURLString = "https://swapi.co/api/vehicles/"
        guard let url = URL(string: jsonURLString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    let vehicleData = try
                        JSONDecoder().decode(VehicleResultsData.self, from: data)
                    clearAllVehicleArrays() //Clears the array for a fresh start up of names.
                    let vehicleResults = vehicleData.results
                    for vehicleResultList in vehicleResults {
                        arrayOfVehicleAttribute1.append(vehicleResultList.name)
                        arrayOfVehicleAttribute2.append(vehicleResultList.cost_in_credits)
                        arrayOfVehicleAttribute3.append(vehicleResultList.length)
                        arrayOfVehicleAttribute4.append(vehicleResultList.vehicle_class)
                        arrayOfVehicleAttribute5.append(vehicleResultList.crew)
                    }
                } catch let jsonError {
                    print("Error Getting JSON:", jsonError)
                }
            }
            }.resume()
    }
    
    class func downloaderStarshipAPI() {
        let jsonURLString = "https://swapi.co/api/starships/"
        guard let url = URL(string: jsonURLString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    let starshipData = try
                        JSONDecoder().decode(StarshipResultsData.self, from: data)
                    clearAllStarshipArrays() //Clears the array for a fresh start up of names.
                    let starshipResults = starshipData.results
                    for starshipResultList in starshipResults {
                        arrayOfStarshipAttribute1.append(starshipResultList.name)
                        arrayOfStarshipAttribute2.append(starshipResultList.cost_in_credits)
                        arrayOfStarshipAttribute3.append(starshipResultList.length)
                        arrayOfStarshipAttribute4.append(starshipResultList.starship_class)
                        arrayOfStarshipAttribute5.append(starshipResultList.crew)
                    }
                } catch let jsonError {
                    print("Error Getting JSON:", jsonError)
                }
            }
            }.resume()
    }
    
}

func clearAllCharacterArrays() {
    arrayOfCharacterAttribute1.removeAll()
    arrayOfCharacterAttribute2.removeAll()
    arrayOfCharacterAttribute3.removeAll()
    arrayOfCharacterAttribute4.removeAll()
    arrayOfCharacterAttribute5.removeAll()
}
func clearAllVehicleArrays() {
    arrayOfVehicleAttribute1.removeAll()
    arrayOfVehicleAttribute2.removeAll()
    arrayOfVehicleAttribute3.removeAll()
    arrayOfVehicleAttribute4.removeAll()
    arrayOfVehicleAttribute5.removeAll()
}

func clearAllStarshipArrays() {
    arrayOfStarshipAttribute1.removeAll()
    arrayOfStarshipAttribute2.removeAll()
    arrayOfStarshipAttribute3.removeAll()
    arrayOfStarshipAttribute4.removeAll()
    arrayOfStarshipAttribute5.removeAll()
}
