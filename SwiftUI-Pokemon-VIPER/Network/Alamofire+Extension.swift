//
//  Alamofire+Extension.swift
//  SwiftUI-Pokemon-VIPER
//
//  Created by joshua on 9.12.2020.
//

import Alamofire
import Foundation
import Reachability

public enum NetworkError: Error {
    case invalidURL
    case connectionError
    case decodeError(Error)
    case internalError(AFError)
    
    var friendlyMessage: String {
        switch self {
        case .connectionError:
            return "İnternet bağlantısı bulunamadı. Lütfen internet bağlantınızı kontrol edip tekrar deneyin."
        case .invalidURL, .internalError, .decodeError:
            return "Beklenmedik bir hata oluştu. Lütfen daha sonra tekrar deneyiniz."
        }
    }
    
    var title: String {
        switch self {
        case .connectionError:
            return "Bağlantı Hatası"
        case .invalidURL, .internalError, .decodeError:
            return "Hata"
        }
    }
}

//extension Session: ProgressHUDPresentable {
extension Session {
    
    func request<T: EndpointType, E: Decodable>(endpoint: T, dataType: E.Type, completion: @escaping (Result<E, NetworkError>) -> Void) {
        
        guard let endpointURL = endpoint.url else {
            completion(.failure(.invalidURL))
            return
        }
        do {
            let reachability = try Reachability()
            switch reachability.connection {
            case .unavailable:
                completion(.failure(.connectionError))
            default:
                break
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
        
        request(endpointURL,
                method: endpoint.method,
                parameters: endpoint.parameters,
                encoding: endpoint.encoding,
                headers: endpoint.headers
        ).responseDecodable(of: E.self) { (response) in
//            let data = response.data?.parseData(removeString: "null,") // Dummy code. because API result.
//            if let data = data,
//               let pokemons = try? JSONDecoder().decode([Pokemon?].self, from: data)
//            {
//                response.valu
//
//            }
            //Normally should be working like this.
            if let error = response.error {
                completion(.failure(.internalError(error)))
            }
            if let value = response.value {
                completion(.success(value))
            }
        }
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}

protocol EndpointType {
    var baseURL: URL { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var queryParametrs: [URLQueryItem]? { get }
    var path: String { get }
}

extension EndpointType {
    
//    var baseURL: URL {
//        URL(string: "https://poqa.zorlu.com/")!
//    }
    
    var headers: HTTPHeaders? {
        return [:]
//        let basicAuthHeaderValue = BasicAuthGenerator.generate(username: "web_mobil", password: "1qa2ws3ed4rf")
//        let authHeader = HTTPHeader(name: "Authorization", value: basicAuthHeaderValue!)
//        return HTTPHeaders([authHeader])
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var queryParametrs: [URLQueryItem]? {
        return nil
    }
    
    /// Returns the builded endpoint URL.
    var url: URL? {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        components?.path = path
        components?.queryItems = queryParametrs
        return components?.url
    }
}
