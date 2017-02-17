//
//  ViewController.swift
//  task5
//
//  Created by Sierra 4 on 07/02/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import UIKit
import Kingfisher
import CoreData
import ContactsUI


class ViewController: UIViewController , CNContactPickerDelegate
{
    @IBOutlet weak var producttableView: UITableView!
    @IBOutlet weak var collectionview: UICollectionView!
    
    var selectedItem:Int = 0
    var profileimage: URL?
    var profilename: String?
    
    
    lazy  var contacts: [CNContact] = {
    let contactStore = CNContactStore()
    let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactEmailAddressesKey,
            CNContactPhoneNumbersKey,
            CNContactImageDataAvailableKey,
            CNContactThumbnailImageDataKey] as [Any]
        
        
        
    // Get all the containers
    var allContainers: [CNContainer] = []
    do {
    allContainers = try contactStore.containers(matching: nil)
    }
    catch
    {
    print("Error fetching containers")
    }
    var results: [CNContact] = []
        
        
        
    // Iterate all containers and append their contacts to our results array
    for container in allContainers {
        let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            
            do {
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                results.append(contentsOf: containerResults)
               }
            catch
              {
                print("Error fetching results for container")
              }
        }
        
        return results
    }()

    
    
    // Created array of array containing details  
    var arrProductDetails = [
        [
            productdetails(name: "Kanchan", message: "Yesterday, 8:40 PM" , time: "" , amount: "", picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/originals/26/2c/06/262c06c76d0585b6a2a3917dec998644.jpg")) ,
           productdetails(name: "Anshika", message: "Yesterday, 7:50" , time: "" , amount: "" , picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/originals/41/b6/d0/41b6d0cac893197d9b05b19b397d72d8.jpg")) ,
           productdetails(name: "Divya", message: "Yesterday, 7:50" , time: "" , amount: "" , picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/originals/41/b6/d0/41b6d0cac893197d9b05b19b397d72d8.jpg")) ,
           productdetails(name: "Ashmita", message: "Yesterday, 7:50" , time: "" , amount: "", picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/originals/41/b6/d0/41b6d0cac893197d9b05b19b397d72d8.jpg")) ,
           productdetails(name: "Aditi", message: "Yesterday, 7:45" , time: "" , amount: "" , picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/originals/41/b6/d0/41b6d0cac893197d9b05b19b397d72d8.jpg")) ,
           productdetails(name: "ayushi", message: "Yesterday, 8:40 PM" , time: "" , amount: "", picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/originals/26/2c/06/262c06c76d0585b6a2a3917dec998644.jpg")) ,
           productdetails(name: "Anshika", message: "Yesterday, 7:50" , time: "" , amount: "" , picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/originals/41/b6/d0/41b6d0cac893197d9b05b19b397d72d8.jpg")) ,           ],
        [
            productdetails(name: "Palak", message: "hey.. wass up?" , time: "5:45 AM" , amount: "5", picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/736x/6e/37/88/6e378883b61e3dd40a318666c4d410eb.jpg")) ,
            productdetails(name: "Apurva", message: "hello" , time: "6:56 AM" , amount: "4" , picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/736x/81/74/f3/8174f37a0a4ffde668a466dca8ace7e8.jpg")) ,
            productdetails(name: "Divya", message: "heya" , time: "7:00 PM" , amount: "3" , picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/originals/26/2c/06/262c06c76d0585b6a2a3917dec998644.jpg")) ,
            productdetails(name: "Prachi", message: "hello" , time: "5:00 PM" , amount: "2", picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/originals/41/b6/d0/41b6d0cac893197d9b05b19b397d72d8.jpg")) ,
            productdetails(name: "Aditi", message: "hey" , time: "7:00 PM" , amount: "1" , picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/originals/41/b6/d0/41b6d0cac893197d9b05b19b397d72d8.jpg")) ,
            productdetails(name: "rashi", message: "hey.. wass up?" , time: "5:45 AM" , amount: "4", picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/736x/6e/37/88/6e378883b61e3dd40a318666c4d410eb.jpg")) ,
            productdetails(name: "prachi", message: "hello" , time: "6:56 AM" , amount: "7" , picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/736x/81/74/f3/8174f37a0a4ffde668a466dca8ace7e8.jpg")) ,
           /* productdetails(name: "onam", message: "heya" , time: "7:00 PM" , amount: "5" , picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/originals/26/2c/06/262c06c76d0585b6a2a3917dec998644.jpg")) ,
            productdetails(name: "divya", message: "hello" , time: "5:00 PM" , amount: "5", picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/originals/41/b6/d0/41b6d0cac893197d9b05b19b397d72d8.jpg")) ,
            productdetails(name: "Aditi", message: "hey" , time: "7:00 PM" , amount: "5" , picturedata:URL(string: "https://s-media-cache-ak0.pinimg.com/originals/41/b6/d0/41b6d0cac893197d9b05b19b397d72d8.jpg")) ,*/
            ] 
        
        
           ]
    let arrayUrl = ["https://s-media-cache-ak0.pinimg.com/736x/81/74/f3/8174f37a0a4ffde668a466dca8ace7e8.jpg",
                      "https://s-media-cache-ak0.pinimg.com/736x/81/74/f3/8174f37a0a4ffde668a466dca8ace7e8.jpg",
                      "https://s-media-cache-ak0.pinimg.com/736x/6e/37/88/6e378883b61e3dd40a318666c4d410eb.jpg",
                      "https://s-media-cache-ak0.pinimg.com/originals/41/b6/d0/41b6d0cac893197d9b05b19b397d72d8.jpg",
                      "https://s-media-cache-ak0.pinimg.com/736x/81/74/f3/8174f37a0a4ffde668a466dca8ace7e8.jpg",
                      "https://s-media-cache-ak0.pinimg.com/originals/26/2c/06/262c06c76d0585b6a2a3917dec998644.jpg"
    ]
    
    let scrolldata = ["CALLS" , "CHATS" , "CONTACTS"]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var arraycontact: [productdetails] = []
        contacts.enumerated().forEach { index,contact in
            arraycontact.append(productdetails(name:contact.givenName , message:"" , time:"" , amount:"" , picturedata:URL(string:"\(arrayUrl[index])") ))
        }
        // Do any additional setup after loading the view, typically from a nib.
        arrProductDetails.append(arraycontact)
    }


  /* 
     func contactPicker(picker: CNContactPickerViewController, didSelectContacts contacts: [CNContact]){
        contacts.forEach { contact in
            for number in contact.phoneNumbers {
                let phoneNumber = number.value as! CNPhoneNumber
                print("number is = \(phoneNumber)")
            }
        }
    }
    
    func contactPickerDidCancel(picker: CNContactPickerViewController){
        print("Cancel Contact Picker")
    }
    */
 
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


           //////////MARK: - TableView Datasources/Delegates//////////////
   extension ViewController : UITableViewDelegate ,UITableViewDataSource
      {
       public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
        return arrProductDetails[selectedItem].count
        }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        // let indexPath = tableView.indexPathForSelectedRow
        //let selectedCell = tableView.cellForRow(at: indexPath!) as! TableViewCell1
        profileimage = arrProductDetails[selectedItem][indexPath.row].picturedata!
        profilename = arrProductDetails[selectedItem][indexPath.row].name!
        self.performSegue(withIdentifier: "SegueIdentifier", sender: self)
         }
    
    override func prepare( for segue : UIStoryboardSegue, sender: Any?)
    {
        let DestViewController : secondViewController = segue.destination as! secondViewController
        DestViewController.namePass = profilename
        DestViewController.imagePass = profileimage
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell1
            else
        {
            fatalError()
        }
        cell.lblName?.text = arrProductDetails[selectedItem][indexPath.row].name
        cell.lblmessage?.text = arrProductDetails[selectedItem][indexPath.row].message
        cell.lbltime?.text = arrProductDetails[selectedItem][indexPath.row].time
        cell.lblnoOFmessage?.text = arrProductDetails[selectedItem][indexPath.row].amount
        cell.imgProduct?.kf.setImage(with: arrProductDetails[selectedItem][indexPath.row].picturedata)
        // Title // Description
        cell.imgProduct.layer.cornerRadius = 30
        cell.imgProduct.layer.borderWidth = 1
        cell.imgProduct.layer.borderColor = UIColor.white.cgColor
        return cell
    }
   }


////////////MARK: - ColletionView Datasources/Delegates/////////////////
extension ViewController : UICollectionViewDataSource , UICollectionViewDelegate
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        return scrolldata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt IndexPath: IndexPath)  -> UICollectionViewCell
    {
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for : IndexPath) as! selectCollectionViewCell
        cell2.lblScrolldetails.text = scrolldata[IndexPath.row]
        
      if (selectedItem == IndexPath.row)
        {
        cell2.viewunderline.backgroundColor = UIColor.white
        }
        
        else
        {
        cell2.viewunderline.backgroundColor = UIColor.clear
        }
        return cell2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        selectedItem = indexPath.item
        
      /*  if (selectedItem == 2)
        {let cnPicker = CNContactPickerViewController()
            cnPicker.delegate = self
            self.present(cnPicker, animated: true, completion: nil)
        }
 */
        
        producttableView.reloadData()
        collectionView.reloadData()
    }
}

