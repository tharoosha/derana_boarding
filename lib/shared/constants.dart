import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    hintText: 'Email',
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink, width: 2)),
    prefixIcon: Icon(FluentSystemIcons.ic_fluent_mail_add_regular, color: Colors.black,)    
    );
    
