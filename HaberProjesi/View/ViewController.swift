//
//  ViewController.swift
//  HaberProjesi
//
//  Created by Şevket Uğurel on 28.01.2024.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var TableView: UITableView!
    
    private var newsTableViewModel : NewsTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TableView.dataSource = self
        TableView.delegate = self
        
        TableView.rowHeight = UITableView.automaticDimension
        TableView.estimatedRowHeight = UITableView.automaticDimension
        
        verial()
        
    }
    func verial(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
        Webservice().haberleriIndir(url: url!) { haberler in
            if let haberler = haberler{
                self.newsTableViewModel = NewsTableViewModel(NewsList: haberler)
                
                DispatchQueue.main.async {
                    self.TableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel==nil ? 0 : newsTableViewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
        let newsViewModel = self.newsTableViewModel.newsAtIndexPath(indexPath.row)
        cell.titleLabel.text = newsViewModel.title
        cell.storyLabel.text = newsViewModel.story
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
        
}

