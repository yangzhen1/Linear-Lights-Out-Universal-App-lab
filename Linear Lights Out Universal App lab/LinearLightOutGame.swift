//
//  LinearLightOutGame.swift
//  Linear Lights Out Universal App lab
//
//  Created by Sisyphus on 6/23/21.
//

import Foundation



class LinearLightsOutGame: CustomStringConvertible {
    
    
    var State: Bool? = false
    let numLights: Int
  
    var lightStates : [Bool]
    
    var Moves : Int
    
    
    init(numLights: Int){
        
        lightStates = [Bool](repeating: false, count: numLights)
        
        for k in 0...12 {
            if Int(arc4random_uniform(UInt32(2))) == 1{
                lightStates[k] = true;
            }else{
                lightStates[k] = false;
            }
        }
        
        print(lightStates)
        
        
        Moves = 0
        self.numLights = numLights
        
    }
    
    
    
    
    func CS(_ income: Int){
        if lightStates[income] == true {
            lightStates[income] = false
        }else{
            lightStates[income] = true
        }
    }
    func pressedLightAtIndex(_ index: Int){
        
        switch index {
        
        case numLights - 1:
            CS(index)
            CS(index - 1)
        case 0:
            CS(index)
            CS(index + 1)
        default:
            CS(index)
            CS(index + 1)
            CS(index - 1)
        }
        Moves += 1
        checkForWin()
        
        if State == true {
            print("it's over!!!!")
            return
        }
        
        
    }
  
    func checkForWin(){
        State = true
        for bbs in lightStates {
            if bbs == true {
                State = false
            }
        }
    }


    var description: String {
        var lights = ""
        for lightState in lightStates {
          lights += lightState ? "1" : "0"
        }
        return "Lights: \(lights)  Moves: \(Moves) \(State!)"
      }

}

