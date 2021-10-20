//
//  DeviceViewController.swift
//  BLE Serial
//
//  Created by Muhammad Hammad on 19/10/2021.
//

import UIKit

class DeviceViewController: UIViewController, BluetoothOperationsConsumer {
    var adapter: BLEAdapter!
    var utils: Utils!
    
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var deviceDetailsLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var textToSendTextField: UITextField!
    @IBOutlet weak var receivedTextLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    
    // MARK: View will appear
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter = BLEAdapter.sharedInstance
        utils = Utils.sharedInstance
        
        deviceDetailsLabel.text = "Name: \(adapter.selectedPeripheral!.name ?? "No Name"), UUID:\( adapter.selectedPeripheral!.identifier.uuidString)"
        
        textToSendTextField.isEnabled = false
        receivedTextLabel.isEnabled = false
        sendButton.isEnabled = false
    }
    
    // MARK: View will disappear
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParent {
            if (adapter.connected == true) {
                print("Disconnecting!")
                adapter.disconnect(self)
            }
        }
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Button Presses
    @IBAction func connectButtonPressed(_ sender: Any) {
        if (adapter.connected == false) {
            adapter.connect(self)
        } else {
            adapter.disconnect(self)
        }
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        if (adapter.connected == true) {
            let textToSend: String = textToSendTextField.text!.trimString()
            
            if (textToSend != "") {
                adapter.writeRXCharacteristic(text: textToSend)
            } else {
                utils.error(message: "Enter something to send!", ui: self, cbOK: {
                    print("OK callback")
                })
            }
        } else {
            utils.error(message: "Not Connected!", ui: self, cbOK: {
                print("OK callback")
            })
        }
    }
    
    @IBAction func donePressed(_ sender: Any) {
        self.dismissKeyboard()
    }
    
    // MARK: - Delegate Functions
    func onConnected() {
        print("onConnected")
        connectButton.backgroundColor = UIColor.systemRed
        connectButton.setTitle("Disconnect from Device", for: .normal)
        
        statusLabel.text = "Connected to Device!"
        statusLabel.textColor = UIColor.systemGreen
        
        textToSendTextField.isEnabled = true
        receivedTextLabel.isEnabled = true
        sendButton.isEnabled = true
        
        //Start Service Discovey
        adapter.discoverServices()
    }
    
    func onFailedToConnect(_ error: Error?) {
        print("onFailedToConnect")
        
        connectButton.backgroundColor = UIColor.systemGreen
        connectButton.setTitle("Connect to Device", for: .normal)
        
        statusLabel.text = "Failed to Connect!"
        statusLabel.textColor = UIColor.systemOrange
        
        textToSendTextField.isEnabled = false
        receivedTextLabel.isEnabled = false
        sendButton.isEnabled = false
        
        receivedTextLabel.text = "..............."
        
        utils.error(message : "Failed to connect: \(String(describing: error))", ui : self, cbOK: {})
    }
    
    func onDisconnected() {
        print("onDisconnected")
        
        connectButton.backgroundColor = UIColor.systemGreen
        connectButton.setTitle("Connect to Device", for: .normal)
        
        statusLabel.text = "Disconnected from Device!"
        statusLabel.textColor = UIColor.systemOrange
        
        textToSendTextField.isEnabled = false
        receivedTextLabel.isEnabled = false
        sendButton.isEnabled = false
        
        receivedTextLabel.text = "..............."
    }
    
    func onServicesDiscovered() {
        print("onServicesDiscovered")
        adapter.discoverCharacteristics()
    }
    
    func onRXDiscovered() {
        print("onRXCharacteristicDiscovered")
    }
    
    func onTXDiscovered() {
        print("onTXCharacteristicDiscovered")
        adapter.setTXCharacteristicNotifications(state: true)
    }
    
    func onTXCharacteristicNotification(_ receivedString: String) {
        receivedTextLabel.text = receivedString
        print(receivedString)
    }
}

extension String {
    func trimString() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}
