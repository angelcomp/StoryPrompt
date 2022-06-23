//
//  StoryPromptTableViewController.swift
//  StoryPrompt
//
//  Created by Angelica dos Santos on 23/06/22.
//

import UIKit

class StoryPromptTableViewController: UITableViewController {

    var storyPrompts = [StoryPromptEntry]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let story = StoryPromptEntry()
        story.number = 5
        story.noun = "toaster"
        story.adjective = "smelly"
        story.verb = "attacks"
        
        let story2 = StoryPromptEntry()
        story2.number = 5
        story2.noun = "toaster"
        story2.adjective = "smelly"
        story2.verb = "attacks"
        
        let story3 = StoryPromptEntry()
        story3.number = 5
        story3.noun = "toaster"
        story3.adjective = "smelly"
        story3.verb = "attacks"
        
        storyPrompts = [story, story2, story3]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return storyPrompts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryPromptCell", for: indexPath)
        cell.textLabel?.text = "Prompt \(indexPath.row + 1)"
        cell.imageView?.image = storyPrompts[indexPath.row].image
        
//        var content = cell.defaultContentConfiguration()
//        content.text = "Prompt \(indexPath.row + 1)"
//        content.image = storyPrompts[indexPath.row].image
//        cell.contentConfiguration = content
        
        return cell
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
    
}
