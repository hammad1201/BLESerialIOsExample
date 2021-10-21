# BLE Serial IOs Example
This is a simple app, which scans for BLE Peripherials and connect to them. The example works with NORDIC_UART_SERVICE.

# UUIDS
Here are the UUIDS:
  SERVICE_UUID:           "6E400001-B5A3-F393-E0A9-E50E24DCCA9E"
  CHARACTERISTIC_UUID_RX: "6E400002-B5A3-F393-E0A9-E50E24DCCA9E"
  CHARACTERISTIC_UUID_TX: "6E400003-B5A3-F393-E0A9-E50E24DCCA9E"

# How to Run the App
Clone the source code and open it in xCode. You'll need an apple computer to run it. Run the application and scan for devices.
![Build Image](https://github.com/hammad1201/Images/blob/main/Screenshot%202021-10-21%20at%204.22.24%20PM.png)

[# Esp32 Part](https://github.com/hammad1201/NordicUARTExampleEsp32)
Download or clone [this](https://github.com/hammad1201/NordicUARTExampleEsp32) repository and open the **Nordic_UART_Example.ino** file. Upload it to esp32 to start advertising.

# Screenshots
Here are some screenshots of the iPhone communication with esp32 using Nordic UART Service.

**Splash Screen**
![Splash Screen](https://github.com/hammad1201/Images/blob/main/IMG_5085.PNG)

**Scan Screen**
![Scan Screen](https://github.com/hammad1201/Images/blob/main/IMG_5086.PNG)

**Communication Terminal Screen**
![Communication Terminal Screen](https://github.com/hammad1201/Images/blob/main/IMG_5087.PNG)

**Info**
![Info](https://github.com/hammad1201/Images/blob/main/IMG_5088.PNG)

# Communication
Presing the Connect Button creates a connection with the esp32.

**Device Connected**
![Device Connected](https://github.com/hammad1201/Images/blob/main/IMG_5089.PNG)

Now, we can exchange text messages between iPhone and the esp32.

**Exchanging Messages**
![Device Connected](https://github.com/hammad1201/Images/blob/main/IMG_5090.PNG)
