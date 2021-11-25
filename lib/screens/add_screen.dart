
import 'package:crud_flutter_app/screens/add_item_form.dart';
import 'package:flutter/material.dart';

import 'app_bar.dart';
class AddScreen extends StatelessWidget {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();

      },
      child: Scaffold(
        backgroundColor:  Color(0xFF2C384A),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF2C384A),
          title: AppbarTitle(
            sectionName: 'CRUD',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right:16.0, bottom: 20.0 ,),
            child: AddItemForm(
              titleFocusNode: _titleFocusNode,
              descriptionFocusNode:_descriptionFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
