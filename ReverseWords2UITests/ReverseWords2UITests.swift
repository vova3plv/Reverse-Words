import XCTest

final class ReverseWords2UITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExampleDefault() throws {
        let textField = app.textFields["TextToReverseID"]
        textField.tap()
        textField.typeText("Foxminded cool 24/7")
        
        app.keyboards.firstMatch.buttons["Return"].tap()
        
        let button = app.buttons["ReverseButtonID"]
        button.tap()
        
        let label = app.staticTexts["ReversedLabel"]
        XCTAssertEqual(label.label, "dednimxoF looc 24/7")
    }
    
    func testExampleCustom() throws {
        let segmnetedControl = app.segmentedControls
        segmnetedControl.buttons.element(boundBy: 1).tap()
        
        let textField = app.textFields["TextToReverseID"]
        textField.tap()
        textField.typeText("Foxminded cool 24/7")
        
        app.keyboards.firstMatch.buttons["Return"].tap()
        
        let textFieldIgnore = app.textFields["TextToIgnoreID"]
        textFieldIgnore.tap()
        textFieldIgnore.typeText("xl")
        
        app.keyboards.firstMatch.buttons["Return"].tap()
        
        let button = app.buttons["ReverseButtonID"]
        button.tap()
        
        
        let label = app.staticTexts["ReversedLabel"]
        XCTAssertEqual(label.label, "dexdnimoF oocl 7/42")
    }

//    func tapOnView() {
//        let view = app.otherElements["ViewID"]
//        view.tap()
//    }
}
