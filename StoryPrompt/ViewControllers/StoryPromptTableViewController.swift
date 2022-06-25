//
//  StoryPromptTableViewController.swift
//  StoryPrompt
//
//  Created by Angelica dos Santos on 23/06/22.
//

import UIKit

class StoryPromptTableViewController: UITableViewController {
    
    var storyPrompts = [StoryPromptEntry]()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateStoryPrompList), name: .StoryPromptSaved, object: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return storyPrompts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryPromptCell", for: indexPath) as? MyCustomCell
        
        cell?.titleLabel?.text = "Prompt \(indexPath.row + 1)"
        
//        cell.textLabel?.text = "Prompt \(indexPath.row + 1)"
//        cell.imageView?.image = storyPrompts[indexPath.row].image
        
//                var content = cell.defaultContentConfiguration()
//                content.text = "Prompt \(indexPath.row + 1)"
//                content.image = storyPrompts[indexPath.row].image
//                cell.contentConfiguration = content
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = storyPrompts[indexPath.row]
        performSegue(withIdentifier: "ShowStoryPromptSegue", sender: story)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStoryPromptSegue" {
            guard let storyPromptViewController = segue.destination as? StoryPromptViewController,
                  let storyPrompt = sender as? StoryPromptEntry else {
                return
            }
            
            storyPromptViewController.storyPrompt = storyPrompt
        }
    }
    
    @IBAction func saveStoryPrompt(unwindSegue: UIStoryboardSegue) {
        //        guard let storyPromptViewController = unwindSegue.source as? StoryPromptViewController,
        //              let storyPrompt = storyPromptViewController.storyPrompt else {
        //            return
        //        }
        //        storyPrompts.append(storyPrompt)
        //        tableView.reloadData()
    }
    
    @IBAction func cancelStoryPrompt(unwindSegue: UIStoryboardSegue) {
        
    }
    
    @objc func updateStoryPrompList(notification: Notification) {
        guard let storyPrompt = notification.object as? StoryPromptEntry else {
            return
        }
        storyPrompts.append(storyPrompt)
        tableView.reloadData()
    }
}
