// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBV8nta7gf29owtCt4YkLck21tD-i2lhn0',
    appId: '1:679407968986:web:15a8c920e065a49cf97be3',
    messagingSenderId: '679407968986',
    projectId: 'task2-eb8d9',
    authDomain: 'task2-eb8d9.firebaseapp.com',
    storageBucket: 'task2-eb8d9.appspot.com',
    measurementId: 'G-TTPSSJJ8NJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6MIMeS1qeAXWqqgM8DnNPtIWGNG5dy0Y',
    appId: '1:679407968986:android:cfa324bb3d9d5bbdf97be3',
    messagingSenderId: '679407968986',
    projectId: 'task2-eb8d9',
    storageBucket: 'task2-eb8d9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxnLAI0OPMKbYenFkZM3UNRZX-QZnhNto',
    appId: '1:679407968986:ios:73369cb228b8c69bf97be3',
    messagingSenderId: '679407968986',
    projectId: 'task2-eb8d9',
    storageBucket: 'task2-eb8d9.appspot.com',
    iosBundleId: 'com.example.formTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCxnLAI0OPMKbYenFkZM3UNRZX-QZnhNto',
    appId: '1:679407968986:ios:73369cb228b8c69bf97be3',
    messagingSenderId: '679407968986',
    projectId: 'task2-eb8d9',
    storageBucket: 'task2-eb8d9.appspot.com',
    iosBundleId: 'com.example.formTask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBV8nta7gf29owtCt4YkLck21tD-i2lhn0',
    appId: '1:679407968986:web:766c365083a32beef97be3',
    messagingSenderId: '679407968986',
    projectId: 'task2-eb8d9',
    authDomain: 'task2-eb8d9.firebaseapp.com',
    storageBucket: 'task2-eb8d9.appspot.com',
    measurementId: 'G-EB3R64HEZG',
  );
}
