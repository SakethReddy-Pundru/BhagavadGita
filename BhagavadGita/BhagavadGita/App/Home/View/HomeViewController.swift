//
//  HomeViewController.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 26/08/24.
//

import UIKit

// MARK: - HomeViewController Class

class HomeViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var lblAboutGita: UILabel!
    @IBOutlet weak var sceneView: UIView!
    @IBOutlet weak var chaptersView: UIView!
    @IBOutlet weak var btnSettingScene: UIButton!
    @IBOutlet weak var btnChapters: UIButton!
    
    // MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = StaticStrings.homeTitle
        lblAboutGita.text = StaticStrings.aboutGita
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneView.backgroundColor = .clear
        chaptersView.backgroundColor = .clear
        self.applyCornerAndShadowToButton(customButton: btnSettingScene)
        self.applyCornerAndShadowToButton(customButton: btnChapters)
    }
    
    // MARK: Actions
    
    @IBAction func actionSettingScene(_ sender: Any) {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else { return }
            guard let sceneVC = UIStoryboard.main
                .instantiateViewController(withIdentifier: "SceneViewController")
            as? SceneViewController else { return }
            self.navigationController?.pushViewController(sceneVC, animated: true)
        }
    }
    
    @IBAction func btnChapters(_ sender: Any) {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else { return }
            guard let chapterVC = UIStoryboard.main
                .instantiateViewController(withIdentifier: "ChaptersViewController")
            as? ChaptersViewController else { return }
            self.navigationController?.pushViewController(chapterVC, animated: true)
        }
    }
}
