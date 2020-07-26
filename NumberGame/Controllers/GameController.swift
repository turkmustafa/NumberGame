//
//  GameController.swift
//  NumberGame
//
//  Created by Mustafa Türk on 26.07.2020.
//  Copyright © 2020 Mustafa Türk. All rights reserved.
//

import UIKit

class GameController: UIViewController, InputDelegate {
    var number = Number()
    var predictions: [Number] = [] {
        didSet {
            predictionsView.data = predictions
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number.generate()
        setupNewGameButton()
        setupInputContainer()
        setupPredictionsView()
        view.addConstraintsWithFormat(format: "V:[v0]-16-[v1]-16-[v2]|", views: newGameButton, inputContainer, predictionsView)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleContainer)))
    }
    
    @objc func handleContainer() {
        inputContainer.input.endEditing(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.gradient(
            .init(red: 1, green: 75/255, blue: 31/255, alpha: 1),
            .init(red: 1, green: 144/255, blue: 104/255, alpha: 1),
        startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 1))
        
    }
    // MARK: - View Layout
    
    var newGameButton = NewGameButton()
    fileprivate func setupNewGameButton() {
        view.addSubview(newGameButton)
        newGameButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35).isActive = true
        newGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        newGameButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        newGameButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        newGameButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleNewGame)))
    }
    
    @objc func handleNewGame() {
        inputContainer.input.text = ""
        predictions = []
        number.generate()
        predictionsView.number.value = number.value
    }
    
    var inputContainer = InputContainer()
    fileprivate func setupInputContainer() {
        inputContainer.delegate = self
        view.addSubview(inputContainer)
        inputContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        inputContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    var predictionsView = PredictionsView()
    fileprivate func setupPredictionsView() {
        predictionsView.number.value = number.value
        view.addSubview(predictionsView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: predictionsView)
    }
    
    // MARK: - Input Control
    
    func inputReceived(_ inputContainer: InputContainer, value: String?) {
        guard let value = value else { return }
        let prediction = Number(string: value)
        predictions.insert(prediction, at: 0)
        if number.compare(with: prediction) == "++++" {
            handleSuccess(value)
        }
    }
    
    // MARK: - Success
    
    fileprivate func handleSuccess(_ value: String) {
        let alertController = UIAlertController(title: "Tebrikler!", message: "\(value) sayısını \(predictions.count). tahmininizde buldunuz.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Yeni Oyun", style: .destructive, handler: { (newGame) in
            self.handleNewGame()
        }))
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }    
}
