import 'package:flutter/material.dart';
import 'package:news_c9_friday/models/category_model.dart';
import 'package:news_c9_friday/screen/tab_controller.dart';
import 'package:news_c9_friday/shared/network/remote/api_manager.dart';

import '../screen/categories_tab.dart';
import '../screen/drawer.dart';
import '../screen/news_tab.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> catories = CategoryModel.getCategories();
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
          drawer: DrawerTab(onDrawerClicked),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.green,
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18))),
            title: Text("News"),
          ),
          body: categoryModel == null
              ? CategoriesTab(catories, onCategoryClicked)
              : NewsTab(categoryModel!.id)),
    );
  }

  CategoryModel? categoryModel = null;

  onCategoryClicked(category) {
    categoryModel = category;
    setState(() {});
  }

  onDrawerClicked(id) {
    if (id == DrawerTab.CAT_ID) {
      categoryModel = null;
    } else if (id == DrawerTab.SETT_ID) {}
    setState(() {
      Navigator.pop(context);
    });
  }
}
