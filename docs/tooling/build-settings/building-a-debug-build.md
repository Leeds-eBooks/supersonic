---
layout: docs_tooling
header_title: Build Settings for iOS
header_sub_title: Configure the Build Settings for your iOS app.
section_id: build-settings
subsection_id: building-a-debug-build
---
<section class="docs-section" id="build-settings-for-ios">

#Building a debug build

## Related Guides
* [Build settings for iOS][ios-build-settings-guide]
* [Debugging with the Safari Web Inspector][safari-web-inspector-guide]

To debug your app on a physical device, you can use the Build Service to build a Debug Scanner or a Debug Ad-Hoc build. This also allows you to debug custom plugins (which are not available on the iOS Simulator).

The process is very similar to [building a regular custom Scanner][ios-build-settings-guide], with a few important differences. The steps you need to take are:

* Create a Development certificate (instead of a Production certificate).
* Export the Development certificate along with your private key to a `.p12` file.
* Use a Wildcard App ID (or set up a separate App ID for your debug build).
* Create a Development Provisioning Profile (instead of Distribution) with the correct Development certificate and App ID.
* Upload the exported `.p12`-format certificate and your `.mobileprovision` file to AppGyver Cloud.
* Fill in the rest of the required build configurations.
* Request a Debug Scanner or Debug Ad Hoc build.
* Install the IPA on your device.

## Use a Development Certificate

A Debug build uses a private iOS API to enable WebView debugging, which means that it must use a Development certificate rather than a Distribution Certificate. (To read more about signing identities and certificates, see [Apple's documentation](https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingCertificates/MaintainingCertificates.html).)

Go to the [Certificates, Identifiers & Profiles](https://developer.apple.com/account/ios/certificate/certificateList.action) section of the [Apple Developer Portal](http://developer.apple.com). Click on the plus icon in the top-right corner to add a new iOS certificate. Ensure that the iOS App Development setting is selected, and then click Continue.

<img src="https://appgyver-academy-assets.s3.amazonaws.com/images/debug_scanner/add_certificate.png" width="100%">

Next, Apple will ask you to generate a Certificate Signing Request. Open Keychain Access on your Mac, and choose the Keychain Access > Certificate Assistant > Request a Certificate From a Certificate Authority... menu item. Input your e-mail address and a name for your private-public key pair, and choose the "Saved to disk" option.

<img src="https://appgyver-academy-assets.s3.amazonaws.com/images/debug_scanner/certificate_request.png" width="100%">

Go back to your browser, click Continue and upload the generated `.certSigningRequest` file to Apple. You should see your Development certificate appear soon.

## Exporting the Development Certificate

For the Build Service to sign your apps for you, you need to export your Development certificate along with the private key you used to generate the certificate signing request. Click on the certificate and select Download. Drag the `ios_development.cer` file to Keychain Access. Select the My Certificates menu option from the left side.

Your iPhone Developer certificate should be listed. If you expand it, you should see the name you entered when generating the certificate request. Right-click, and choose the Export option.

<img src="https://appgyver-academy-assets.s3.amazonaws.com/images/debug_scanner/export_certificate.png" width="100%">

Choose the Personal Information Exchange file format, and save the `.p12` file to your hard drive. When requested, set up a password that you remember.

## Best Practice: Use a Wildcard App ID

The best practice for Ad Hoc and Scanner builds is to have a single Wildcard App ID (e.g. `com.me.myapp.*`) in the Apple Developer Portal, and then use different Bundle IDs in the Build Service (e.g. `com.me.myapp.debug-scanner` and `com.me.myapp.adhoc`). This way, you will avoid conflicts when installing different builds of the same app onto the same device. If you want, you can of course register a separate App ID for each build type, but that's not necessary.

## Use a Development Provisioning Profile

Finally, you must create a Development Provisioning Profile. Select the [Provisioning Profiles](https://developer.apple.com/account/ios/profile/profileList.action) section and click on the plus icon in the top right corner to add a new iOS Provisioning Profile. Select the iOS App Development option, and click Continue.

<img src="https://appgyver-academy-assets.s3.amazonaws.com/images/debug_scanner/add_provisioning_profile.png" width="100%">

Select the correct App ID and click Continue. In the next screen, select the iOS Development Certificate that matches the one you exported previously and click Continue.

<img src="https://appgyver-academy-assets.s3.amazonaws.com/images/debug_scanner/select_certificate.png" width="100%">

Select the devices you want to be able to use your Debug build and click Continue. Give your Debug Provisioning Profile a name and click Continue. On the final page, click Download and save the `.mobileprovision` file on your hard drive.

## Configure your app in the Build Service

Go to the [AppGyver Build Service](http://cloud.appgyver.com/applications) and select your app ([read more about deploying apps to the cloud][cloud-deploy-guide]). Click on the Configure iOS Build Settings button. Under the Certificates section, upload your `.p12` certificate and enter your password:

<img src="https://appgyver-academy-assets.s3.amazonaws.com/images/debug_scanner/build_config_certificate.png">

Then, set up your Debug Scanner and Debug Ad Hoc settings, uploading the `.mobileprovision` Provisioning Profile you downloaded in the previous step:

<img src="https://appgyver-academy-assets.s3.amazonaws.com/images/debug_scanner/build_config_mobileprovision.png" width="100%">

Scroll to the bottom and click Update Settings. You can now click on the Build a Debug Ad Hoc Build and Build a Debug Scanner buttons to request Debug builds.

## Using Debug builds

After the build is complete, download and install the Debug IPA file on your device. Your app will run normally (although a bit slower), but your WebViews will be visible in Safari's Develop Menu for debugging. Note that your device needs to be physically connected to your computer with a wire, and the Web Inspector setting needs to be enabled on your iOS Device in Settings > Safari > Advanced.**  See the [debugging with Safari Web Inspector guide][safari-web-inspector-guide] for more information.

[safari-web-inspector-guide]: /tooling/debugging/debugging-on-ios
[ios-build-settings-guide]: /tooling/build-settings/build-settings-for-ios
[cloud-deploy-guide]: /tooling/build-settings/deploying-to-cloud

</section>