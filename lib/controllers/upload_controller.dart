import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/video.dart';
import 'package:video_compress/video_compress.dart';

class UploadController extends GetxController {
  Future<File?> _compressVideo(String videoPath) async {
    final compressed = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.MediumQuality);
    return compressed!.file;
  }

  Future<File> _getVideoThumbnail(String videoPath) async {
    final compressed = await VideoCompress.getFileThumbnail(videoPath);
    return compressed;
  }

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(id);
    UploadTask uploadTask =
        ref.putFile((await _compressVideo(videoPath)) as File);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> _uploadThumbnailToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile((await _getVideoThumbnail(videoPath)));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  void uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot snapshot =
          await firebaseStore.collection('users').doc(uid).get();
      var allDocs = await firebaseStore.collection('videos').get();
      int len = allDocs.docs.length;
      String videoId = 'Video $len';
      String videoUrl = await _uploadVideoToStorage(videoId, videoPath);
      String thumbnailUrl = await _uploadThumbnailToStorage(videoId, videoPath);
      Video video = Video(
        username: (snapshot.data() as Map<String, dynamic>)['name'],
        uid: uid,
        id: videoId,
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songName: songName,
        caption: caption,
        videoUrl: videoUrl,
        profilePhoto: (snapshot.data() as Map<String, dynamic>)['profilePhoto'],
        thumbnail: thumbnailUrl,
      );
      await firebaseStore.collection('videos').doc(videoId).set(video.toJson());
      print('upload done');
      Get.back();
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Upload Video fail !!!',
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
