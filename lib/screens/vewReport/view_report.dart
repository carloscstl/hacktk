import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackatec/models/install_model.dart';
import 'package:provider/provider.dart';
import '../../styles.dart';
import 'view_report_body.dart';

class ViewReport extends StatefulWidget {
  late Install _service;
  ViewReport(this._service);

  @override
  State<ViewReport> createState() => _ViewReportState(_service);
}

class _ViewReportState extends State<ViewReport> {
  late BuildContext _context;
  late Install service;
  _ViewReportState(this.service);

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      // final providerUser = Provider.of<ProviderUserData>(context, listen: false);

      // context.read<ProviderSocket>().connectToServer(context);
    });

    //Future.delayed(Duration.).then((value) => _context.read<ProviderSocket>().connect());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        shape: const Border(bottom: BorderSide(color: mainColor, width: 4)),
        elevation: 0,
      ),
      body: ViewReportBody(service),
    );
  }
}
