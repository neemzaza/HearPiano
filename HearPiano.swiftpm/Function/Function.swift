import SwiftUI
import Subsonic

func nameOfNote(number: Int) -> String {
    if number == 0 {
        return "C" 
    } else if number == 1 {
        return "C#" 
    } else if number == 2 {
        return "D" 
    } else if number == 3 {
        return "D#" 
    } else if number == 4 {
        return "E" 
    } else if number == 5 {
        return "F" 
    } else if number == 6 {
        return "F#" 
    } else if number == 7 {
        return "G" 
    } else if number == 8 {
        return "G#" 
    } else if number == 9 {
        return "A" 
    } else if number == 10 {
        return "A#" 
    } else if number == 11 {
        return "B" 
    } else {
        return "."
    }
}
