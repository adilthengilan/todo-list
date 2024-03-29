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
    apiKey: 'AIzaSyB9mCKFCyf_GNpmHUZ77AyCG62akPJ2ZUk',
    appId: '1:34585870094:web:d2d62cdc00d7ac2878e15f',
    messagingSenderId: '34585870094',
    projectId: 'to-do-app-d86a6',
    authDomain: 'to-do-app-d86a6.firebaseapp.com',
    storageBucket: 'to-do-app-d86a6.appspot.com',
    measurementId: 'G-S35PV9D4SK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxrdeV3evQAw_SlF71vRyd9MDyesS75zo',
    appId: '1:34585870094:android:f51b42281c67e9ed78e15f',
    messagingSenderId: '34585870094',
    projectId: 'to-do-app-d86a6',
    storageBucket: 'to-do-app-d86a6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDH8i-BGBJ99yfLBUFkTyIKdq75EIWYCQ8',
    appId: '1:34585870094:ios:c4334ef5cd0f96be78e15f',
    messagingSenderId: '34585870094',
    projectId: 'to-do-app-d86a6',
    storageBucket: 'to-do-app-d86a6.appspot.com',
    androidClientId: '34585870094-a7npe4kjjmr7lni3jt7pv876ibc8lrc3.apps.googleusercontent.com',
    iosClientId: '34585870094-hvupbdk1uedtd0kahgd1qd3f2cm9v7gn.apps.googleusercontent.com',
    iosBundleId: 'com.example.design',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDH8i-BGBJ99yfLBUFkTyIKdq75EIWYCQ8',
    appId: '1:34585870094:ios:58391825b002bdfc78e15f',
    messagingSenderId: '34585870094',
    projectId: 'to-do-app-d86a6',
    storageBucket: 'to-do-app-d86a6.appspot.com',
    androidClientId: '34585870094-a7npe4kjjmr7lni3jt7pv876ibc8lrc3.apps.googleusercontent.com',
    iosClientId: '34585870094-l9e9o3ct3n2r2phgiia63lpoq2lfl71m.apps.googleusercontent.com',
    iosBundleId: 'com.example.design.RunnerTests',
  );
}
