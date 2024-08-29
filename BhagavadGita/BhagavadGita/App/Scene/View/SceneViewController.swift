//
//  SceneViewController.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 27/08/24.
//

import UIKit

// MARK: - SceneViewController Class

class SceneViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var textViewScene: UITextView!
    
    // MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = StaticStrings.sceneTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindSettingSceneText()
    }
    
    // MARK: Helper Methods
    
    func bindSettingSceneText() {
        // Set the attributed text to the TextView
        DispatchQueue.main.async {[weak self] in
            guard let self = self else { return }
            self.textViewScene.attributedText = self.applyParagraphStyleToLongText(text: LongText.bagavadhGitaSceneSetUp)
        }
    }
}
