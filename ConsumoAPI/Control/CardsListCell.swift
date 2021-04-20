//
//  CardsListCell.swift
//  ConsumoAPI
//
//  Created by Jonathan Alajoan Rocha on 08/03/21.
//

import UIKit
import Alamofire

class CardsListCell: UITableViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellText: UILabel!
    @IBOutlet weak var cellLegality: UILabel!
    @IBOutlet weak var cellDescription: UILabel!
    @IBOutlet weak var cellPrice: UILabel!
    
    func getImage(URL: String) {
        var tempImage: UIImage = UIImage()
        
        _ = AF.request(URL, method: .get).response{ (response) in
            switch response.result {
            case .success(let responseData):
                tempImage = UIImage(data: responseData!, scale: 1) ?? tempImage
                print("Imagem foi")
                self.cellImage.image = tempImage
            break
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
    }
        
    
    func setCard(card: Data, _ index: Int) {
        getImage(URL: card.imageUris.small ?? "")
        cellText.text = "\(card.name!)"
        cellDescription.text = "\(card.oracleText!)"
        cellLegality.text = "Legalidade EDH: \(card.legalities.commander!)"
        cellPrice.text = "Preço: US$\(card.prices.usd!)"
    }
    

}
