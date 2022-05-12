//
//  Service.swift
//  ChuckNorrisFacts
//
//  Created by Carlos Barcelos on 22/06/21.
//

import Foundation

class Service {
    func makeRequest<T: Decodable>(endPoint: APIEndpoints, fragment: String, completion: @escaping (Result<T, APIErrors>) -> Void) {
        do {
            let urlRequest = try makeURLRequest(endPoint: endPoint, fragment: fragment)

            let session = URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
                if let error = error {
                    // erro na request
                    print(error.localizedDescription)
                }

                if let response = urlResponse as? HTTPURLResponse, let data = data {
                    if response.statusCode == 200 {
                        do {
                            completion(.success(try self.parse(data: data)))
                        } catch {
                            print(error)
                        }
                    } else {
                        // status code != 200
                        completion(.failure(.backendError(statusCode: response.statusCode)))
                    }
                }
            }
            session.resume()
        } catch {}
    }

    private func makeURLRequest(endPoint: APIEndpoints, fragment: String) throws -> URLRequest {
        guard let url = URLConstructFrom(endPoint: endPoint, fragment: fragment) else {
            throw APIErrors.invalidURL
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endPoint.method
        return urlRequest
    }

    private func URLConstructFrom(endPoint: APIEndpoints, fragment: String) -> URL? {
        var component: URLComponents
        switch endPoint {
        case .search:
            component = APIEndpoints.search.url
            component.queryItems = [URLQueryItem(name: "query", value: fragment)]
            let url = component.url
            return url
        }
    }

    private func parse<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
