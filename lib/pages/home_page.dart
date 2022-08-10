import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapa_page.dart';
import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/scans_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                final scanListProvider =
                    Provider.of<ScanListProvider>(context, listen: false);

                scanListProvider.borrarTodos();
              },
              icon: Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    print(uiProvider.selectedMenuOpt);

    final currenIndex = uiProvider.selectedMenuOpt;

    final tempScan = new ScanModel(valor: 'http://www.trasnan.docn');

    //TODO: leer base de datos

    //DBProvider.db.getScanById(1).then((value) => print(value!.valor));

    //DBProvider.db.getTodosScans().then(print);

    DBProvider.db.getScanPorTipo('http').then(print);

    //DBProvider.db.deleteAllScan();

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currenIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return MapasPage();

      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return DireccionesPage();

      default:
        return MapaPage();
    }
  }
}
