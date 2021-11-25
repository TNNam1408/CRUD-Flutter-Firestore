import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_flutter_app/screens/edit_screen.dart';
import 'package:crud_flutter_app/validators/database.dart';

import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Database.readItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.separated(
              separatorBuilder: (context, index)=> SizedBox(height: 16.0,),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index){
                var noteInfo = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                String docId = snapshot.data!.docs[index].id;
                String title = noteInfo['title'];
                String description = noteInfo['description'];

                return Ink(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(8.0),

                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    onTap: ()=> Navigator.of(context).push(
                      MaterialPageRoute(
                          builder:(context)=> EditScreen(
                            currentTitle: title,
                            currentDescription: description,
                            documentId: docId,

                          ),
                      ),
                    ),
                    title: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
            ),
          );

        },
    );
  }
}
