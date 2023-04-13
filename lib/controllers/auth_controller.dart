import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/user.dart' as Model;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  Rx<String> testString = 'hello'.obs;

  Rx<File?>? _pickedImage;

  void pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      _pickedImage = Rx<File?>(File(image.path));
      print(_pickedImage!.value);
    }
  }

  Future<String> uploadToStorage(File avatar) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(avatar);
    TaskSnapshot snap = await uploadTask;
    String urlImage = await snap.ref.getDownloadURL();
    return urlImage;
  }

  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential credential = await firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password);
        print(credential.user!.uid);
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Login fail !!!',
            message: 'Please enter all the field!',
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Login fail !!!',
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void registerUser(String userName, String email, String password) async {
    try {
      File? avatar;
      if (_pickedImage != null) {
        avatar = _pickedImage!.value;
      }
      if (userName.isNotEmpty && password.isNotEmpty && userName.isNotEmpty) {
        UserCredential credential = await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);

        String urlAvatar =
            'https://cdn-icons-png.flaticon.com/512/3607/3607444.png';
        if (avatar != null) {
          urlAvatar = await uploadToStorage(avatar);
        }
        Model.User modelUser = Model.User(
            uid: credential.user!.uid,
            name: userName,
            email: email,
            profilePhoto: urlAvatar);
        await firebaseStore
            .collection('users')
            .doc(credential.user!.uid)
            .set(modelUser.toJson());
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Register error!!!',
            message: 'Please enter all the field!',
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Register error!!!',
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
