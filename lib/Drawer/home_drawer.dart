// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:news_app/Drawer/optins.dart';
import 'package:news_app/mytheme.dart';

class HomeDrawer extends StatelessWidget {
  static const int category =1;
  static const int settings= 2;
Function onMenuItemClick;
   HomeDrawer({
    Key? key,
    required this.onMenuItemClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 4.5,
          decoration: const BoxDecoration(
            color: MyTheme.primaryColor,
          ),
          child: Text(
            '${AppLocalizations.of(context)!.app_title} !',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      InkWell(
        onTap: () {
          onMenuItemClick(category);
        },
        child: Options(icon: Icons.list, text: 'Category')),
      InkWell(
        onTap: () {
          onMenuItemClick(settings);
        },
        child: Options(icon: Icons.settings, text: 'Settings'))
      ],
    );
  }
}
