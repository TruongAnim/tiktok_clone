import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controllers/auth_controller.dart';
import 'package:tiktok_clone/controllers/comment_controller.dart';
import 'package:tiktok_clone/controllers/profile_controller.dart';
import 'package:tiktok_clone/controllers/search_user_controller.dart';
import 'package:tiktok_clone/controllers/upload_controller.dart';
import 'package:tiktok_clone/controllers/video_controller.dart';
import 'package:tiktok_clone/firebase_options.dart';
import 'package:tiktok_clone/views/screens/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) {
    Get.put(AuthController());
    Get.lazyPut(() => UploadController(), fenix: true);
    Get.lazyPut(() => VideoController(), fenix: true);
    Get.lazyPut(() => CommentController(), fenix: true);
    Get.lazyPut(() => SearchUserController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: LoginScreen(),
    );
  }
}
