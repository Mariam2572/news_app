// ignore_for_file: unused_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Category/category_details.dart';
import 'package:news_app/Category/category_fragment.dart';
import 'package:news_app/Drawer/home_drawer.dart';
import 'package:news_app/Search/search_screen.dart';
import 'package:news_app/model/category_dm.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/mytheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'Home screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset(
            'assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
           actions: [
            IconButton(onPressed: (){
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) => SearchScreen(),
               
               ));
            }, icon: Icon(Icons.search))
           ],
             
            title: 
           
                 
                Text(selectedItem == HomeDrawer.settings
                    ? 'Settings'
                    : selectedCategory == null
                        ? AppLocalizations.of(context)?.app_title ?? ""
                        : selectedCategory!.title),
            
            
          ),
          body: selectedItem == HomeDrawer.settings
              ? SettingsTab()
              : selectedCategory == null
                  ? CategoryFragment(onCategoryClick: onCategoryClick)
                  : CategoryDetails(categoryDM: selectedCategory!),
          drawer: Drawer(
            child: HomeDrawer(onMenuItemClick: onMenuItemClick),
          ),
        )
      ],
    );
  }

  CategoryDM? selectedCategory;

  onCategoryClick(CategoryDM newSelectedCategory) {
    //TODO: newSelectedCategory => User
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedItem = HomeDrawer.category;
  onMenuItemClick(int newSelectedItem) {
    selectedItem = newSelectedItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
