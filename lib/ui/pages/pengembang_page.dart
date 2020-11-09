import 'package:flutter/material.dart';
import 'package:flutter_sidebar_stack/bloc/navigation_bloc/navigation_bloc.dart';

class PengembangPage extends StatefulWidget with NavigationStates {
  final Function onMenuTap;

  const PengembangPage({Key key, this.onMenuTap}) : super(key: key);

  @override
  _PengembangPageState createState() => _PengembangPageState();
}

class _PengembangPageState extends State<PengembangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(

        ),
      ),
    );
  }
}