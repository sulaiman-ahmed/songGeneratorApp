//
//  ViewController.swift
//  SongGenerator
//
//  Created by Sulaiman  Ahmed on 7/9/20.
//  Copyright © 2020 Sulaiman  Ahmed. All rights reserved.
//

import UIKit

func createShortName(_ name: String) -> String{
    var newName = name;
    newName.remove(at: name.startIndex)
    let vowelSet: [Character] = ["a", "e", "i", "o", "u"]
    while !vowelSet.contains(newName[newName.startIndex]) {
        newName.remove(at: newName.startIndex)
    }
    return newName
}

func createSong(_ name: String) -> String {
    return "\(name), \(name), Bo B\(createShortName(name)) \nBanana Fanana Fo F\(createShortName(name)) \nMy My Mo M\(createShortName(name)) \n\(name)"
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


class ViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var songView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        songView.text = ""
    }
    
    @IBAction func displaySong(_ sender: Any) {
        if nameField.text != "" {
            let lyrics = createSong(nameField.text!)
            songView.text = lyrics
        }
    }
    
}




