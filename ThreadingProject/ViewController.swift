//
//  ViewController.swift
//  ThreadingProject
//
//  Created by Muhammet Kadir on 19.03.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
   
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageUrlList = ["https://media.cntraveler.com/photos/5d090bc1244f6a7ae3031eb3/master/pass/Chicago_GettyImages-1065188752.jpg","https://wallpaper.dog/large/5565932.jpg"]
    
    var data = Data()
    var selectedImage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.imageUrlList[self.selectedImage])!)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data)
            }
        }
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(changeImage))
        
    }

    @objc func changeImage(){
        if selectedImage == 0{
            selectedImage += 1
        }else{
            selectedImage -= 0
        }
        
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.imageUrlList[self.selectedImage])!)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data)

            }
        }
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "TEST"
        
        return cell
    }

}

