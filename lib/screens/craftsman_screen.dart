import 'package:flutter/material.dart';
import 'package:hackatec/models/artesano_model.dart';
import 'package:hackatec/screens/loading_screen.dart';

class CraftsmanScreen extends StatelessWidget {
  CraftsmanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: size.height * .25,
          ),
          _ListArtesanos(
            artesanos: [
              Artesano(
                  name: 'Mariana',
                  gender: 'female',
                  lastName: 'Olivas',
                  admissionDate: '03/10/2021',
                  geoLocalization: [""],
                  image:
                      'https://www.elsoldemexico.com.mx/mexico/kn0us-artesano.jpg/ALTERNATES/LANDSCAPE_768/artesano.jpg'),
              Artesano(
                  name: 'Mariana',
                  gender: 'female',
                  lastName: 'Olivas',
                  admissionDate: '03/10/2021',
                  geoLocalization: [""],
                  image:
                      'https://www.elsoldemexico.com.mx/mexico/kn0us-artesano.jpg/ALTERNATES/LANDSCAPE_768/artesano.jpg'),
              Artesano(
                  name: 'Mariana',
                  gender: 'female',
                  lastName: 'Olivas',
                  admissionDate: '03/10/2021',
                  geoLocalization: [""],
                  image:
                      'https://www.elsoldemexico.com.mx/mexico/kn0us-artesano.jpg/ALTERNATES/LANDSCAPE_768/artesano.jpg'),
              Artesano(
                  name: 'Mariana',
                  gender: 'female',
                  lastName: 'Olivas',
                  admissionDate: '03/10/2021',
                  geoLocalization: [""],
                  image:
                      'https://www.elsoldemexico.com.mx/mexico/kn0us-artesano.jpg/ALTERNATES/LANDSCAPE_768/artesano.jpg'),
              Artesano(
                  name: 'Mariana',
                  gender: 'female',
                  lastName: 'Olivas',
                  admissionDate: '03/10/2021',
                  geoLocalization: [""],
                  image:
                      'https://www.elsoldemexico.com.mx/mexico/kn0us-artesano.jpg/ALTERNATES/LANDSCAPE_768/artesano.jpg')
            ],
          ),
        ],
      )),
    );
  }
}

class _ListArtesanos extends StatelessWidget {
  final List<Artesano>? artesanos;

  const _ListArtesanos({this.artesanos});

  @override
  Widget build(BuildContext context) => artesanos!.isNotEmpty
      ? Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: artesanos?.length,
              itemBuilder: (BuildContext context, int i) {
                return _ArtesanoItem(
                  artesano: artesanos![i],
                );
              },
            ),
          ),
        )
      : Center(child: Text('vacío', style: TextStyle(color: Colors.grey[400])));
}

class _ArtesanoItem extends StatelessWidget {
  final Artesano artesano;

  const _ArtesanoItem({required this.artesano});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'loading');
        print('Presionado');
      },
      child: Container(
          decoration: _cardDecoration(),
          height: size.height * 0.14,
          margin: const EdgeInsets.only(
            bottom: 10,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: size.width * 0.2,
                    width: size.width * 0.2,
                    child: FadeInImage(
                      image: NetworkImage(artesano.image!),
                      placeholder: AssetImage('assets/images/loading.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.08,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        artesano.name + " " + artesano.lastName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        maxLines: 3,
                      ),
                      Text(
                        "ARTESANO",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        maxLines: 4,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        artesano.gender,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        maxLines: 4,
                      ),
                    ],
                  ),
                )
              ])),
    );
  }

  BoxDecoration _cardDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
              offset: Offset(0, 5),
            )
          ]);
}
