//
//  ViewController.swift
//  homework without IB
//
//  Created by Admin on 20.01.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let width = UIScreen.main.bounds.width
    
    var pic = UIImageView()
    var stepLabel = UILabel()
    var textView = UITextView()
    let backButton = UIButton()
    let nextButton = UIButton()
    
    var dataArray: [Model] = [
        Model(image: "1.png", title: "Кадаиф", description: "Нежные и хрупкие, эти сладости просто изумительны по своему вкусу. Кадаиф или катаиф – турецкое пирожное, которое готовится по особому рецепту. Порезанное соломкой ультратонкое тесто, печётся вместе с миндальной крошкой и другими кондитерскими приправами в сиропе."),
        Model(image: "2.png", title: "Пахлава", description: "Пахлава - это медовое лакомство, название которого турки произносят что-то вроде «баклава»."),
        Model(image: "3.png", title: "Пишмание", description: "С детства все знакомы с халвой и нугой. Эти восточные сладости привычны и встречаются очень часто. Но в соревнованиях с самими собой в мастерстве приготовления халвы и нуги турецкие кулинары изобрели пишмание. Если коротко пишмание - это халва из сахарных волокон."),
        Model(image: "4.png", title: "Рахат-лукум", description: "Рахат-лукум, или просто лукум, было излюбленным лакомством Сулеймана Великолепного, султана Османской империи. Кондитер, Хаджи Бекир, подарил эти «кусочки удовольствия» своему правителю после возвращения из Мекки. Настоящий рахат лукум делают из воды, крахмала, сахара и эссенции из лепестков роз. Рецепт существует уже более 500 лет. Именно Хаджи Бекир начал добавлять в лукум орехи и другие начинки."),
        Model(image: "5.png", title: "Тавук гегсю", description: "Тавук гегсю можно перевести с турецкого языка, как «куриная грудка». Это эксклюзивный турецкий десерт на молоке с добавлением рисового крахмала и муки, а «фишкой» является куриное мясо, которое перетирается в однородное пюре и добавляется к смеси. На вкус оно абсолютно не определяется, но придает необычность структуре блюда и тонкий ароматный оттенок.")
    ]
    
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        title = dataArray[index].title
        setupStep()
        setupPic()
        setupBackButton()
        setupNextButton()
        setupTextView()
    }
    
    func setupStep() {
        stepLabel.textColor = #colorLiteral(red: 0, green: 0.5843137255, blue: 0.4509803922, alpha: 1)
        stepLabel.text = "Step \(index + 1) from \(dataArray.count)"
        stepLabel.font = UIFont(name: "system", size: 22)
        view.addSubview(stepLabel)
        
        stepLabel.translatesAutoresizingMaskIntoConstraints = false
        stepLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        stepLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        stepLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupPic() {
        pic.image = UIImage(named: dataArray[index].image)
        pic.contentMode = .scaleToFill
        view.addSubview(pic)
        
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.topAnchor.constraint(equalTo: view.topAnchor, constant: 135).isActive = true
        pic.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        pic.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupTextView() {
        textView.text = dataArray[index].description
        textView.textColor = #colorLiteral(red: 0, green: 0.5843137255, blue: 0.4509803922, alpha: 1)
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.isEditable = false
        view.addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: pic.bottomAnchor, constant: 10).isActive = true
        textView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        textView.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -20).isActive = true
    }
    
    func setupBackButton() {
        backButton.setTitle("Back", for: .normal)
        backButton.backgroundColor = #colorLiteral(red: 0, green: 0.5843137255, blue: 0.4509803922, alpha: 1)
        backButton.layer.cornerRadius = 10
        backButton.layer.borderWidth = 1.0
        backButton.layer.borderColor = UIColor.white.cgColor
        backButton.addTarget(self, action: #selector(backPic), for: .touchUpInside)
        backButton.isHidden = true
        view.addSubview(backButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupNextButton() {
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = #colorLiteral(red: 0, green: 0.5843137255, blue: 0.4509803922, alpha: 1)
        nextButton.layer.cornerRadius = 10
        nextButton.layer.borderWidth = 1.0
        nextButton.layer.borderColor = UIColor.white.cgColor
        nextButton.addTarget(self, action: #selector(nextPic), for: .touchUpInside)
        view.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // MARK: - OBJC methods
    @objc func backPic() {
        index -= 1
        updateUI()
        nextButton.isHidden = false
        backButton.isHidden = (index == 0) ? true : false
    }
    
    @objc func nextPic() {
        index += 1
        updateUI()
        backButton.isHidden = false
        nextButton.isHidden = (index == dataArray.count - 1) ? true : false
    }
    
    func updateUI() {
        stepLabel.text = "Step \(index + 1) from \(dataArray.count)"
        title = dataArray[index].title
        pic.image = UIImage(named: dataArray[index].image)
        textView.text = dataArray[index].description
    }

}

