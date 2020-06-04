# HummingBird Chat 

To run this project you have to have either Android Studio or VsCode setup along with Flutter SDK.

In case you don't have it you can click on the following links.

For Android Studio:
https://developer.android.com/studio

For Flutter SDK:
https://flutter.dev/docs/get-started/install

Now if you have both the Android studio and Flutter setup all you have to do is clone the Repository. For your application to work you have to connect it to firebase.For that refer to the following Link.
https://firebase.google.com/docs/flutter/setup 

This should give you a JSON file with everything you need and you need to put it in:
 /android/app (you will see a file called ' build.gradle ' along with it which means you have put it in the right place)

Now if you have all this setup your Chat app should work although your audio/video calling feature won't work. For that to work you have to register for an account on:
 https://www.agora.io

Its a free account that lets you use the audio/video call feature. Now that you have registered here you have to start a new app on /console/projects by clicking on new project. By doing this you will get an APP ID.  Now this app id you have to put in the 
/lib/utils/settings.dart.

Don't share this APP ID with anyone since once the app is deployed you will use this to connect to the Agora.io and after certain amount of usage it will start charging.

In case your app doesn't connect to firebase please read the documentation as to how it is to be done otherwise the app won't work.

Cheers ! 