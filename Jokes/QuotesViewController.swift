//
//  QuotesViewController.swift
//  Jokes
//
//  Created by Thao Doan on 7/5/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

import UIKit
import JokesInfoKit


class QuotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var quotes : [Quotes]?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! QuotesTableViewCell
        if let quote = quotes?[indexPath.row]{
              cell.quote = quote
             let imageURL = quote.background
            QuotesController.fetchImage(withURL: imageURL , completion: { (image) in
                DispatchQueue.main.async {
                    cell.quoteImage.image = image
                }
            })
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 196
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        QuotesController.fetchQuote { (quotes) in
            guard let quotes = quotes else { return }
            self.quotes = quotes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
    }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}

