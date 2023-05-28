import 'dart:io';
// changed from html ti io because html only works on web

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text),
    
    ),
    );
}

// 5;10
Future <List<File>> pickImages()  async {
  List <File> images = [];
  try{
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if(files != null && files.files.isNotEmpty){
      for(int i =0; i < files.files.length; i++){
        images.add(File(files.files[i].path!));
      }
    }
  }
  catch(e){
    debugPrint(e.toString());
  }
  return images;
}
