import XCTest
@testable import SyncedStoreKit

class SyncedStoreKitTests: XCTestCase {
    let productAId = "productA"

    func testExample() {
        let response = ProductIdentifiersValidator.validate(withProductIdentifiers: [productAId])
        XCTAssertTrue(
            response.invalidProductIdentifiers.contains(productAId)
        )
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            _ = ProductIdentifiersValidator.validate(withProductIdentifiers: [productAId])
        }
    }
}
