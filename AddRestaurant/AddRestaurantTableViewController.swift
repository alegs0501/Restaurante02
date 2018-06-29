//
//  AddRestaurantTableViewController.swift
//  Restaurante02
//
//  Created by CICE on 29/6/18.
//  Copyright © 2018 alegs0501. All rights reserved.
//

import UIKit

class AddRestaurantTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageholder: UIImageView!
    @IBOutlet weak var visitedSwitch: UISwitch!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        visitedSwitch.isOn = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            //Load photo gallery
                //UIImagePickerController
            //Verify controllers can be load
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                //create UIImagePickerController
                let imagePicker = UIImagePickerController()
                //Define imagePicker attributes
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                //Show controller
                imagePicker.navigationBar.isTranslucent = false
                imagePicker.navigationBar.barTintColor = UIColor(red: 164.0/255.0, green: 0.0/255.0, blue: 2.0/255.0, alpha: 1)
                imagePicker.delegate = self
                present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //Verify if image exist
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageholder.image = selectedImage
            imageholder.contentMode = .scaleAspectFill
            imageholder.clipsToBounds = true
        }
        //Define constraints for image holder
        let leadingConstraint = NSLayoutConstraint(item: imageholder, attribute: .leading, relatedBy: .equal, toItem: imageholder.superview, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: imageholder, attribute: .trailing, relatedBy: .equal, toItem: imageholder.superview, attribute: .trailing, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: imageholder, attribute: .top, relatedBy: .equal, toItem: imageholder.superview, attribute: .top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: imageholder, attribute: .bottom, relatedBy: .equal, toItem: imageholder.superview, attribute: .bottom, multiplier: 1, constant: 0)
        dismiss(animated: true, completion: nil)
        //Apply constraint
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        topConstraint.isActive = true
        bottomConstraint.isActive = true
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
