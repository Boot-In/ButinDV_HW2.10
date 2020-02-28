//
//  ValuteTableViewController.swift
//  ButinDV_HW2.10
//
//  Created by Dmitriy Butin on 28.02.2020.
//  Copyright © 2020 Dmitriy Butin. All rights reserved.
//

import UIKit

class ValuteTableViewController: UITableViewController {
    
    var countryes: [Countryes] = []
    private let jsonUrl = "https://restcountries.eu/rest/v2/all"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: jsonUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                self.countryes = try decoder.decode([Countryes].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let country = countryes[indexPath.row]
        cell.textLabel?.text = "Страна: \(country.name)"
        cell.detailTextLabel?.text = "Столица: \(country.capital)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detail", sender: nil)
    }
        
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! DetailViewController
            detailVC.countryDetail = countryes[indexPath.row]
        }
    }
        
}
