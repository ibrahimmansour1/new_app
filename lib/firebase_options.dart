// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDeXh8UuvGFW9fMQgiRKSZJGX_7JJQNCsY',
    appId: '1:867099121481:web:809f770d137b09dd35ec98',
    messagingSenderId: '867099121481',
    projectId: 'computer-graphic-8b1c8',
    authDomain: 'computer-graphic-8b1c8.firebaseapp.com',
    storageBucket: 'computer-graphic-8b1c8.appspot.com',
    measurementId: 'G-5M4BD940D0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWWZ0FCNyNG2jxFwgpJAFTwedThsudIJA',
    appId: '1:867099121481:android:60df80361ed17dd235ec98',
    messagingSenderId: '867099121481',
    projectId: 'computer-graphic-8b1c8',
    storageBucket: 'computer-graphic-8b1c8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmdnv4iyOVm4wnimQ_SW4dlnGBXKynlD4',
    appId: '1:867099121481:ios:0962ef12fdbc373935ec98',
    messagingSenderId: '867099121481',
    projectId: 'computer-graphic-8b1c8',
    storageBucket: 'computer-graphic-8b1c8.appspot.com',
    androidClientId:
        '867099121481-u2eb9153l4lsorgabt10hj2aentilodb.apps.googleusercontent.com',
    iosClientId:
        '867099121481-t39i8i5te27msptihtmq73dv9g9j28mo.apps.googleusercontent.com',
    iosBundleId: 'com.example.newsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmdnv4iyOVm4wnimQ_SW4dlnGBXKynlD4',
    appId: '1:867099121481:ios:0962ef12fdbc373935ec98',
    messagingSenderId: '867099121481',
    projectId: 'computer-graphic-8b1c8',
    storageBucket: 'computer-graphic-8b1c8.appspot.com',
    androidClientId:
        '867099121481-u2eb9153l4lsorgabt10hj2aentilodb.apps.googleusercontent.com',
    iosClientId:
        '867099121481-t39i8i5te27msptihtmq73dv9g9j28mo.apps.googleusercontent.com',
    iosBundleId: 'com.example.newsApp',
  );
}
