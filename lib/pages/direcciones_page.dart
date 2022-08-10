import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scans_list_provider.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return Scaffold(
        body: ListView.builder(
            itemCount: scans.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(scans[index].valor),
                  leading: Icon(
                    Icons.home_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  ),
                )));
  }
}
