//
//  ViewController.swift
//  GuessFlag
//
//  Created by Mehar on 22/09/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    let titleLabel = UILabel()
    let scoreLabel = UILabel()
    var questionsAsked = 0
    
    lazy var titleStackView: UIStackView = {
           
           titleLabel.textAlignment = .center
           titleLabel.text = "Title"
           
        scoreLabel.textAlignment = .center
        scoreLabel.text = "Score: 0"
           let stackView = UIStackView(arrangedSubviews: [titleLabel, scoreLabel])
           stackView.axis = .vertical
           return stackView
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("us")
        countries.append("uk")
       
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
      
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        navigationItem.titleView = titleStackView
        askQuestion(action: nil)
    }
    override func viewWillLayoutSubviews() {
           super.viewWillLayoutSubviews()

           if view.traitCollection.horizontalSizeClass == .compact {
               titleStackView.axis = .vertical
               titleStackView.spacing = UIStackView.spacingUseDefault
           } else {
               titleStackView.axis = .horizontal
               titleStackView.spacing = 20.0
           }
       }
    
    func askQuestion(action: UIAlertAction!){
        questionsAsked += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
      
        
        titleLabel.text = countries[correctAnswer].uppercased()
        scoreLabel.text = "Score:\(score)"
        
        if (questionsAsked % 10 == 0){
            //show the score in alert message
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
              ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            ac.addAction(UIAlertAction(title: "New Game", style: .default, handler: refreshGame))
           
              present(ac,animated: true)
        }
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
       // var title: String
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        }else{
            title = "Wrong"
            score -= 1
            let ac = UIAlertController(title: title, message: "Thats the flag of \(countries[sender.tag].uppercased())", preferredStyle: .alert)
              ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
              present(ac,animated: true)
        }
        askQuestion(action: nil)
        
      /*  let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac,animated: true)*/
        
    }
    func refreshGame(action: UIAlertAction!){
        
         score = 0
         correctAnswer = 0
         questionsAsked = 0
         
         scoreLabel.text = "Score:\(score)"
    }
    //MARK: - Navigation bar
  
}

