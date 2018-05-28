import Foundation
import StoreKit

class ProductIdentifiersValidator {
    static func validate(withProductIdentifiers productIdentifiers: Set<String>) -> SKProductsResponse {
        let semaphore = DispatchSemaphore(value: 0)
        let request = SKProductsRequest(productIdentifiers: productIdentifiers)
        var result: SKProductsResponse?
        let delegate = Delegate { response in
            result = response
            semaphore.signal()
        }
        request.delegate = delegate
        request.start()
        semaphore.wait()
        return result!
    }

    private class Delegate: NSObject, SKProductsRequestDelegate {
        private let handler: (SKProductsResponse) -> Void

        init(handler: @escaping (SKProductsResponse) -> Void) {
            self.handler = handler
        }

        func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
            handler(response)
        }
    }
}
