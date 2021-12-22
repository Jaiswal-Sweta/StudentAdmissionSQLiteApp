//
//  AllNotesListViewController.swift
//  Assignment10
//
//  Created by DCS on 11/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

//
//  AdminNoticeBoardListViewController.swift
//  Assignment11
//
//  Created by DCS on 17/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class StudentViewNoticeBoardListViewController: UIViewController {
    
    
    private var NoticeArray = [Notice]()
    
    private let myTableView = UITableView()
    
    //var a=(UserDefaults.standard.string(forKey: "Name") ?? nil)!

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
    
    private let LogoutButton : UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(OnLogoutClicked), for: .touchUpInside)
        button.backgroundColor = UIColor(cgColor: UIColor.brown.cgColor)
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var s : Student?
        s = SQLiteHandler.shared.FetchStudentSpecific(Spid: UserDefaults.standard.integer(forKey: "SpidUser"))
        NoticeArray = SQLiteHandler.shared.fetchNoticeClasswise(SClass: s!.Class)
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named:"admin_bg")!)
        view.backgroundColor = .white
        view.addSubview(myTableView)
        setupTableView()
        view.addSubview(SubTitleLabel)
        view.addSubview(LogoutButton)
        SubTitleLabel.text = """
        Notice Board
        """
        
    }
    
    override func viewDidLayoutSubviews() {
        myTableView.frame = CGRect(x: 0, y: 120, width:view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom-100)
        SubTitleLabel.frame = CGRect(x: 10, y: 50, width: view.frame.size.width, height: 100)
        
        LogoutButton.frame = CGRect(x: 70, y: 600, width: view.frame.size.width-150, height: 35)
    }
    
}

extension StudentViewNoticeBoardListViewController :UITableViewDataSource,UITableViewDelegate {
    
    @objc func OnLogoutClicked()
    {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    private func setupTableView()
    {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "NotesCell")
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoticeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath)
        let notes = NoticeArray[indexPath.row]
        cell.textLabel!.numberOfLines = 0
        cell.textLabel?.textAlignment = .left
        cell.layer.borderColor = UIColor.brown.cgColor
        cell.layer.borderWidth = 2
        
        cell.textLabel?.text = " \(notes.NoticeDate) \n Class : \(notes.Class) \n Notice Title : \(notes.NoticeTitle)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = StudentNoticeBoardViewController()
        vc.notice = NoticeArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

