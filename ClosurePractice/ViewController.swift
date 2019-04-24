//
//  ViewController.swift
//  ClosurePractice
//
//  Created by Prudhvi Gadiraju on 4/23/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var allWords = [String]()
    var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "words", ofType: "rtf")!
        let url = URL(fileURLWithPath: path)
        if let fileContents = try? String(contentsOf: url) {
            allWords = fileContents.components(separatedBy: "\\\n")
        }
        
        startGame()
    }
    
    func startGame() {
        let word = allWords.randomElement()
        title = word
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
}

