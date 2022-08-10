import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scans_list_provider.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (context, index) => Dismissible(
              //metodo para deslizar
              key: UniqueKey(),
              background: Container(
                color: Colors.purple,
              ),
              onDismissed: (desmis) {
                //scanListProvider.borrarScanPorId(scans[index].id!);
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarScanPorId(scans[index].id!);
              },
              child: ListTile(
                leading: Icon(
                  Icons.map,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(scans[index].valor),
                subtitle: Text(scans[index].id.toString()),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                onTap: () => print('abriendo...'),
              ),
            ));
  }
}
