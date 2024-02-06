//
//  ViewController.swift
//  ProgrammaticTableView
//
//  Created by Sedat on 5.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Variables
    private let images: [UIImage] = [
        UIImage(named: "banana")!,
        UIImage(named: "cheese")!,
        UIImage(named: "egg")!,
        UIImage(named: "hazelnut")!,
        UIImage(named: "milk")!,
        UIImage(named: "pasta")!,
        UIImage(named: "radish")!,
        UIImage(named: "strawberry")!
    ]
    
    //MARK: UI Components
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return tableView
    }()
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    //MARK: SetupUI
    private func setupUI(){
        self.view.backgroundColor = .systemCyan
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else{
            fatalError("The TableView could not dequeue a CustomCell in ViewController")
        }
        let image = self.images[indexPath.row]
        cell.configure(with: image, and: indexPath.row.description)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
