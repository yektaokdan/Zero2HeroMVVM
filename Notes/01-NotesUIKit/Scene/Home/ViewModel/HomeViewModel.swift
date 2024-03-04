//
//  HomeViewModel.swift
//  01-NotesUIKit
//
//  Created by yekta on 4.03.2024.
//

import Foundation
class HomeViewModel{
    private var notes = [Notes]()
    var notesCount:Int{
        return notes.count
    }
    
    func addNote(_ note:Notes){
        notes.append(note)
    }
    func noteAtIndex(_ index:Int)->Notes{
        return notes[index]
    }
}
