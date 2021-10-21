# BLE Serial IOs Example
This is a simple app, which scans for BLE Peripherials and connect to them. The example works with NORDIC_UART_SERVICE.

# UUIDS
Here are the UUIDS:

  SERVICE_UUID:           "6E400001-B5A3-F393-E0A9-E50E24DCCA9E"

  CHARACTERISTIC_UUID_RX: "6E400002-B5A3-F393-E0A9-E50E24DCCA9E"

  CHARACTERISTIC_UUID_TX: "6E400003-B5A3-F393-E0A9-E50E24DCCA9E"
  
# How to Run the App
Clone the source code and open it in xCode. You'll need an apple computer and an actual iPhone to run it. The emulator wont work with BLE. Connect an iPhone with a USB cable and run the application and scan for devices.

![Build Image](https://github.com/hammad1201/Images/blob/main/Screenshot%202021-10-21%20at%204.22.24%20PM.png)

# Esp32 Part
Download or clone [this](https://github.com/hammad1201/NordicUARTExampleEsp32) repository and open the **Nordic_UART_Example.ino** file. Upload it to esp32 to start advertising.

# Screenshots
Here are some screenshots of the iPhone communication with esp32 using Nordic UART Service.

## Splash Screen
This is the splash screen for the app.

<img src="https://github.com/hammad1201/Images/blob/main/IMG_5085.PNG" alt="Splash Screen" width="250px" height="600px">


## Scan Screen
Press the scan button to start scanning for BLE Peripherals. Select a device to connect to it.

![Scan Screen](https://github.com/hammad1201/Images/blob/main/IMG_5086.PNG)

## Communication Terminal Screen
Press the connect button to connect to the device.

![Communication Terminal Screen](https://github.com/hammad1201/Images/blob/main/IMG_5087.PNG)

## Communication

Presing the Connect Button creates a connection with the esp32.

## Device Connected

![Device Connected](https://github.com/hammad1201/Images/blob/main/IMG_5089.PNG)

## Exchanging Messages
Once Connected, then we can exchange text messages between iPhone and the esp32.

![Device Connected](https://github.com/hammad1201/Images/blob/main/IMG_5090.PNG)

Here is a screenshot of the data received to the esp32, which is displayed on Serial monitor.
![Device Connected](https://github.com/hammad1201/Images/blob/main/Screenshot%202021-10-21%20at%204.16.40%20PM.png)

## Info
This messages opens when the info button is presses on the top-right corner of the screen.

![Info](https://github.com/hammad1201/Images/blob/main/IMG_5088.PNG)
