//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Sanjay Noronha on 2016/01/02.
//  Copyright © 2016 funza Academy. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    var spacing = 5
    var stars = 5
    var rating = 0 {
    didSet {
        // this ensures that the UI is always showing an accurate
        // representation of the rating property value.
        setNeedsLayout()
        }
    }
    
    var ratingButtons = [UIButton]()

    
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
       
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<stars {
            let button = UIButton()
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    /* The layoutSubviews method gets called at the appropriate time 
       by the system and gives UIView subclasses a chance to perform a 
       precise layout of their subviews. You’ll need to override this 
       method to place the buttons appropriately.
    */
    override func layoutSubviews() {
        
        let buttonSize = Int(frame.size.height)
        
        //define frame for first button
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing ))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
        
    }
    
    // MARK: Button Action
    
    func ratingButtonTapped(button: UIButton) {

        //crux
        rating = ratingButtons.indexOf(button)! + 1
        
        updateButtonSelectionStates()
        
    }
    
    func updateButtonSelectionStates() {
        
        for (index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected.
            button.selected = index < rating
        }
    }
    


}
