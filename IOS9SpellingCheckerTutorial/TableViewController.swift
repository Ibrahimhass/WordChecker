//
//  TableViewController.swift
//  IOS9SpellingCheckerTutorial
//
//  Created by Arthur Knopper on 18/12/15.
//  Copyright © 2015 Arthur Knopper. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    let words = ["devalopment", "development","devellopment"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.replaceWord("Dewelopment"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = words[indexPath.row]
        cell.textLabel?.backgroundColor = UIColor.clear

        return cell
    }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath)!
    if wordIsSpelledCorrect((cell.textLabel?.text)!) {
      cell.backgroundColor = UIColor.green
    } else {
      cell.backgroundColor = UIColor.red
    }
    
    tableView.reloadData()
  }
    func replaceWord(_ word: String) -> String
    {
        let checker = UITextChecker()
        let range = NSMakeRange(0, word.characters.count)
        let result = checker.guesses(forWordRange: range, in: word, language: "en")
        print (result)
        return (result![0])
    }
  func wordIsSpelledCorrect(_ word: String) -> Bool {
    let checker = UITextChecker()
    let range = NSMakeRange(0, word.characters.count)
    let wordRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
    
    return wordRange.location == NSNotFound
  }
}
