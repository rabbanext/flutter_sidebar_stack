import 'package:flutter/material.dart';
import 'package:flutter_sidebar_stack/bloc/navigation_bloc/navigation_bloc.dart';

class MessagesPage extends StatefulWidget with NavigationStates {
  final Function onMenuTap;

  const MessagesPage({Key key, this.onMenuTap}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  var dts = DTS();
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      child: Icon(Icons.menu, color: Colors.black),
                      onTap: widget.onMenuTap,
                    ),
                    Text("Messages", style: TextStyle(fontSize: 24, color: Colors.black)),
                    Icon(Icons.settings, color: Colors.black),
                  ],
                ),
                PaginatedDataTable(
                  sortColumnIndex: 0,
                  sortAscending: true,
                  header: Text("Data Table Header"),
                  columns: [
                    DataColumn(label: Text("Kolom 1")),
                    DataColumn(label: Text("Kolom 2")),
                    DataColumn(label: Text("Kolom 3")),
                    DataColumn(label: Text("Kolom 4")),
                  ],
                  source: dts,
                  onRowsPerPageChanged: (r){
                    setState(() {
                      _rowPerPage = r;
                    });
                  },
                  rowsPerPage: _rowPerPage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DTS extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(selected: true, index: index, cells: [
      DataCell(Text("#baris $index, kolom 1"), showEditIcon: true,),
      DataCell(Text("#baris $index, kolom 2")),
      DataCell(Text("#baris ke-$index, kolom 3")),
      DataCell(Text("#baris $index, kolom 4")),
    ]);
  }

  @override
  bool get isRowCountApproximate => true;

  @override

  int get rowCount => 100;

  @override
  int get selectedRowCount => 0;
}


