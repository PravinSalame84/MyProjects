//
//  ViewController.swift
//  FloatingMenu
//
//  Created by Pravin Kumar Salame on 31/08/18.
//  Copyright © 2018 Pravin’s MacBook Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ALRadialMenuDelegate {
    
    @IBOutlet weak var socialButton: UIButton!
    let myRadialMenu:NSMutableArray = NSMutableArray()
    var socialMenu: ALRadialMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        socialMenu = ALRadialMenu()
        socialMenu?.delegate = self
        socialMenu?.fadeItems = true
        socialMenu?.buttonSize = 40
        socialMenu?.buttonsWillAnimateFromButton(socialButton, withFrame: socialButton.frame, in: self.view)
        UIView.animate(withDuration: 1) {
            self.socialMenu?.transform = CGAffineTransform.identity.scaledBy(x: 2, y: 2)
        }
    }

    
    func numberOfItems(in radialMenu: ALRadialMenu!) -> Int {
        if radialMenu == self.socialMenu {
            return 3
        }
        return 0
    }
    
    func arcSize(for radialMenu: ALRadialMenu!) -> Int {
        if radialMenu == self.socialMenu {
            return 180
        }
        return 0
    }
    
    func arcRadius(for radialMenu: ALRadialMenu!) -> Int {
        if radialMenu == self.socialMenu {
            return 0
        }
        return 0
    }
    
    func radialMenu(_ radialMenu: ALRadialMenu!, buttonFor index: Int) -> ALRadialButton! {
        
         if(index>self.myRadialMenu.count){
            let button = ALRadialButton()
            if index == 1 {
                button.setImage(UIImage(named: "good_service"), for: .normal)
            }else if index == 2 {
                button.setImage(UIImage(named: "average_service"), for: .normal)
            }else if index == 3 {
                button.setImage(UIImage(named: "bad_service"), for: .normal)
            }
            self.myRadialMenu.add(button)
            if ((button.imageView?.image) != nil) {
                return button;
            }
            return nil
         }else{
            return self.myRadialMenu[index-1] as! ALRadialButton
        }
    }
    
    func radialMenu(_ radialMenu: ALRadialMenu!, didSelectItemAt index: Int) {
        if radialMenu == socialMenu {
            //self.socialMenu?.itemsWillDisapear(into: self.socialButton)
            for item in self.myRadialMenu{
                let redialMenu:ALRadialButton = item as! ALRadialButton
                redialMenu.isSelected = false
                redialMenu.zoomOutSelected()
            }
            let myRadialMenu = self.myRadialMenu[index-1] as! ALRadialButton
            myRadialMenu.isSelected = !myRadialMenu.isSelected
            //radialMenu.zoomSelected()
            if(myRadialMenu.isSelected){
                myRadialMenu.zoomInSelected()
            }else{
                myRadialMenu.zoomOutSelected()
            }
            if index == 1 {
                print("good")
            }else if index == 2 {
                print("average")
            }else if index == 3 {
                print("bad")
            }
        }
    }
    
    func radialMenu(_ radialMenu: ALRadialMenu!, shouldRotateMenuButtonWhenItemsAppear button: UIButton!) -> Bool {
        return false
    }
    
    func radialMenu(_ radialMenu: ALRadialMenu!, shouldRotateMenuButtonWhenItemsDisappear button: UIButton!) -> Bool {
        return false
    }

    @IBAction func menuAction(_ sender: UIButton) {
        if sender == socialButton {
            //socialMenu?.buttonsWillAnimateFromButton(sender, withFrame: socialButton.frame, in: self.view)
        }
    }

}



