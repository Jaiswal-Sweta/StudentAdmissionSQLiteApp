//
//  StudentNoticeBoardViewController.swift
//  Assignment11
//
//  Created by DCS on 17/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class StudentNoticeBoardViewController: UIViewController {

    var notice:Notice?
    var ClassOfStudent:String?
    
    private let SubTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Notice Board"
        label.textColor = .brown
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 30)
        label.textAlignment = .center
        label.numberOfLines = 3
        label.backgroundColor = .clear
        label.shadowColor = .black
        return label
    }()
    
    private let NameLabel : UILabel = {
        let label = UILabel()
        label.text = "File Name : "
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder =
            NSAttributedString(string: "Enter Your Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textField.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        textField.text = ""
        textField.textColor = .black
        textField.textAlignment = .center
        textField.backgroundColor = .clear
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        //textField.layer.cornerRadius = 15
        return textField
    }()
    
    //Birthdate
    private let DateLabel : UILabel = {
        let label = UILabel()
        label.text = "Date : "
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    private let DatePicker : UIDatePicker = {
        let db = UIDatePicker()
        db.timeZone = NSTimeZone.local
        db.datePickerMode = UIDatePicker.Mode.date
        db.layer.borderWidth = 1
        db.layer.borderColor = UIColor.black.cgColor
        db.tintColor = .black
        db.backgroundColor = .white
        db.setValue(UIColor.black, forKey: "textColor")
        let date = Date()
        db.setDate(date, animated: false)
        return db
    }()
    
    private let contentTextView : UITextView = {
        let TextView = UITextView()
        TextView.text = ""
        TextView.font = UIFont(name: "HoeflerText-BlackItalic", size: 20)
        TextView.textAlignment = .left
        TextView.backgroundColor = .clear
        TextView.textColor = .black
        TextView.layer.borderWidth = 5
        TextView.layer.borderColor = UIColor.black.cgColor
        return TextView
    }()
    //class
    private let ClassLabel : UILabel = {
        let label = UILabel()
        label.text = "Class :"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    private let ClassPickerView : UIPickerView = {
        let pickerview = UIPickerView()
        pickerview.setValue(UIColor.black, forKeyPath: "textColor")
        pickerview.backgroundColor = .white
        pickerview.layer.borderWidth = 1
        pickerview.layer.borderColor = UIColor.black.cgColor
        pickerview.tintColor = .black
        return pickerview
    }()
    
    private let ClassArray = ["Computer Science","Biology","Micro-Biology","Environmental Science"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"admin_bg")!)
        
        view.addSubview(SubTitleLabel)
        view.addSubview(NameLabel)
        view.addSubview(nameTextField)
        view.addSubview(DateLabel)
        view.addSubview(DatePicker)
        view.addSubview(contentTextView)
        view.addSubview(ClassLabel)
        view.addSubview(ClassPickerView)
        ClassPickerView.delegate = self
        ClassPickerView.dataSource = self
        
        
        if let n = notice
        {
            nameTextField.text = n.NoticeTitle  // set name
            
            // set class pickerview
            //          var Classlength: Int = ClassArray.count
            for i in 0..<ClassArray.count
            {
                if String(n.Class) == ClassArray[i]
                {
                    print("Class Array =",ClassArray[i])
                    ClassPickerView.selectRow(i,inComponent: 0,animated: false)
                }
            }
            
            //set date picker
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd'/'MM'/'yyyy'"
            let date = dateFormatter.date(from: n.NoticeDate)
            DatePicker.setDate(date!, animated: true)
            
            contentTextView.text = n.NoticeDescription
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        SubTitleLabel.frame = CGRect(x: 10, y: 50, width: view.frame.size.width, height: 100)
        NameLabel.frame = CGRect(x: 10, y: 120, width: 100, height: 30)
        nameTextField.frame = CGRect(x: 120, y: 120, width: 240, height: 30)
        DateLabel.frame = CGRect(x: 15, y: 160, width: 100, height: 30)
        DatePicker.frame = CGRect(x: 120, y: 160, width: 240, height: 40)
        ClassLabel.frame = CGRect(x: 15, y: 210, width: 100, height: 30)
        ClassPickerView.frame = CGRect(x: 120, y: 210, width: 240, height: 50)
        contentTextView.frame = CGRect(x: 10, y: 270, width: view.frame.size.width - 15, height: 300)
        
    }
}

extension StudentNoticeBoardViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ClassArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ClassArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ClassOfStudent = ClassArray[row]
    }
    
}
