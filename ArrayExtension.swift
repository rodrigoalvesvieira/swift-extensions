//
//  ArrayExtension.swift
//
extension Array {

    ///  Iterates through all of the array's elements
    ///
    func forEach(doThis: (element: T) -> Void) {
        for e in self {
            doThis(element: e)
        }
    }
}
