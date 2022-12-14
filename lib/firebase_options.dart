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
    apiKey: 'AIzaSyCJsZrY9nfLshJhULBg0gM11Zxfi4MSQNM',
    appId: '1:543212566470:web:aed26d684c52d909b6a4c7',
    messagingSenderId: '543212566470',
    projectId: 'project-1be02',
    authDomain: 'project-1be02.firebaseapp.com',
    databaseURL: 'https://project-1be02-default-rtdb.firebaseio.com',
    storageBucket: 'project-1be02.appspot.com',
    measurementId: 'G-85B52YGQYX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWFJfn1tL6DXBc3-uy203_EUlkJqyKJrE',
    appId: '1:543212566470:android:535d39d5b448891ab6a4c7',
    messagingSenderId: '543212566470',
    projectId: 'project-1be02',
    databaseURL: 'https://project-1be02-default-rtdb.firebaseio.com',
    storageBucket: 'project-1be02.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbDS1k3VcqtShnshZe_w3kdTgZ1lyX4Tw',
    appId: '1:543212566470:ios:bffc93f64d9f88a5b6a4c7',
    messagingSenderId: '543212566470',
    projectId: 'project-1be02',
    databaseURL: 'https://project-1be02-default-rtdb.firebaseio.com',
    storageBucket: 'project-1be02.appspot.com',
    androidClientId: '543212566470-546mr24dtr5eb0p35fka0ot93o31944o.apps.googleusercontent.com',
    iosClientId: '543212566470-n759rae7an5jp96mil1qponmflft8pp5.apps.googleusercontent.com',
    iosBundleId: 'com.example.myflutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCbDS1k3VcqtShnshZe_w3kdTgZ1lyX4Tw',
    appId: '1:543212566470:ios:bffc93f64d9f88a5b6a4c7',
    messagingSenderId: '543212566470',
    projectId: 'project-1be02',
    databaseURL: 'https://project-1be02-default-rtdb.firebaseio.com',
    storageBucket: 'project-1be02.appspot.com',
    androidClientId: '543212566470-546mr24dtr5eb0p35fka0ot93o31944o.apps.googleusercontent.com',
    iosClientId: '543212566470-n759rae7an5jp96mil1qponmflft8pp5.apps.googleusercontent.com',
    iosBundleId: 'com.example.myflutter',
  );
}
