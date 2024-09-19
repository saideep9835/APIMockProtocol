//
//  ViewController.swift
//  APIMockProtocol
//
//  Created by Saideep Reddy Talusani on 9/19/24.
//

import UIKit

class ViewController: UIViewController   {
    
    @IBOutlet weak var tableView: UITableView!
    
    var retrivedData = APIViewModel()
    var dataItems: [Topping] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        retrivedData.delegate = self
        retrivedData.fetchData()
    }
}

extension ViewController: APIFetchData{
    
    func didFetchData(_ data: DataModel) {
        dataItems = data.topping
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
    func didGetError(_ error: any Error) {
        print("Error: \(error.localizedDescription)")
    }
}
extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "ToppingTVC") as? ToppingTVC else{return UITableViewCell()}
        let totalItems = dataItems[indexPath.row]
        cell.idLabel.text = totalItems.id
        cell.typeLabel.text = totalItems.type
        return cell
    }
    
    
}
