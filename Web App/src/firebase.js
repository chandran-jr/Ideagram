import firebase from 'firebase/compat/app';
import 'firebase/compat/auth';
import 'firebase/compat/firestore';

const firebaseConfig = {
    apiKey: "AIzaSyAJJuwmJ4H5_6rpWaOmkdnWxiNwezuURm4",
    authDomain: "ideagram-8c8a4.firebaseapp.com",
    projectId: "ideagram-8c8a4",
    storageBucket: "ideagram-8c8a4.appspot.com",
    messagingSenderId: "634361134707",
    appId: "1:634361134707:web:ef758c705d8c3765327406",
    measurementId: "G-D9YNGKNJHM"
  };


  const firebaseApp = firebase.initializeApp(firebaseConfig);

const db = firebaseApp.firestore();

export { db };