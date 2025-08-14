
<p align='center'>
  <a href="https://www.linkedin.com/in/aksh-singh-0808bb220/"><img src="https://avatars.githubusercontent.com/u/108173159?s=400&u=7aa6f3cded4e1eceabae2f86c27aeeb3931538b4&v=4" /></a>
</p>

<h3 align='center'>
  Abhishek chauhan 
</h3>

<h4 align='center'>
  Non-tech lead
</h4>



![Uploading Car Dashboard.gif…](https://github.com/cppqtdev/Car-Dashboard-2/blob/main/screenshots/Car%20Dashboard.gif)


# Car Dashboard using Qt QML

This project is a car dashboard user interface built using Qt QML. It provides a modern and intuitive interface for displaying essential information for a vehicle, such as speed, fuel level, temperature, and more.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Screenshots](#screenshots)
- [Video Demo](#video-demo)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## Introduction

The Car Dashboard project aims to create a user-friendly dashboard interface for vehicles using Qt QML. It allows users to monitor critical vehicle parameters in real-time, providing a digital representation of the traditional dashboard found in automobiles.

## Features

- **Speedometer**: Displays the current speed of the vehicle in real-time.
- **Fuel Gauge**: Shows the fuel level with a visual gauge.
- **Temperature**: Monitors the temperature inside the vehicle.
- **RPM (Revolution Per Minute)**: Indicates the engine RPM.
- **Odometer**: Tracks the total distance traveled by the vehicle.
- **Engine Status**: Indicates whether the engine is running or not.
- **Turn Signals**: Visual indicators for left and right turn signals.
- **Warning Lights**: Alerts for various vehicle conditions (e.g., low fuel, check engine).
- **Customizable**: The UI is designed to be easily customizable to fit different vehicle types and styles.

## Screenshots

![Car Dashboard Screenshot](https://github.com/cppqtdev/Car-Dashboard-2/blob/main/screenshots/Screenshot%202023-08-12%20141221.png)

## Video Demo

[![Car Dashboard Video Demo](https://img.youtube.com/vi/Bf660-_w5zU/0.jpg)](https://www.youtube.com/watch?v=Bf660-_w5zU)

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Qt 5.x or higher installed on your system.
- Basic knowledge of QML (Qt Quick Markup Language).

## Getting Started

To get a local copy up and running, follow these simple steps:

1. Clone the repository:

```bash
git clone git@github.com:cppqtdev/Car-Dashboard-2.git

## Requirements
1. Update Your System

Run this first to ensure your package manager and system are up to date:

bash
sudo apt-get update && sudo apt-get upgrade

2. Install C++ Compiler and Build Tools

Install GCC, G++, and essential build tools:

bash
sudo apt-get install build-essential

This command includes GCC, G++, Make, and other necessary utilities for compiling C++ code.
3. Install Qt (Qt 5.15+)

Qt 5.15 is not available directly from Ubuntu repositories; you have several options:

    Method A: Install via Snap

bash
sudo snap install qt515-core20

This installs the Qt 5.15 runtime to /opt and can be used by compatible apps. You may need to add /opt to your $PATH for compiling or running Qt projects.

Method B: Qt Online Installer (for full SDK/developer tools)

    Download the installer:

bash
curl -O https://download.qt.io/official_releases/online_installers/qt-online-installer-linux-x64-online.run

Make it executable and run:

bash
chmod +x qt-online-installer-linux-x64-online.run
./qt-online-installer-linux-x64-online.run

Follow prompts to select Qt 5.15 (if available) and required modules.
4. Install QML and QtQuick Modules

These are usually included with the full Qt installation. If you get missing module errors like QtQuick or QtQuick.Window, install them individually:

bash
sudo apt-get install qml-module-qtquick2
sudo apt-get install qml-module-qtquick-window2

This ensures QML/QtQuick components are available for your projects.
5. Prepare for Custom Components

Place radialbar.h (your custom control header) in your project directory and include it in your project/Qt Creator configuration. No terminal command is needed for this step—just make sure the file is present with your source code.
6. Verify Installations

    Test your compiler:

bash
g++ --version

Test Qt installation:

    bash
    qmake --version

Summary of Useful Terminal Commands

bash
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install build-essential
sudo snap install qt515-core20       # or use the online installer method
sudo apt-get install qml-module-qtquick2 qml-module-qtquick-window2
