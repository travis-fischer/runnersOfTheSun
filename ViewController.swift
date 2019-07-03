//
//  ViewController.swift
//  RunnersOfTheSun
//
//  Created by Amelia Merrill on 1/27/19.
//  Copyright © 2019 CandySomething inc. All rights reserved.
//


import Foundation
import UIKit

extension UIView {
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 3
        clipsToBounds = false
    }
    
    func addBoarder() {
        layer.borderWidth = 2.0
        layer.borderColor = UIColor(displayP3Red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0).cgColor
        layer.cornerRadius = 18
        clipsToBounds = true
        
    }
}

class ViewController: UIViewController {
    
//    @IBOutlet weak var dailyReadingLabel: UIImageView!
    
    @IBOutlet weak var card6: UIButton!
    @IBOutlet weak var card5: UIButton!
    @IBOutlet weak var card4: UIButton!
    @IBOutlet weak var card3: UIButton!
    @IBOutlet weak var card2: UIButton!
    @IBOutlet weak var card1: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(displayP3Red: 255/255.0, green: 216/255.0, blue: 222/255.0, alpha: 1.0)
        
        card1.addBoarder()
        card2.addBoarder()
        card3.addBoarder()
        card4.addBoarder()
        card5.addBoarder()
        card6.addBoarder()
        
    }
    
    // Rotation Animations
    func rotateCard(_ card: UIView) {
        let random = Float.random(in: -0.03 ..< 0.03)
        UIView.animate(withDuration: 0.3, animations: {
            card.transform = CGAffineTransform(rotationAngle: (CGFloat(random * -.pi)))
            self.view.layoutIfNeeded()
        })
    }
    
    func rotateAll() {
        rotateCard(card6)
        rotateCard(card5)
        rotateCard(card4)
        rotateCard(card3)
        rotateCard(card2)
        rotateCard(card1)
        
    }
    
    var currentCard: UIView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    var nextCard: UIView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    var isShuffling = false
    var chosenCard: UIView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    
    
    func checkForNextCard(_ card: UIView) -> UIView {
        switch card {
        case self.card1: nextCard = self.card6
        case self.card2: nextCard = self.card1
        case self.card3: nextCard = self.card2
        case self.card4: nextCard = self.card3
        case self.card5: nextCard = self.card4
        case self.card6: nextCard = self.card5
        default: fatalError("Could Not Find Next Card")
        }
        return nextCard
    
    }
    // Shuffling Animations
    func sendCardToFront(_ card: UIView) {
        UIView.animate(withDuration: 0.1, animations: {
            self.view.bringSubviewToFront(card)
            self.view.layoutIfNeeded()
        }, completion: {finished in
            
        })
    }
    
    func shuffleCard(_ card: UIView) {
        if isShuffling == true {
        UIView.animate(withDuration: 0.25, delay: 0.05, options: [.curveEaseOut, .preferredFramesPerSecond60], animations: {
            card.center = CGPoint(x: 455, y: 300)
            self.view.layoutIfNeeded()
        }, completion: {finished in
            self.currentCard = self.checkForNextCard(card)
            self.returnCard(card)
            self.rotateCard(card)
            self.sendCardToFront(card)
            
            
        })
        } else {UIView.animate(withDuration: 0.25, delay: 0.05, options: [.curveEaseOut, .preferredFramesPerSecond60], animations: {
            card.center = CGPoint(x: 455, y: 300)
            self.view.layoutIfNeeded()
        }, completion: nil)
            
        }
    }
    
    func returnCard(_ card: UIView) {
        if isShuffling == true {
            UIView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseIn, .preferredFramesPerSecond60], animations: {
            card.center = self.view.center
            self.view.layoutIfNeeded()
        }, completion: {finished in
            self.shuffleCard2(self.checkForNextCard(card))
            
        })
        } else {
            UIView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseIn, .preferredFramesPerSecond60], animations: {
                card.center = self.view.center
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func shuffleCard2(_ card: UIView) {
        if isShuffling == true {
        UIView.animate(withDuration: 0.25, delay: 0.05, options: [.curveEaseOut, .preferredFramesPerSecond60], animations: {
            card.center = CGPoint(x: 460, y: 320)
            self.view.layoutIfNeeded()
        }, completion: {finished in
            self.currentCard = self.checkForNextCard(card)
            self.returnCard2(card)
            self.rotateCard(card)
            self.sendCardToFront(card)
            
        })
        } else {
            UIView.animate(withDuration: 0.25, delay: 0.05, options: [.curveEaseOut, .preferredFramesPerSecond60], animations: {
                card.center = CGPoint(x: 460, y: 320)
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func returnCard2(_ card: UIView) {
        if isShuffling == true {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseIn, .preferredFramesPerSecond60], animations: {
            card.center = self.view.center
            self.view.layoutIfNeeded()
        }, completion: {finished in
            self.shuffleCard(self.checkForNextCard(card))
            
        })
        } else {
            UIView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseIn, .preferredFramesPerSecond60], animations: {
                card.center = self.view.center
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    
    
    // MARK: Animation Implimentations
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rotateAll()
    }

    @IBAction func beginShuffle(_ sender: UITapGestureRecognizer) {
        if isShuffling == false {
            isShuffling = true
            shuffleCard(card6)
        } else {
            print("shuffling in progress")
        }
    }

    @IBAction func flipNextCard(_ sender: Any) {
        if isShuffling == true {
            isShuffling = false
//            nextCard = self.checkForNextCard(self.currentCard)
            UIView.transition(with: currentCard, duration: 1.5, options: .transitionFlipFromRight, animations: {
                self.currentCard.center = self.view.center
            
            }, completion: {finishied in
                self.isShuffling = false
            })
           
        } else {
    print("waiting for shuffle")
    }
        
    }
    

}
