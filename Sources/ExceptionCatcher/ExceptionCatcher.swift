import Foundation
import Internal

public enum ExceptionCatcher {
	/**
	Catch a Objective-C exception.

	- Returns: The value returned from the given callback.

	```swift
	import Foundation
	import ExceptionCatcher

	final class Foo: NSObject {}

	do {
		let value = try ExceptionCatcher.catch {
			return Foo().value(forKey: "nope")
		}

		print("Value:", value)
	} catch {
		print("Error:", error.localizedDescription)
		//=> Error: The operation couldn’t be completed. [valueForUndefinedKey:]: this class is not key value coding-compliant for the key nope.
	}
	```
	*/
	@discardableResult
	public static func `catch`<T>(callback: () -> T) throws -> T {
		var returnValue: T!

		try _ExceptionCatcher.catchException {
			returnValue = callback()
		}

		return returnValue
	}
}
