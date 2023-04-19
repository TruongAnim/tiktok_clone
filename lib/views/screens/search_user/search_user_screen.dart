import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controllers/search_user_controller.dart';
import 'package:tiktok_clone/models/user.dart';
import 'package:tiktok_clone/views/screens/profile/profile_screen.dart';
import 'package:tiktok_clone/views/widgets/search_widget.dart';

class SearchUserScreen extends StatefulWidget {
  const SearchUserScreen({super.key});

  @override
  _SearchUserScreenState createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  final TextEditingController _searchController = TextEditingController();
  late SearchUserController searchUserController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchUserController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search user'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SearchWidget(
              searchController: _searchController,
              onSearch: () {
                searchUserController.searchUser(_searchController.text);
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: Obx(
                () {
                  return ListView.builder(
                    itemCount: searchUserController.listUser.length,
                    itemBuilder: (BuildContext context, int index) {
                      User user = searchUserController.listUser[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfileScreen(uid: user.uid),
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundImage:
                                    NetworkImage(user.profilePhoto),
                              ),
                              SizedBox(width: 16),
                              Text(
                                user.name,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
