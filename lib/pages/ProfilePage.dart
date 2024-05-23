import 'package:flutter/material.dart';
import 'package:shoesShop/models/base_models.dart';

import '../db/database.dart';
import '../utils/userManager.dart';


class ProfilePage extends StatefulWidget {

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final currentUser = UserManager.getCurrentUser(); // دریافت کاربر لاگین شده از UserManager

    return Scaffold(
      appBar: AppBar(
        title: Text('پروفایل'),
        actions: [
          IconButton(
            onPressed: () {
              // اضافه کردن اکشن‌های دیگر، مانند ویرایش پروفایل
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/logo.png'),
            ),
            SizedBox(height: 20),
            Text(
              currentUser?.fullName ?? 'نام و نام خانوادگی',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              currentUser!.email,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'اطلاعات تکمیلی',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Divider(height: 20),
                    ListTile(
                      title: Text('شماره موبایل'),
                      subtitle: Text(currentUser.mobile ?? 'ثبت نشده'),
                      leading: Icon(Icons.phone),
                    ),
                    ListTile(
                      title: Text('آدرس'),
                      subtitle: Text('آدرس کاربر'),
                      leading: Icon(Icons.location_on),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
