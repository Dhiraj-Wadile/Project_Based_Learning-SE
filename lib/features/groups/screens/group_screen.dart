import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:splitbuddie/Models/create_group_model.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/constants/dimensions.dart';
import 'package:splitbuddie/features/create_group/screens/create_group_screen.dart';
import 'package:splitbuddie/features/create_group/services/create_group_services.dart';
import 'package:splitbuddie/features/groups/screens/group_info_screen.dart';
import 'package:splitbuddie/providers/user_provider.dart';

class GroupScreen extends StatefulWidget {
  static const routeName = "/group-screen";
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  void navigateToGroupInfoScreen() {}

  CreateGroupServices createGroupServices = CreateGroupServices();
  List<dynamic>? groupDetails;

  void getDetails() async {
    print("Sahil");
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    String? userId = userProvider.user.id;
    groupDetails = await createGroupServices.getCreatedGroupDetails(context: context, userId: userId!);

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return groupDetails == null
        ? CircularProgressIndicator()
        : Scaffold(
            backgroundColor: AppColors.screenBackgroundColor,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              title: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text(
                  "Groups",
                  style: TextStyle(fontSize: Dimensions.font22, color: Colors.black),
                ),
                const SizedBox(
                  width: 150,
                ),
                const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, CreateGroupScreen.routeName);
                  },
                  child: const Icon(
                    Icons.group_add_outlined,
                    color: Colors.black,
                  ),
                )
              ]),
              backgroundColor: AppColors.screenBackgroundColor,
            ),
            body: Container(
              color: AppColors.screenBackgroundColor,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: groupDetails!.length,
                  itemBuilder: (context, index) {
                    CreateGroup createGroup = CreateGroup(
                      groupId: groupDetails![index]['_id'],
                      userId: groupDetails![index]['userId'],
                      groupName: groupDetails![index]['groupName'],
                      groupType: groupDetails![index]['groupType'],
                    );
                    return GestureDetector(
                      onTap: () {
                        print("index : " + index.toString());
                        print("jhsdvjhbsdvs");
                        print(groupDetails!.length);
                        // CreateGroupServices createGroupServices = CreateGroupServices();
                        final userProvider = Provider.of<UserProvider>(context, listen: false);
                        String? userId = userProvider.user.id;
                        // createGroupServices.getCreatedGroupDetails(context: context, userId: userId!);
                        Navigator.pushNamed(context, GroupInfoScreen.routeName, arguments: createGroup);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 90,
                              // color: AppColors.screenBackgroundColor,
                              child: Image.asset(
                                "assets/images/group-icon.png",
                                height: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 278,
                                  padding: EdgeInsets.only(top: 20, left: 15),
                                  child: Text(
                                    groupDetails![index]['groupName'],
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  width: 278,
                                  padding: EdgeInsets.only(top: 20, left: 15),
                                  child: const Text(
                                    "No expense",
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          );
  }
}
