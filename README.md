# orbital-vmvm
NUS Orbital 2022 - Apollo 11

### Run Code

`flutter pub get`
`flutter packages pub run build_runner build --delete-conflicting-outputs`
`flutter clean`
`flutter run`

### Troubleshooting

Error (Xcode): In ... building for iOS Simulator, but linking in object file built for iOS, file ... for architecture arm64

Could not build the application for the simulator.
Error launching application on iPhone 13.

`cd ios`
`arch -x86_64 pod install`
`sudo arch -x86_64 gem install ffi`
