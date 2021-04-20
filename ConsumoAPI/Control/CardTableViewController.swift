//
//  CardTableViewController.swift
//  ConsumoAPI
//
//  Created by Jonathan Alajoan Rocha on 08/03/21.
//

import UIKit
import Alamofire

class CardTableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var cardTableView: UITableView!
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var cardTextFieldSearch: UITextField!
    
    @IBOutlet weak var buttonSearch: UIButton!
    
    var cardNew: [Cards] = []
    
    var cardsManager = CardsManager()
    
    func cleanString(urlText: String) -> String {
        
        var text:String = urlText
        
        text = text.replacingOccurrences(of: "’", with: "")
        text = text.replacingOccurrences(of: " ", with: "+")
        
        return text
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        cardTableView.delegate = self
        cardTableView.dataSource = self
        cardTextFieldSearch.delegate = self
        
        
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        cardTextFieldSearch.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        fetchCardsByName(name: textField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        fetchCardsByName(name: textField.text!)
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(textField.text != "") {
            return true
        } else {
            textField.placeholder = "Enter something to search"
            return false
        }
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(!cardNew.isEmpty) {
            return cardNew[0].data.count
        }else{
            return 0
        }
            
        
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let card = cardNew[0].data[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell") as! CardsListCell
        cell.setCard(card: card, indexPath.row)
        
        return cell
        
     }
    
    let scryfallURL: String = "https://api.scryfall.com/cards/search?q="
    
    func fetchCardsByName(name: String) {
        
        let cleanURL = cleanString(urlText: name)
        
        let url = "\(scryfallURL)\(cleanURL)"
        
        let request = AF.request(url)
        
        request.responseJSON { (response) in
            
            switch response.result {
            
            case .success:
                do {
                    let cards = try JSONDecoder().decode(Cards.self, from: response.data!)
                    self.cardNew.removeAll()
                    print("card removido")
                    self.cardNew.append(cards)
                    print("Card adicionado: \(cards)")
                    self.cardTableView.reloadData()
                    
                } catch DecodingError.keyNotFound(let key, let context) {
                    Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
                } catch DecodingError.valueNotFound(let type, let context) {
                    Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
                } catch DecodingError.typeMismatch(let type, let context) {
                    Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
                } catch DecodingError.dataCorrupted(let context) {
                    Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
                } catch let error as NSError {
                    NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
                }
                break
                
            case .failure(let error):
                print("Deu erro: \(error.localizedDescription) \(String(describing: error.failedStringEncoding))")
            break
            }
            
            
        }
    
    
    /*
    func createArray() -> [Card] {
        var tempCards: [Card] = []
        
        let card1 = Card(image: UIImage(named: "krenko")!, description: "Krenko, Mob Boss {2}{R}{R}\n Legendary Creature — Goblin Warrior\n {T}: Create X 1/1 red Goblin creature tokens, where X is the number of Goblins you control. \n3/3")
        
        let card2 = Card(image: UIImage(named: "araumi")!, description: "Legendary Creature — Merfolk Wizard \n {T}, Exile cards from your graveyard equal to the number of opponents you have: Target creature card in your graveyard gains encore until end of turn. The encore cost is equal to its mana cost. (Exile the creature card and pay its mana cost: For each opponent, create a token copy that attacks that opponent this turn if able. They gain haste. Sacrifice them at the beginning of the next end step. Activate only as a sorcery.) \n1/4")
        
        let card3 = Card(image: UIImage(named: "Ruric-thar")!, description: "Ruric Thar, the Unbowed {4}{R}{G} \nLegendary Creature — Ogre Warrior \nVigilance, reach \nRuric Thar, the Unbowed attacks each combat if able. \nWhenever a player casts a noncreature spell, Ruric Thar deals 6 damage to that player. /n6/6")
        
        let card4 = Card(image: UIImage(named: "torbran")!, description: "Torbran, Thane of Red Fell {1}{R}{R}{R} \nLegendary Creature — Dwarf Noble\nIf a red source you control would deal damage to an opponent or a permanent an opponent controls, it deals that much damage plus 2 instead. \n2/4")
        
        tempCards.append(card1)
        tempCards.append(card2)
        tempCards.append(card3)
        tempCards.append(card4)
        
        
        return tempCards
    }*/
    
}



}
