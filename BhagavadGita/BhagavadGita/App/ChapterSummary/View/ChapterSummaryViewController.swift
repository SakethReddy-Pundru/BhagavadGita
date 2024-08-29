//
//  ChapterSummaryViewController.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 28/08/24.
//

import UIKit

// MARK: - ChapterSummaryViewController Class

class ChapterSummaryViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var imageViewSummary: UIImageView!
    @IBOutlet weak var lblSummary: UILabel!
    
    // MARK: Properties
    
    var chapterName: String = ""
    var chapterSummary: String = ""
    
    // MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = chapterName.uppercased()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lblSummary.spacing = 6.0
        lblSummary.text = chapterSummary
    }
}
