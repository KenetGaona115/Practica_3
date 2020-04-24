import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:practica_tres/bloc/application_bloc.dart';
import 'package:practica_tres/home/details.dart';

class BarcodeScanner extends StatefulWidget {
  BarcodeScanner({Key key}) : super(key: key);

  @override
  _BarcodeScannerState createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner>
    with AutomaticKeepAliveClientMixin<BarcodeScanner> {
  ApplicationBloc _appBloc;
  bool _showShimmer = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _appBloc = BlocProvider.of<ApplicationBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _appBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<ApplicationBloc, ApplicationState>(
      listener: (context, state) {
        if (state is LoadingState) {
          // shimmer
          _showShimmer = true;
        } else if (state is FakeDataFetchedState) {
          // shimmer
          _showShimmer = false;
        } else if (state is ErrorState) {
          // snackbar
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text("${state.message}"),
                duration: Duration(seconds: 1),
              ),
            );
        }
      },
      child: BlocBuilder<ApplicationBloc, ApplicationState>(
        builder: (context, state) {
          int _listSize = _appBloc.getBarcodeItemsList.length;
          return _listSize > 0 || _showShimmer
              ? ListView.builder(
                  itemCount: _showShimmer ? 10 : _listSize,
                  itemBuilder: (BuildContext context, int index) {
                    return _showShimmer
                        ? ListTileShimmer()
                        : ListTile(
                            leading: CircleAvatar(
                              child: Icon(Icons.code),
                              backgroundColor: Colors.amber[50],
                            ),
                            title: Text(
                              "$index - Codigo ${_appBloc.getBarcodeItemsList[index].tipoCodigo}",
                            ),
                            onTap: () {
                              // TODO: mostrar detalle
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return Details(
                                      barcode:
                                          _appBloc.getBarcodeItemsList[index],
                                    );
                                  },
                                ),
                              );
                            },
                          );
                  },
                )
              : Center(child: Text("Todavia no hay objetos escaneados"));
        },
      ),
    );
  }
}
