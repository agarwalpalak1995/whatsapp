//
//  secondViewController.swift
//  task5
//
//  Created by Sierra 4 on 15/02/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import UIKit

class secondViewController: UIViewController ,UITextFieldDelegate 
{
    var imagePass: URL!
    var namePass: String?

    @IBOutlet weak var tableviewchatscreen: UITableView!
    @IBOutlet weak var txtEnterMessage: UITextField!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    var message:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgProduct.kf.setImage(with: imagePass)
        lblName.text =  namePass
        // Do any additional setup after loading the view.
       txtEnterMessage.delegate = self
        //tableviewchatscreen.rowHeight = UITableViewAutomaticDimension
        //tableviewchatscreen.estimatedRowHeight = 140
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
   /* func textFieldDidEndEditing(textField: UITextField) {
        lblSender.text = textField.text
    } */
    
    @IBAction func btnback(_ sender: UIButton) {
        
          _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnSendMessage(_ sender: UIButton)
    {
        message.append(txtEnterMessage.text!)
        message.append(txtEnterMessage.text!)
        txtEnterMessage.text = ""
        tableviewchatscreen.reloadData()
      //cellreceiver.lblReceivermessage.setText = txtEnterMessage.text
       //ReceiverTableViewCell.lblReceivermessage.setText = txtEnterMessage.text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if ((indexPath.row % 2) == 1)
        {
            let cell: SenderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellSender", for: indexPath) as! SenderTableViewCell
            cell.lblSender.text = message[indexPath.row]
            return cell
        }
            
        else if ((indexPath.row % 2) == 0)
        {
            let cell: ReceiverTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellreceiver", for: indexPath) as! ReceiverTableViewCell
            cell.lblReceivermessage.text = message[indexPath.row]
            
            return cell
        
        }
        return UITableViewCell()
    }

}

