import 'package:flutter/material.dart';
import 'package:hackatec/models/artesano_model.dart';
import 'package:hackatec/models/product_model.dart';

class ItemCraftsmanScreen extends StatelessWidget {
  final Artesano artesano;

  const ItemCraftsmanScreen({required this.artesano});

  @override
  Widget build(BuildContext context) {
    //final Artesano artesano =
    //ModalRoute.of(context)!.settings.arguments as Artesano;
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(artesano),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.all(size.width * 0.03),
              child: Text(artesano.name + ' ' + artesano.lastName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.center),
            ),
            _Overview(artesano),
            _Overview(artesano),
            _Overview(artesano),
            _Overview(artesano),

            //_CustomDatos(artesano)

            Text('Nuevos Productos',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                textAlign: TextAlign.center),

            _ListProducts(size: size),

            SizedBox(
              height: 100,
            )
          ]),
        )
      ],
    ));
  }
}

class _ListProducts extends StatelessWidget {
  _ListProducts({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final List<Product> products = [
    new Product(
        id: '1',
        title: 'Ochil, Matrimonial, Algodón',
        price: 1548,
        description:
            'Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
        slug: 'hola-mundo',
        stock: 12,
        image:
            'https://cdn.shopify.com/s/files/1/0574/6075/2457/products/hammock_ochil_presentation_1024x1024@2x.jpg?v=1654191008'),
    new Product(
        id: '2',
        title: 'Contrary to popular belief,',
        price: 1548,
        description:
            'Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
        slug: 'hola-mundo',
        stock: 12,
        image:
            'https://cdn.shopify.com/s/files/1/0574/6075/2457/products/hammock_ochil_presentation_1024x1024@2x.jpg?v=1654191008'),
    new Product(
        id: '3',
        title: 'Contrary to popular belief,',
        price: 1548,
        description:
            'Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
        slug: 'hola-mundo',
        stock: 12,
        image:
            'https://cdn.shopify.com/s/files/1/0574/6075/2457/products/hammock_ochil_presentation_1024x1024@2x.jpg?v=1654191008'),
    new Product(
        id: '4',
        title: 'Contrary to popular belief,',
        price: 1548,
        description:
            'Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
        slug: 'hola-mundo',
        stock: 12,
        image:
            'https://cdn.shopify.com/s/files/1/0574/6075/2457/products/hammock_ochil_presentation_1024x1024@2x.jpg?v=1654191008'),
    new Product(
        id: '5',
        title: 'Contrary to popular belief,',
        price: 1548,
        description:
            'Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
        slug: 'hola-mundo',
        stock: 12,
        image:
            'https://cdn.shopify.com/s/files/1/0574/6075/2457/products/hammock_ochil_presentation_1024x1024@2x.jpg?v=1654191008'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: _cardDecoration(),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Container(
                  height: size.width * 0.35,
                  width: size.width * 0.35,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage(
                      image: NetworkImage(products[index].image),
                      placeholder: AssetImage('assets/images/loading.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(products[index].title, style: TextStyle(fontSize: 16))
              ],
            ),
          );
        },
      ),
    );
  }
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

class _CustomAppBar extends StatelessWidget {
  final Artesano artesano;

  const _CustomAppBar(this.artesano);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
        backgroundColor: Colors.purple,
        expandedHeight: size.height * 0.27,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.all(0),
          centerTitle: true,
          title: Container(
            width: double.infinity,
            color: Colors.black12,
            padding: EdgeInsets.only(bottom: 10, right: 10, left: 10),
            alignment: Alignment.bottomCenter,
            /* child: Text( institute.name, 
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ) */
          ),
          background: FadeInImage(
              placeholder: AssetImage('assets/images/loading.gif'),
              image: NetworkImage(artesano.image!),
              fit: BoxFit.cover),
        ));
  }
}

class _Overview extends StatelessWidget {
  final Artesano artesano;

  const _Overview(this.artesano);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(size.width * 0.03),
      child: Text(
          'Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.',
          textAlign: TextAlign.justify),
    );
  }
}

class _CustomDatos extends StatelessWidget {
  final Artesano artesano;

  const _CustomDatos(this.artesano);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        //_CustomInfo('Encargado:', artesano.manager),
        //_CustomInfo('Municipio:', artesano.municipality),
      ],
    );
  }
}

class _CustomInfo extends StatelessWidget {
  final String title;
  final String info;

  _CustomInfo(this.title, this.info);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(size.width * 0.03),
      child: Row(
        children: [
          SizedBox(
              width: size.width * 0.25,
              child: Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54))),
          Expanded(
              child: Text(info,
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3)),
        ],
      ),
    );
  }
}
