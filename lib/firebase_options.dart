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
    apiKey: 'AIzaSyAEEVH-f6sYJym0zau0mjvg6M_JyKeq6i8',
    appId: '1:930982198740:web:96ae8de454d93793376a41',
    messagingSenderId: '930982198740',
    projectId: 'my-pet-fbd14',
    authDomain: 'my-pet-fbd14.firebaseapp.com',
    storageBucket: 'my-pet-fbd14.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSsyuyaXhoUH-Lv2FQl3ss4UnKxCl0VfA',
    appId: '1:930982198740:android:d7b7ea9bef389fd0376a41',
    messagingSenderId: '930982198740',
    projectId: 'my-pet-fbd14',
    storageBucket: 'my-pet-fbd14.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJNjq4ZJh8wLsgDRv5JTUIbmauqSyhvOA',
    appId: '1:930982198740:ios:0781858a4d859d2c376a41',
    messagingSenderId: '930982198740',
    projectId: 'my-pet-fbd14',
    storageBucket: 'my-pet-fbd14.appspot.com',
    iosClientId: '930982198740-l04aii261up72qlr5hpsgjqen2rvqr7p.apps.googleusercontent.com',
    iosBundleId: 'com.example.myPet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBJNjq4ZJh8wLsgDRv5JTUIbmauqSyhvOA',
    appId: '1:930982198740:ios:30c062895bbb23cc376a41',
    messagingSenderId: '930982198740',
    projectId: 'my-pet-fbd14',
    storageBucket: 'my-pet-fbd14.appspot.com',
    iosClientId: '930982198740-6pnk37t3f3pb9711oic7cuagsl9ksau5.apps.googleusercontent.com',
    iosBundleId: 'com.example.myPet.RunnerTests',
  );
}
