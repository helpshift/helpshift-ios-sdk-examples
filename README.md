# Helpshift iOS SDK Samples

This repository contains a collection example projects for Helpshift iOS SDK v6.1.0

## Requirements

* Xcode 7 or greater (see [Xcode on Apple Developer](https://developer.apple.com/xcode/downloads/))

## Projects

Each one of the sub-directories ending with `App` in this repository is a genuine Xcode project that demonstrates SDK integration and features.

* **[HelpshiftSupportApp](HelpshiftSupportApp)**: demonstrates different support screens in your app
* **[APNApp](APNApp)**: handling customer support notifications via Apple Push Notification Service

For the projects to build and run successfully, please follow these steps : 
* Enter your install credentials in `AppDelegate.m`.
* Enter your bundle identifier in General section in project settings.
* (For push notifications) Select a valid team in General section in project settings.
* (For push notifications) Turn on the capability for Push Notifications in Capabilities section in project settings.

## Resources
* Documentation: [https://developers.helpshift.com/ios/getting-started/](https://developers.helpshift.com/ios/getting-started/)
* API Reference: [https://www.helpshift.com/docs/api/ios/v5.x/index.html](https://www.helpshift.com/docs/api/ios/v4.x/index.html)
* Release Notes: [https://developers.helpshift.com/ios/release-notes/](https://developers.helpshift.com/ios/release-notes/)
* Upgrading from 3.x: [https://developers.helpshift.com/ios/upgrade-3x/](https://developers.helpshift.com/ios/upgrade-3x/)
* Post install script to move Helpshift files to a more generic folder: [Podfile](Podfile)

## License

```
Copyright 2017, Helpshift, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
