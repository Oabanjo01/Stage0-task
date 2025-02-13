import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:stage0_task/utils/constants.dart';

import '../components/searchInput.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLightMode,
      appBar: AppBar(
        title: Text("Welcome to Linking"),
        actions: [Icon(Icons.wb_sunny_outlined)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchInput(),
            ListView.builder(itemBuilder: (context, int) {
              return Text("Items");
            })
          ],
        ),
      ),
    );
  }
}
