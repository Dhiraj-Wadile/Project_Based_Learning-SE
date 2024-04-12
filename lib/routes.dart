import 'package:flutter/material.dart';
import 'package:splitbuddie/Models/create_group_model.dart';
import 'package:splitbuddie/common/widgets/bottom_bar.dart';
import 'package:splitbuddie/features/Home/screens/home_page.dart';
import 'package:splitbuddie/features/auth/screens/auth_screen.dart';
import 'package:splitbuddie/features/create_group/screens/create_group_screen.dart';
import 'package:splitbuddie/features/expense/screens/add_expense_screem.dart';
import 'package:splitbuddie/features/expense/screens/expense_screen.dart';
import 'package:splitbuddie/features/groups/screens/add_friends_in_group_screen.dart';
import 'package:splitbuddie/features/groups/screens/group_info_screen.dart';
import 'package:splitbuddie/features/groups/screens/group_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    case BottomBar.routeName:
      int index = routeSettings.arguments as int;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BottomBar(
            // indexFromOtherPage: index,
            ),
      );

    case HomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    case CreateGroupScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CreateGroupScreen(),
      );

    case GroupInfoScreen.routeName:
      var groupInfo = routeSettings.arguments as CreateGroup;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => GroupInfoScreen(
          groupInfo: groupInfo,
        ),
      );

    case GroupScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const GroupScreen(),
      );

    case AddFriendInGroupScreen.routeName:
      var groupInfo = routeSettings.arguments as CreateGroup;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddFriendInGroupScreen(
          groupInfo: groupInfo,
        ),
      );
    case ExpenseScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ExpenseScreen(),
      );

    case AddExpenseScreen.routeName:
      var groupId = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddExpenseScreen(
          groupId: groupId,
        ),
      );

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("Screen Does Not Exists"),
                ),
              ));
  }
}
