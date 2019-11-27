import Foundation

final class JSONDownloader {
    private let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func jsonTask(with url: URL, completionHandler completion: @escaping (Result<Data, DataError>) -> Void) -> URLSessionDataTask {
        let task = session.dataTask(with: url) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed))
                return
            }
            
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        completion(.success(data))
                    }
                } else {
                    completion(.failure(.invalidData))
                }
            } else {
                completion(.failure(.responseUnsuccessful))
            }
            
        }
        
        return task
    }
}
