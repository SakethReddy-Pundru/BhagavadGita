//
//  ChaptersViewController.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 26/08/24.
//

import UIKit

class ChaptersViewController: UIViewController, LoaderHandling {    

    // MARK: - Outlets
    
    @IBOutlet weak var tvChapters: UITableView!
    
    // MARK: - Properties
    
    var loader: Loader? // Conforming to LoaderHandling
    
    private var chaptersViewModel: ChapterViewModel?
    private var tvDataSource:  TableViewDataSource<ChaptersTableViewCell, Chapters>?
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = StaticStrings.chaptersTitle
        
        // Initialize ChapterViewModel with NetworkManager
        let networkService = NetworkManager.sharedInstance
        chaptersViewModel = ChapterViewModel(networkService: networkService)
        chaptersViewModel?.delegate = self
        
        setupTableView()
        setupLoader(for: self.view) // Setup the loader
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.global(qos: .userInitiated).async {[weak self] in
            guard let self = self else { return }
            self.getChaptersVerses()
        }
    }
    
    // MARK: - Data Fetching
    
    func getChaptersVerses() {
        showLoader()
        chaptersViewModel?.loadChapters()
    }
    
    // MARK: - Setup Methods
    
    func setupTableView() {
        tvChapters.separatorStyle = .none
        tvChapters.register(UINib(nibName: "ChaptersTableViewCell", bundle: nil),
                            forCellReuseIdentifier: "ChaptersTableViewCell")
    }
}

// MARK: - ChapterViewModelDelegate

extension ChaptersViewController: ChapterViewModelDelegate {
    func didFetchChapters(_ chapters: [Chapters]) {
        stopLoader()
        updateDataSource(chapters)
    }
    
    func didFailWithError(_ error: Error) {
        stopLoader()
        DispatchQueue.main.async {[weak self] in
            guard let self = self else { return }
            self.showAlert(on: self, title: "Error !!!", message: error.localizedDescription)
        }
    }
}

// MARK: - TableView DataSource Handling

extension ChaptersViewController {
    
    func updateDataSource(_ chapters: [Chapters]) {
        tvDataSource = TableViewDataSource(
            cellIdentifier: "ChaptersTableViewCell",
            items: chapters, configureCell:
                { [weak self] cell, chapter, indexPath in
                    guard let self = self else { return }
                    self.applyCornerAndShadowToView(view: cell.bgView)
                    guard let chapter = chapter else { return }
                    cell.lblChapterName.text = chapter.nameTranslated
                    cell.lblVersesCount.text = "\(chapter.versesCount) \n verses"
                    cell.selectionStyle = .none
                }, didSelectedItemAtIndex: { [weak self] selectedIndex in
                    guard self != nil else { return }
                    let chapter = chapters[selectedIndex.row]
                    DispatchQueue.main.async {[weak self] in
                        guard let self = self else { return }
                        guard let chapterSummaryVC = UIStoryboard.main
                            .instantiateViewController(withIdentifier: "ChapterSummaryViewController")
                        as? ChapterSummaryViewController else { return }
                        chapterSummaryVC.chapterName = chapter.nameTranslated
                        chapterSummaryVC.chapterSummary = chapter.chapterSummary
                        self.navigationController?.pushViewController(chapterSummaryVC, animated: true)
                    }
                }
        )
        DispatchQueue.main.async {[weak self] in
            guard let self = self else { return }
            self.tvChapters.dataSource = self.tvDataSource
            self.tvChapters.delegate = self.tvDataSource
            self.tvChapters.reloadData()
        }
    }
}
