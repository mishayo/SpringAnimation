//
//  ViewController.swift
//  SpringAnimation
//
//  Created by михаил сулим on 27.04.2021.
//

import Spring

class ViewController: UIViewController {
    
    @IBOutlet weak var springAnimationView: SpringView!
    @IBOutlet weak var springAnimationLabel: UILabel!
    @IBOutlet weak var textButton: SpringButton!
    
    
    private let curve = ["spring",
                         "linear",
                         "easeIn",
                         "easeOut",
                         "easeInOut"]
    private let animation = ["shake",
                             "pop",
                             "morph",
                             "squeeze",
                             "wobble",
                             "swing",
                             "flipX",
                             "flipY",
                             "fall",
                             "squeezeLeft",
                             "squeezeRight",
                             "squeezeDown",
                             "squeezeUp",
                             "slideLeft",
                             "slideRight",
                             "slideDown",
                             "slideUp",
                             "fadeIn",
                             "fadeOut",
                             "fadeInLeft",
                             "fadeInRight",
                             "fadeInDown",
                             "fadeInUp",
                             "zoomIn",
                             "zoomOut",
                             "flash"]
    private  var value = ""
    private  var valueAnimationFalse = "slideDown"
    private var valueAnimationTrue = "pop"
    private var valueTougle = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textButton.setTitle("Run", for: .normal)
    }
 
    
    
    @IBAction func runSpringAnimation(_ sender: SpringButton) {
        textButton.setTitle("Run Spring Animation", for: .normal)
        
        if valueTougle {
            valueTougle = false
            valueAnimationFalse = String(animation.randomElement() ?? "slideDown")
            value = valueAnimationTrue
            textButton.setTitle("Run: \(valueAnimationFalse)", for: .normal)
            
            getData()
            
        } else {
            valueTougle = true
            valueAnimationTrue = String(animation.randomElement() ?? "slideDown")
            value = valueAnimationFalse
            textButton.setTitle("Run: \(valueAnimationTrue)", for: .normal)
            getData()
        }
        
    }
    
    
    
    
    
    
    
    private func getData() {
        
        let currentAnimation =  value
        springAnimationView.animation = currentAnimation
        
        let currentCurve = String(curve.randomElement() ?? "spring")
        springAnimationView.curve = currentCurve
        
        let currentForce = CGFloat.random(in: 0.5...2)
        springAnimationView.force = currentForce
        
        let currentDuration = CGFloat.random(in: 0.5...2.5)
        springAnimationView.duration = currentDuration
        
        let currentVelocity = CGFloat.random(in: 0...1)
        springAnimationView.velocity = currentVelocity
        
        let currentDelay = CGFloat.random(in: 0...2)
        springAnimationView.delay = currentDelay
        
        let currentRepeatCount = Float(Int.random(in: 0...2))
        springAnimationView.repeatCount = currentRepeatCount
        
        getLabel(animation: currentAnimation, curve: currentCurve,
                 force: currentForce, duration: currentDuration,
                 velocity: currentVelocity, delay: currentDelay,
                 repeatCount: currentRepeatCount)
        springAnimationView.animate()
    }
    
    
    
    
    private func getLabel(animation: String, curve: String, force: CGFloat, duration: CGFloat, velocity: CGFloat, delay: CGFloat, repeatCount: Float) {
        springAnimationLabel.text = """
animation: \(animation)
curve: \(curve)
force \(String(format: "%.2f", force))
duration \(String(format: "%.2f", duration))
velocity \(String(format: "%.2f", velocity))
delay \(String(format: "%.2f", delay))
repeatCount \(repeatCount)
"""
    }
    
}

