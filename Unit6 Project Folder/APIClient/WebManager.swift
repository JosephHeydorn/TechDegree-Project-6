import Foundation

final class WebManager {
    
    private static let downloader = JSONDownloader()
    
    class func downloadPeople(completion: @escaping (Result<[Character], Error>) -> Void) {
        guard let url = URL(string: "https://swapi.co/api/people") else { return }
        
        downloader.jsonTask(with: url) { result in
            switch result {
            case .failure(let error): completion(.failure(error))
            case .success(let data):
                do {
                    let result = try JSONDecoder.starwarsDecoder.decode(PeopleResultsData.self, from: data)
                    let people = result.results
                    completion(.success(people))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    class func downloadHomePlanet(for person: Character, completion: @escaping (Result<Planet, Error>) -> Void) {
        guard let urlString = person.homeworld, let url = URL(string: urlString) else { return }
        
        downloader.jsonTask(with: url) { result in
            switch result {
            case .failure(let error): completion(.failure(error))
            case .success(let data):
                do {
                    let result = try JSONDecoder.starwarsDecoder.decode(Planet.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    class func downloadVehicles(completion: @escaping (Result<[Vehicle], Error>) -> Void) {
        guard let url = URL(string: "https://swapi.co/api/vehicles") else { return }
        
        downloader.jsonTask(with: url) { result in
            switch result {
            case .failure(let error): completion(.failure(error))
            case .success(let data):
                do {
                    let result = try JSONDecoder.starwarsDecoder.decode(VehicleResultsData.self, from: data)
                    let vehicles = result.results
                    completion(.success(vehicles))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    class func downloadStarships(completion: @escaping (Result<[Starship], Error>) -> Void) {
        guard let url = URL(string: "https://swapi.co/api/starships") else { return }
        
        downloader.jsonTask(with: url) { result in
            switch result {
            case .failure(let error): completion(.failure(error))
            case .success(let data):
                do {
                    let result = try JSONDecoder.starwarsDecoder.decode(StarshipResultsData.self, from: data)
                    let starships = result.results
                    completion(.success(starships))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
