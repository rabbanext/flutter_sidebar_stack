import 'package:flutter/material.dart';
import 'package:flutter_sidebar_stack/bloc/navigation_bloc/navigation_bloc.dart';

class BacklogPage extends StatefulWidget with NavigationStates {
  final Function onMenuTap;

  const BacklogPage({Key key, this.onMenuTap}) : super(key: key);

  @override
  _BacklogPageState createState() => _BacklogPageState();
}

class _BacklogPageState extends State<BacklogPage> {
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.green, Colors.blue]
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: ListView(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      child: Icon(Icons.menu, color: Colors.black),
                      onTap: widget.onMenuTap,
                    ),
                    Text("Backlog", style: TextStyle(fontSize: 24, color: Colors.black)),
                    Icon(Icons.settings, color: Colors.black),
                  ],
                ),
                SizedBox(height: 20),
                PaginatedDataTable(
                  header: Text('Data Backlog'),
                  rowsPerPage: 10,
                  columns: [
                    DataColumn(label: Text('Kabupaten')),
                    DataColumn(label: Text('Kelurahan')),
                    DataColumn(label: Text('Kecamatan')),
                    DataColumn(label: Text('Backlog')),
                  ],
                  source: _DataSource(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Row {
  _Row(
      this.valueA,
      this.valueB,
      this.valueC,
      this.valueD,
      );

  final String valueA;
  final String valueB;
  final String valueC;
  final int valueD;

  bool selected = false;
}

class _DataSource extends DataTableSource {
  _DataSource(this.context) {
    _rows = <_Row>[
      _Row('Cell A1', 'CellB1', 'CellC1', 1),
      _Row('Cell A2', 'CellB2', 'CellC2', 2),
      _Row('Cell A3', 'CellB3', 'CellC3', 3),
      _Row('Cell A4', 'CellB4', 'CellC4', 4),
      _Row('Cell A4', 'CellB4', 'CellC4', 4),
      _Row('Cell A4', 'CellB4', 'CellC4', 4),
      _Row('Cell A4', 'CellB4', 'CellC4', 4),
      _Row('Cell A4', 'CellB4', 'CellC4', 4),
      _Row('Cell A4', 'CellB4', 'CellC4', 4),
      _Row('Cell A4', 'CellB4', 'CellC4', 4),
      _Row('Cell A4', 'CellB4', 'CellC4', 4),
    ];
  }

  final BuildContext context;
  List<_Row> _rows;

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _rows.length) return null;
    final row = _rows[index];
    return DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        if (row.selected != value) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          row.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(row.valueA)),
        DataCell(Text(row.valueB)),
        DataCell(Text(row.valueC)),
        DataCell(Text(row.valueD.toString())),
      ],
    );
  }

  @override
  int get rowCount => _rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

