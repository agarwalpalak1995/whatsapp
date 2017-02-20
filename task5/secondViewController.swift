//
//  secondViewController.swift
//  task5
//
//  Created by Sierra 4 on 15/02/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import UIKit
import CoreData

class secondViewController: UIViewController ,UITextFieldDelegate 
{
    var imagePass: URL!
    var namePass: String?

    @IBOutlet weak var tableviewchatscreen: UITableView!
    
    @IBOutlet weak var txtEntermessage: UITextView!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblName: UILabel!
     @IBOutlet weak var tableviewmenu: UITableView!
    
    var message:[String] = []
    
    var option = ["View Contact" , "Media" , "Search" ,"Mute" , "Wallpaper" , "More"]
    
   
   // var arrayTextField : [String] = []
    
   // var message : [String] = []
    var chatMessages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgProduct.kf.setImage(with: imagePass)
        lblName.text =  namePass
        // Do any additional setup after loading the view.
       //txtEntermessage.delegate = self
        tableviewchatscreen.rowHeight = UITableViewAutomaticDimension
        tableviewchatscreen.estimatedRowHeight = 140
       
     /*   let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Chatmessage")
        do {
            let chatting = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            
            for msg in chatting {
                if((msg.value(forKeyPath: "id") as? String ?? "None") == namePass)
                {
                    message.append(msg.value(forKeyPath: "message") as! String? ?? "None")
                    print("hAVE TO FIND HERE")
                    print(msg.value(forKeyPath: "message") as! String? ?? "None")
                }
            }
        }
        catch
        {
            fatalError("Could not save")
        }*/

    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
   /* func textFieldDidEndEditing(textField: UITextField) {
        lblSender.text = textField.text
    } */
    
    
    override func viewDidAppear(_ animated: Bool) {
      guard  let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else
      {
        return
        }
       let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Chatmessage")
        do {
            let chatting = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            
            for msg in chatting {
                print("our msg is\(msg)")
                if((msg.value(forKeyPath: "id") as? String ?? "None") == namePass)
                {
                    message.append(msg.value(forKeyPath: "message") as! String? ?? "None")
                  print("hAVE TO FIND HERE")
                     print(msg.value(forKeyPath: "message") as! String? ?? "None")
                }
            }
        }
        catch
        {
            fatalError("Could not save")
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool)
    {
 
    }
    
    
    @IBAction func btnback(_ sender: UIButton) {
        
          _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnmenuOptions(_ sender: UIButton)
    {
        tableviewmenu.isHidden = false
    }
    
    @IBAction func btnSendMessage(_ sender: UIButton)
    {
        message.append(txtEntermessage.text!)
        message.append(txtEntermessage.text!)
       txtEntermessage.text = ""
        tableviewchatscreen.reloadData()
      //cellreceiver.lblReceivermessage.setText = txtEnterMessage.text
       //ReceiverTableViewCell.lblReceivermessage.setText = txtEnterMessage.text
        
       /* arrayTextField.append(txtEntermessage.text)
        arrayTextField.append(txtEntermessage.text)
        textView.text = ""*/
        addMessage(txtEntermessage.text,namePass!)
        addMessage(txtEntermessage.text,namePass!)
        tableviewchatscreen.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addMessage(_ messages:String,_ sender: String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let chatAppEntityObject = NSEntityDescription.entity(forEntityName: "Chatmessage", in: appDelegate.persistentContainer.viewContext)
        let chatMessage = NSManagedObject(entity: chatAppEntityObject!, insertInto: appDelegate.persistentContainer.viewContext)
        chatMessage.setValue(messages, forKeyPath:"message")
        chatMessage.setValue(sender, forKeyPath:"usermessage")
        if(sender == namePass){
            let id = sender
            chatMessage.setValue(id, forKeyPath:"id")
        }
        do {
            try appDelegate.persistentContainer.viewContext.save()
        }
        catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension secondViewController: UITableViewDelegate ,UITableViewDataSource
{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        tableviewmenu.isHidden = true
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    { var counts = 0
        if(tableView == tableviewchatscreen)
        {
            counts = message.count
            
        }
        else if(tableView == tableviewmenu)
        {
            counts = option.count
        }
        
        
        return counts;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        if(tableView == tableviewchatscreen)
            
        {
        if ((indexPath.row % 2) == 0)
        {
            let cell: SenderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellSender", for: indexPath) as! SenderTableViewCell
            cell.lblSender.text = message[indexPath.row]
            return cell
        }
            
        else
        {
            let cell: ReceiverTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellreceiver", for: indexPath) as! ReceiverTableViewCell
            cell.lblReceivermessage.text = message[indexPath.row]
            
            return cell
        
            }
        }
        else if(tableView == tableviewmenu)
        {
            let cell:TableViewCellmenu = tableView.dequeueReusableCell(withIdentifier:"menu", for:indexPath) as! TableViewCellmenu
            cell.lblmenuOptions.text = option[indexPath.row]
            return cell
        }
        else{
            return UITableViewCell()
        }
        

}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
