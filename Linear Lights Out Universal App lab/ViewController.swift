//
//  ViewController.swift
//  Linear Lights Out Universal App lab
//
//  Created by Sisyphus on 6/23/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameStateLabel: UILabel!
    
    @IBOutlet var gameBoardButtons: [UIButton]!
    
    @IBOutlet weak var gameStateNavBar: UINavigationBar!
    
    
    var game = LinearLightsOutGame(numLights: 13)
    var offImage = #imageLiteral(resourceName: "light_off.png")
    var onImage = #imageLiteral(resourceName: "light_on.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        // Do any additional setup after loading the view.
    }


    @IBAction func pressedNewGame(_ sender: Any) {
        
        game = LinearLightsOutGame(numLights: 13)
        
        updateView()
        print("newGame")
    }
    @IBAction func pressedGameBoardButton(_ sender: Any) {
        
        let button = sender as! UIButton
        print(button.tag)
        
        game.pressedLightAtIndex(button.tag)
        updateView()
    }
    
    
    func updateView(){
        
        print("\(game)")
        
        
        if traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact {
            // for iphone
            if game.State!{
                gameStateLabel.text = "Win in \(game.Moves) turns!!!"
            }else{
                gameStateLabel.text = "Turn all the lights off! #Turns: \(game.Moves)"
            }
            
        }else{
            // for ipad
            if game.State!{
                gameStateNavBar.topItem?.title = "Win in \(game.Moves) turns!!!"
            }else{
                gameStateNavBar.topItem?.title = "Turn all the lights off! #Turns: \(game.Moves)"
            }
        }
         
        for button in gameBoardButtons {
            let buttonIndex = button.tag
            
            if game.lightStates[button.tag]{
                button.setImage(onImage, for: .normal)
            }else{
                button.setImage(offImage, for: .normal)
            }
        }
        
        if game.State == true{
            return
        }
        
        
        
    }
}

