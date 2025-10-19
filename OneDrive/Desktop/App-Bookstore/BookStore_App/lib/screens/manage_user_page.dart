import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_2303e/services/user_profile_dao.dart';
import 'package:flutter_project_2303e/widgets/manage_user_drawer.dart';

import '../models/user_profile.dart';
import '../widgets/beveled_button.dart';

class ManageUserPage extends StatefulWidget {
  const ManageUserPage({super.key});
  static const String routeName = '/ManageUserPage';

  @override
  State<ManageUserPage> createState() => _ManageUserPageState();
}

class _ManageUserPageState extends State<ManageUserPage> {
  late String displayName;
  late String uuid;
  final Future<FirebaseApp> _future = Firebase.initializeApp();
  UserProfileDao userProfileDao = UserProfileDao();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      setState(() {
        displayName = user.displayName.toString();
        uuid = user.uid.toString();
      });
    } else {
      displayName = "Unknown User";
    }
    final connectedRef = userProfileDao.getMessageQuery(uuid);
    connectedRef.keepSynced(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ManageUserDrawer(
          displayName: displayName,
        ),
        appBar: AppBar(
          title: Text(
            'Manage User',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return FirebaseAnimatedList(
                        query: userProfileDao.getMessageQuery(uuid),
                        itemBuilder: (context, snapshot, animation, index) {
                          final json = snapshot.value as Map<dynamic, dynamic>;
                          final userData = UsersProfile.fromJson(json);
                          return Card(
                            elevation: 10.0,
                            color: Colors.white,
                            margin: const EdgeInsets.all(20.0),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  //displayName, mobile, email, city, address
                                  const Text("Name:"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(userData.displayName),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text("Mobile No: "),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(userData.mobile),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text("Email:"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(userData.email),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text("City:"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(userData.city),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text("Address:"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(userData.address),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: beveledButton(
                                          title: "Edit User", onTap: () {}))
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
          ),
        ));
  }
}
