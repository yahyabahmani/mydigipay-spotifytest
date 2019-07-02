//
//  HomeViewController.swift
//  spotifyTest
//
//  Created by macbook on 4/10/1398 AP.
//  Copyright © 1398 Yahya. All rights reserved.
//

import UIKit
import SpotifyLogin
import Alamofire
import RxCocoa
import RxSwift

class HomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return searchTypeQuery.count
    }
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return searchTypeQuery[row].rawValue
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.setTypeSearchTextFeild.text =  searchTypeQuery[row].rawValue
    }
    
    let searchTypeQuery:[SearchType] = [.artist,.track]
    var resultViewModel =  ResultViewModel()
    @IBOutlet weak var searchTextFeild: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var setTypeSearchTextFeild: UITextField!
    
    var disposeBag = DisposeBag()
    var dataSource = PublishSubject<[SearchResult.Result]>()
    let thePicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
       self.thePicker.delegate = self
        setTypeSearchTextFeild.inputView = thePicker
        dataSource.bind(to: tableView.rx.items(cellIdentifier: HomeTableViewCell.nibName)){ (row,result:SearchResult.Result,cell:HomeTableViewCell) in
            cell.result = result
            
            }.disposed(by: disposeBag)
        self.tableView.registerCell(HomeTableViewCell.nibName)
        self.searchTextFeild.attributedPlaceholder = NSAttributedString(string: searchTextFeild.placeholder!, attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray])
        self.bindElemnt()
        self.setTypeSearchTextFeild.text = SearchType.artist.rawValue
        // Do any additional setup after loading the view.
    }
    func bindElemnt() {
       searchTextFeild.rx.text
            .observeOn(MainScheduler.instance)
            .debounce(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
            .map {
                $0?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
            .subscribe(onNext: { (query) in
                if query == "" {
                    self.searchTextFeild.placeholder = "searching"
                    self.resultViewModel.result.removeAll()
                    self.dataSource.onNext(self.resultViewModel.result)
                }else{
                    self.searchQuery(query)
                }
                
                
            }) .disposed(by: disposeBag)
        
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        SpotifyLogin.shared.getAccessToken { [weak self] (token, error) in
            if error != nil, token == nil {
                
                
                
            }
        }
    }

    fileprivate func searchQuery(_ search: String) {
        guard let type = setTypeSearchTextFeild.text else{return}
    
        self.resultViewModel.searchResult(type, search, failure: { (error) in
            if error != nil {
                Alerts.ShowAlert(message: error, vc: self)
            }else{
                self.dataSource.onNext(self.resultViewModel.result)
            }
        })
    }
    

    
}
