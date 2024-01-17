import XCTest
@testable import ReverseWords2

final class ReverseWords2Tests: XCTestCase {

    var sut: ReverseWordsViewController!
    var actualOutput: String?
    var expectedOutput: String?
    var ignoreSymbols = "xl"
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = makeSut()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testExample1() throws {
        //input: "Foxminded cool 24/7", expectedOutput: "dednimxoF looc 24/7";
        actualOutput = sut.reverse.reverseWords("Foxminded cool 24/7", with: sut.reverse.alphabeticRule)
        expectedOutput = "dednimxoF looc 24/7"
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    func testExample2() {
        //input: "abcd efgh", expectedOutput: "dcba hgfe";
        actualOutput = sut.reverse.reverseWords("abcd efgh", with: sut.reverse.alphabeticRule)
        expectedOutput = "dcba hgfe"
        XCTAssertEqual(actualOutput, expectedOutput)
    }

    func testExample3() {
        //input: "a1bcd efg!h", expectedOutput: "d1cba hgf!e"
        actualOutput = sut.reverse.reverseWords("a1bcd efg!h", with: sut.reverse.alphabeticRule)
        expectedOutput = "d1cba hgf!e"
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    func testExample4() {
        //input: "Foxminded cool 24/7", expectedOutput: "dexdnimoF oocl 7/42";
        actualOutput =  sut.reverse.reverseWords("Foxminded cool 24/7", with: sut.reverse.customRule, ignoreSymbols)
        expectedOutput = "dexdnimoF oocl 7/42"
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    func testExample5() {
        //input: "abcd efgh", expectedOutput: "dcba hgfe";
        actualOutput =  sut.reverse.reverseWords("abcd efgh", with: sut.reverse.customRule, ignoreSymbols)
        expectedOutput = "dcba hgfe"
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    func testExample6() {
        //input: "a1bcd efglh", xpectedOutput: "dcb1a hgfle";
        actualOutput =  sut.reverse.reverseWords("a1bcd efglh", with: sut.reverse.customRule, ignoreSymbols)
        expectedOutput = "dcb1a hgfle"
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    func makeSut() -> ReverseWordsViewController {
        let bundle = Bundle(for: ReverseWordsViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let sut = storyboard.instantiateViewController(identifier: "ReverseWords") as! ReverseWordsViewController
        sut.loadViewIfNeeded()
        return sut
    }
    
}
