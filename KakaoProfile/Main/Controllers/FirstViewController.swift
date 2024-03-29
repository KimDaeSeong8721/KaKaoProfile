//
//  ViewController.swift
//  KakaoProfile
//
//  Created by DaeSeong on 2022/07/09.
//

import UIKit



class FirstViewController: BaseViewController {


    // MARK: - Properties
    

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cell: PersonTableViewCell.self)
        tableView.register(cell: FriendTableViewCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()


    // MARK: - Life Cycle


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }

    override func render() {
        view.addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

    }

    override func configUI() {
        super.configUI()

    }

}


// MARK: - UITableViewDataSource


extension FirstViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DummyData.profileList.count
    }
}


// MARK: - UITableViewDelegate


extension FirstViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withType: PersonTableViewCell.self, for: indexPath)
            cell.configure(info: DummyData.profileList[indexPath.row])
            return cell
        } else {
            tableView.separatorStyle = .none
            let cell = tableView.dequeueReusableCell(withType: FriendTableViewCell.self, for: indexPath)
            cell.configure(info: DummyData.profileList[indexPath.row])
            return cell
        }
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let vc = ProfileViewController()
            vc.modalPresentationStyle = .overFullScreen
            vc.cofigProfile(info:  DummyData.profileList[indexPath.row])
            present(vc, animated: true)
        }
    }


    
}
