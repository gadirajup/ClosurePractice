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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptWord))
        
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
    
    @objc func promptWord() {
        let ac = UIAlertController(title: "Enter", message: "You think you got something?", preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [unowned self, ac] (action) in
            let answer = ac.textFields?.first?.text ?? "Nothing"
            self.submit(answer: answer)
        }))
        ac.addAction(UIAlertAction(title: "Nvm", style: .cancel, handler: nil))
        
        present(ac, animated: true)
    }
    
    func submit(answer: String) {
        if isPossible(word: answer) && isOriginal(word: answer) && isReal(word: answer) {
            usedWords.insert(answer, at: 0)
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
        }
    }
    
    func isPossible(word: String) -> Bool {
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        return true
    }
    
    func isReal(word: String) -> Bool {
        return true
    }
}

