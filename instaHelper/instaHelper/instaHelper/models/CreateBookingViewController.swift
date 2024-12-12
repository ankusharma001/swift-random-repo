//
//  CreateBookingViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 16/01/24.
//

import UIKit

class CreateBookingViewController:  UIViewController {
    let options = ["Cook", "Cleaner", "Driver"]

    @IBOutlet weak var pickerView: UIPickerView!
    var availableServants : [Servant] = []
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var numberOfHoursStepper: UIStepper!
    @IBOutlet weak var offerPriceTextField: UITextField!
    var selectdate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        pickerView.dataSource = self
//        pickerView.delegate = self
    }

    @IBAction func numberOfHoursChanged(_ sender: Any) {
        hoursLabel.text =   "\(Int(numberOfHoursStepper.value))"
    }
    @IBAction func findHelperButtonTapper(_ sender: Any) {
       var selectedDate = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        let formattedDate = dateFormatter.string(from: selectedDate)
        selectdate = formattedDate
        print(selectdate)
        let selectedTime = timePicker.date
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let hoursRequired = Double(hoursLabel.text ?? "0.0") ?? 0.0
        let timeRequired = timeFormatter.string(from: selectedTime.addingTimeInterval(hoursRequired * 3600))
        
        let formattedTime = timeFormatter.string(from: selectedTime)
        let offer = offerPriceTextField.text
        
        
        availableServants = ServantDataModel.shared.findAvailableServants(startTimeAvailable: formattedTime, endTimeAvailable: timeRequired)
        
        
        
        
        if !availableServants.isEmpty {
            print("Available servants:")
            for servant in availableServants {
                
                print("Servant ID: \(servant.id), Name: \(servant.name)")
            }
        } else {
            print("No available servants for the selected time and service.")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let nextVC = segue.destination as! AvailableHelperViewController
    guard let sender = sender as? UIButton else {return}
        nextVC.avaiableServant = availableServants
        nextVC.date = selectdate
        nextVC.cost = offerPriceTextField.text!
        nextVC.address = "Home"
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
}
//extension CreateBookingViewController: UIPickerViewDataSource, UIPickerViewDelegate {
//    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1 // Single column
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return options.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return options[row]
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        selectedOptionLabel.text = "Selected: \(options[row])"
//        pickerView.isHidden = true // Hide picker after selection
//    }
//}
