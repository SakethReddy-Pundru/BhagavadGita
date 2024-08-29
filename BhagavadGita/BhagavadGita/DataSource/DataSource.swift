//
//  DataSource.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 26/08/24.
//

import Foundation
import UIKit

// MARK: - TableViewDataSource Class

/// A generic data source and delegate class for managing a UITableView.
/// This class is designed to work with any type of UITableViewCell and data model.
class TableViewDataSource<CELL: UITableViewCell, T>: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    
    private var cellIdentifier: String?  /// The identifier used to dequeue reusable cells.
    var configureCell: (CELL, T?, IndexPath) -> Void = {_, _ , _ in }   /// A closure used to configure each cell with the provided data.
    var didSelectedItemAtIndex: (IndexPath) -> Void = {_ in}    /// A closure called when a cell is selected.
    private var items: [T]? /// The data items used to populate the table view.
    
    
    // MARK: - Initializer
    
    /// Initializes the data source with the required parameters.
    /// - Parameters:
    ///   - cellIdentifier: The identifier for cell reuse.
    ///   - items: The data items used to populate the table view.
    ///   - configureCell: A closure to configure the cell with the data.
    ///   - didSelectedItemAtIndex: A closure called when a cell is selected.
    init(cellIdentifier: String, items: [T]?, configureCell: @escaping (CELL, T?, IndexPath) -> Void,
         didSelectedItemAtIndex: @escaping (IndexPath) -> Void) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
        self.didSelectedItemAtIndex = didSelectedItemAtIndex
    }
    
    // MARK: - UITableViewDataSource Methods
    
    /// Returns the cell for the specified index path.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier ?? "", for: indexPath) as? CELL else {
            return UITableViewCell()
        }
        if let items = items {
            let item = items[indexPath.row]
            configureCell(tableViewCell, item, indexPath)
        }
        return tableViewCell
    }
    
    /// Returns the number of sections in the table view.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// Returns the number of rows in the specified section.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    // MARK: - UITableViewDelegate Methods
    
    /// Called when a cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectedItemAtIndex(indexPath)
    }
    
    /// Returns the height for the cell at the specified index path.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
