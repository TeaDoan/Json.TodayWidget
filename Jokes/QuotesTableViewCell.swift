//
//  QuotesTableViewCell.swift
//  Jokes
//
//  Created by Thao Doan on 7/5/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

import UIKit
import JokesInfoKit

class QuotesTableViewCell: UITableViewCell {
    
    var quote : Quotes? {
        
        didSet {
            guard let quote = quote else { return }
            titleLabel.text = quote.title
            titleLabel.textColor = .white
            titleLabel.textAlignment = .center
            quoteTextView.text = quote.quote
            quoteTextView.textAlignment = .center
            quoteTextView.textColor = .black
            quoteTextView.backgroundColor = .clear
            DateLabel.text = quote.date
            DateLabel.textColor = .white
            DateLabel.textAlignment = .right
            authorLabel.text = quote.author
            authorLabel.textColor = .white
            authorLabel.textAlignment = .right
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var quoteImage: UIImageView!
    @IBOutlet weak var quoteTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    
//    func reloadQuote() {
//        QuotesController.fetchQuote { (quote) in
//            guard let quote = quote else {return}
//            DispatchQueue.main.async {
//                self.titleLabel.text = quote.first?.title
//                self.quoteTextView.text = quote.first?.quote
//                self.DateLabel.text = quote.first?.date
//        }
//        }
//        guard let background =  quote?.background else {return}
//        QuotesController.fetchImage(withURL: background) { (image) in
//            DispatchQueue.main.async {
//                 self.quoteImage.image = image
//            }
//        }
//        }

}
