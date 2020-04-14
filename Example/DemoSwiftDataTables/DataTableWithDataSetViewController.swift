//
//  DataTableWithDataSetViewController.swift
//  SwiftDataTables
//
//  Created by pavankataria on 03/09/2017.
//  Copyright (c) 2017 pavankataria. All rights reserved.
//

import UIKit
import SwiftDataTables

class DataTableWithDataSetViewController: UIViewController {
    //MARK: - Properties
    lazy var dataTable = makeDataTable()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    func setupViews() {
        navigationController?.navigationBar.isTranslucent = false
        title = "Employee Balances"
        view.backgroundColor = UIColor.white
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(dataTable)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            dataTable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            dataTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dataTable.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            dataTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
extension DataTableWithDataSetViewController {
    func makeOptions() -> DataTableConfiguration {
        var options = DataTableConfiguration()
        options.shouldContentWidthScaleToFillFrame = false
        options.defaultOrdering = DataTableColumnOrder(index: 0, order: .ascending)
        options.headerFont = .systemFont(ofSize: 13, weight: .heavy)
        return options
    }
    func makeDataTable() -> SwiftDataTable {
        
        let dataTable = SwiftDataTable(
            data: data(),
            headerTitles: columnHeaders(),
            options: makeOptions()
        )
        dataTable.translatesAutoresizingMaskIntoConstraints = false
        dataTable.backgroundColor = UIColor.init(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        
        dataTable.delegate = self
        return dataTable
    }
}

extension DataTableWithDataSetViewController: SwiftDataTableDelegate {
    func didSelectItem(_ dataTable: SwiftDataTable, indexPath: IndexPath) {
        debugPrint("did select item at indexPath: \(indexPath) dataValue: \(dataTable.data(for: indexPath))")
    }
    //    func fixedColumns(for dataTable: SwiftDataTable) -> DataTableFixedColumnType {
    //        return .init(leftColumns: 1, rightColumns: 1)
    //    }
    
    func fontForCell(in: SwiftDataTable) -> UIFont {
        return .systemFont(ofSize: 13)
    }
    
}
extension DataTableWithDataSetViewController {
    func columnHeaders() -> [String] {
//        return [
//            "Id",
//            "Name",
//            "Email",
//            "Number",
//            "City",
//            "Balance"
//        ]
//        return ["time [s since Epoch]", "t-t0 in h", "F7", "F8", "Average Absorption", "Standard Deviation OD,  absolute ", "BTM, g/L", "Standard Deviation BTM, g/L"]
        return ["Datum/Uhrzeit", "Durchschnittsverbrauch Strom (kWh/100km)", "Durchschnittsverbrauch Verbrenner (l/100km)", "Fahrstrecke (km)", "Fahrzeit (h)", "Durchschnittsgeschwindigkeit (km/h)"]
    }
    
    func data() -> [[DataTableValueType]]{
        //This would be your json object
        var dataSet: [[Any]] = exampleDataSet()
        for _ in 0..<0 {
            dataSet += exampleDataSet()
        }
        
        return dataSet.map {
            $0.compactMap (DataTableValueType.init)
        }
    }
}
