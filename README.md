# 🚀 Requestable

## Installation 

Add to your podfile
```ruby
pod 'Requestable', :git => 'https://github.com/ArifADS/Requestable'
```

## Usage Example

Define your endpoints with `enum` cases.
```swift
enum API {
    case styles
    case beers(styleId: Int)
}
```

Comply to `Requestable` protocol by giving following info
```swift
protocol Requestable {
    var baseURL: String { get }
    var path: String { get }
    var query: [String: Any]? { get }
    var method: HTTPMethod { get }
    var body: Data? { get }
    var headers: [String: String]? { get }
}
```

For example:
```swift
extension API: Requestable {
    var baseURL: String { 
        return "https://api.brewerydb.com"
    }
    
    var path: String {
        switch self {
        case .styles: return "/v2/styles"
        case .beers: return "/v2/beers"
        }
    }
    
    var query: [String : Any]? {
        var params = [String: Any]()
        // You can share same parameters with all your API calls.
        params["key"] = "<Your API Key>" 
        
        switch self {
        case .styles: break;
        case .beers(let styleId):
            params["styleId"] = styleId
            params["hasLabels"] = "Y"
        }
        
        return params
    }
    
    var method: HTTPMethod { return .get }
    var body: Data? { return nil }
    var headers: [String : String]? { return nil }
}
```

Conforming to `Requestable` gives you a `request()` method which returns an `URLRequest` that you can use with `URLSession`, `Alamofire` or any other library of your choice.

If we create a `Responsable` protocol with an asynchronous fetch using [PromiseKit](https://github.com/mxcl/PromiseKit]), like this:

```swift
protocol Responsable {
    func response() -> Promise<Data>
}
```

Our protocol compliance would be something like:
```swift
import PromiseKit

extension API: Responsable {
    func response() -> Promise<Data> {
        let request = self.request()
        return URLSession.shared.dataTask(.promise, with: request)
        .map { $0.data }
    }
}
```

So your final HTTP Request is as easy as 
```swift
let beersData = try API.beers(styleId: 2).response().wait()
// Do whatever with the server data, like JSONDecoder, JSONSerialization, or any other Data serialization of your choice.
```

