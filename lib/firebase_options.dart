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
    apiKey: 'AIzaSyClta8sQRFHGD5OJJrtSATid5ClIezZL9g',
    appId: '1:5032530088:web:7bb7278b20b36e701b729d',
    messagingSenderId: '5032530088',
    projectId: 'project-02-final-41e06',
    authDomain: 'project-02-final-41e06.firebaseapp.com',
    databaseURL: 'https://project-02-final-41e06-default-rtdb.firebaseio.com',
    storageBucket: 'project-02-final-41e06.appspot.com',
    measurementId: 'G-W7F7ZMS44L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhS3l043A-c9sJkrzodpptt5bPcPU19DA',
    appId: '1:5032530088:android:773759dde9963fae1b729d',
    messagingSenderId: '5032530088',
    projectId: 'project-02-final-41e06',
    databaseURL: 'https://project-02-final-41e06-default-rtdb.firebaseio.com',
    storageBucket: 'project-02-final-41e06.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAulTIMx58Niwk0Hmhk_nR_U0c_q3adCJI',
    appId: '1:5032530088:ios:46e1d8619fc5e5f31b729d',
    messagingSenderId: '5032530088',
    projectId: 'project-02-final-41e06',
    databaseURL: 'https://project-02-final-41e06-default-rtdb.firebaseio.com',
    storageBucket: 'project-02-final-41e06.appspot.com',
    iosClientId:
        '5032530088-60aatc5pmjotocue1vhbsagvbr0vt529.apps.googleusercontent.com',
    iosBundleId: 'com.example.admin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAulTIMx58Niwk0Hmhk_nR_U0c_q3adCJI',
    appId: '1:5032530088:ios:c615d800093f92ff1b729d',
    messagingSenderId: '5032530088',
    projectId: 'project-02-final-41e06',
    databaseURL: 'https://project-02-final-41e06-default-rtdb.firebaseio.com',
    storageBucket: 'project-02-final-41e06.appspot.com',
    iosClientId:
        '5032530088-6m5ank3boadhc95de7the7la6rglaltr.apps.googleusercontent.com',
    iosBundleId: 'com.example.admin.RunnerTests',
  );
}