//
//  MainViewController.swift
//  Testing
//
//  Created by Ahmad Nur Alifullah on 07/04/23.
//

import UIKit

class MainViewController: UIViewController {

    lazy var activityIndicator: UIActivityIndicatorView = {
      let activityIndicator = UIActivityIndicatorView()
      activityIndicator.hidesWhenStopped = true
      activityIndicator.style = .large
      return activityIndicator
    }()
    var viewModel: HomeSearchViewModel!
    var dataResult : [ResultRawg]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
        viewModel = HomeSearchViewModel()
        // Do any additional setup after loading the view.
        viewModel.result.observe(on: self) { [weak self] dataObserve in
            guard let dataResult = dataObserve else { return }
            self?.dataResult = dataResult
            print( "datanya \(self?.dataResult ?? [])")
        }
        viewModel.errorMessage.observe(on: self) { [weak self] message in
            guard let message = message else { return }
            print( "ERROR \(message)")
        }
        viewModel.isLoading.observe(on: self) { [weak self] isLoading in
            if isLoading{
                self?.activityIndicator.startAnimating()
            }else{
                self?.activityIndicator.stopAnimating()
            }
        }
    }
    private func setupActivityIndicator() {
      view.addSubview(activityIndicator)
      activityIndicator.translatesAutoresizingMaskIntoConstraints = false
      activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @IBAction func callAPI(_ sender: Any) {
        self.viewModel.getGames(pageSize: 10)
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
