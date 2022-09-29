import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../helpers/status.dart';
import '../../models/install_model.dart';
import '../../styles.dart';

class ViewReportBody extends StatefulWidget {
  final Install _service;
  const ViewReportBody(this._service);

  @override
  State<ViewReportBody> createState() => _ViewReportBodyState(_service);
}

class _ViewReportBodyState extends State<ViewReportBody> {
  final Install _report;
  _ViewReportBodyState(this._report);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      decoration: const BoxDecoration(
        color: mainColor,
        border: Border(
          top: BorderSide(width: 6.0, color: mainColor),
        ),
      ),
      child: Column(children: [
        const SizedBox(height: 15.0),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(50)),
              child: Container(
                  padding: const EdgeInsets.fromLTRB(35, 20, 35, 5),
                  height: 80,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                          // width: size.width,
                          padding: const EdgeInsets.all(2),
                          //  decoration: const BoxDecoration(border: BorderDirectional(bottom: BorderSide(color: Colors.black, width: 2))),
                          child: buildReportView(size)),
                    ],
                  ))),
        ),
      ]),
    );
  }

  Widget buildReportView(Size _size) {
    String _time = _report.fecha_final;
    if (_time.length > 12) _time = _time.substring(0, 10);
    return SizedBox(
      width: _size.width * 0.8,
      child: Column(
        children: [
          Text(_report.razon, style: h1Style, overflow: TextOverflow.fade),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    _report.fecha_inicial,
                    style: h3Style,
                  ),
                  Text(
                    _time,
                    overflow: TextOverflow.ellipsis,
                    style: h4Style,
                  ),
                ],
              ),
              //  const SizedBox(width: 50.0),
              StatusLabel(state: _report.estado),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: Container(
              width: _size.width * .8,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Comentarios e Indicaciones:",
                      style: descStyle,
                    ),
                    Text(
                      _report.comentarios,
                      style: h3Style,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => {}, //calificar(_service),

            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(mainColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  //side: BorderSide(color: Colors.red)
                ))),
            child: const Text(
              "Más Detalles",
              style: buttonStyle,
            ),
          ),
        ],
      ),
    );
  }
}
