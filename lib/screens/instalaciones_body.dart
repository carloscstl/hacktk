import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hackatec/models/install_model.dart';
import 'package:provider/provider.dart';

import '../helpers/reportTile.dart';
import '../styles.dart';
import 'vewReport/view_report.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Install> todayList = [
      Install(
          razon: "Instalación de Red",
          direccion: "DONATO GUERRA NO. 106, PONCITLAN, 45950",
          fecha_inicial: "01/02/2022",
          fecha_final: "11/02/2022",
          estado: "Terminado",
          dimensiones: "4x2 metros",
          comentarios:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum interdum viverra quam non luctus. Nullam id eros eu purus luctus dapibus non pulvinar lorem. Donec nulla felis, facilisis nec nulla a, semper accumsan orci. "),
      Install(
          razon: "Instalación de Hamaca",
          direccion: "DONATO GUERRA NO. 106, PONCITLAN, 45950",
          fecha_inicial: "12/06/2022",
          fecha_final: "15/06/2022",
          estado: "Proceso",
          dimensiones: "4x2 metros",
          comentarios:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum interdum viverra quam non luctus. Nullam id eros eu purus luctus dapibus non pulvinar lorem. Donec nulla felis, facilisis nec nulla a, semper accumsan orci. "),
      Install(
          razon: "Decoración de Salón",
          direccion: "DONATO GUERRA NO. 106, PONCITLAN, 45950",
          fecha_inicial: "01/02/2022",
          fecha_final: "11/02/2022",
          estado: "Pendiente",
          dimensiones: "12x4 metros",
          comentarios:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum interdum viverra quam non luctus. Nullam id eros eu purus luctus dapibus non pulvinar lorem. Donec nulla felis, facilisis nec nulla a, semper accumsan orci. "),
    ];
    List<Install> historyList = [];

    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        color: mainColor,
        border: Border(
          top: BorderSide(width: 0, color: mainColor),
        ),
      ),
      child: Column(children: [
        const SizedBox(height: 15.0),
        Container(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 15.0,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: const Text("Ordenes de Instalación de Productos",
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            child: Container(
                child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
          child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    height: 70.0,
                    decoration: BoxDecoration(color: Colors.white),
                    child: TabBar(
                      tabs: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Hoy",
                                //style: h2Style,
                              ),
                              const SizedBox(width: 10),
                              Container(
                                alignment: AlignmentDirectional.center,
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: mainColor),
                                child: Text(
                                  todayList.length.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 24),
                                ),
                              )
                            ]),
                        Container(
                          child: const Text(
                            "Historial",
                            style: h2Style,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      width: size.width,
                      child: TabBarView(
                        children: [
                          buildListView(context, todayList),
                          buildListView(context, historyList)
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        )))
      ]),
    );
  }

  Container buildTabBar(Size size) {
    return Container(
        padding: const EdgeInsets.fromLTRB(35, 20, 35, 5),
        height: 80,
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SizedBox());
  }

  void viewReport(BuildContext context, Install _srv) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewReport(_srv)),
    );
  }

  Widget buildListView(BuildContext context, List<Install> services) {
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (BuildContext context, int index) {
        Install _service = services.elementAt(index);
        String? _title =
            _service.razon; //"Report Title: " + (index+1).toString();
        String? _cat = "Instalación";
        String _time = _service.fecha_inicial; //"Vie. 28 Feb, 2:35 pm";

        return GestureDetector(
            child: ReportTile(_title, _cat, _time, _service.estado),
            onTap: () => {
                  viewReport(context, _service),
                });
      },
    );
  }
}
