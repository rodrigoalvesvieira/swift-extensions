//
//  StringExtension.swift
//

extension String {
    ///  Removes any leading or trailing spaces from the given string
    ///
    ///  :returns: An initialized `String` without any leading or trailing spaces.
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }

    /// Returns the `Character` object at the given index in the given `String`
    ///
    ///  :param: index           The index of the character to be returned from the string.
    func chartAt(index: Int) -> Character {
        return self[advance(self.startIndex, index)]
    }
}
