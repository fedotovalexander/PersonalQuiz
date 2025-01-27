//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexander Fedotov on 08.01.2025.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension ResultViewController {
    
    private func updateResult() {
        var frenquencyOfAnimals: [Animal: Int] = [:]
        let animals = answers.map{ $0.animal }
        
        for animal in animals {
           if let count = frenquencyOfAnimals[animal] {
               frenquencyOfAnimals.updateValue(count + 1, forKey: animal)
            } else {
                frenquencyOfAnimals[animal] = 1
            }
        }
        
        let sortedAnimals = frenquencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequentAnimal = sortedAnimals.first?.key else { return }
       
        updateDescription(for: mostFrequentAnimal)
    }
    private func updateDescription(for animal: Animal) {
        animalLabel.text = "Вы - \(animal.rawValue)"
        descriptionLabel.text = animal.definition
    }
    
}
