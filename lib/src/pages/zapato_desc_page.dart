import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';

class ZapatoDescriptionPage extends StatelessWidget {
  static final String routeName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(tag: 'zapato-1', child: ZapatoSizePreview(fullScreen: true)),
              Positioned(
                top: 40,
                child: FloatingActionButton(
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _MontoBuyNow(),
                  _ColoresYmas(),
                  _BotonesLikeCartSettings(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(
            icon: Icon(
              Icons.star,
              color: Colors.red,
              size: 25,
            ),
          ),
          _BotonSombreado(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
          _BotonSombreado(
            icon: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;
  final Color color;
  final int size;
  const _BotonSombreado({
    Key? key,
    required this.icon,
    this.color = Colors.white24,
    this.size = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            spreadRadius: -5,
            offset: Offset(0, 5),
          ),
        ],
      ),
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double spaceButton = 35;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                _BotonColor(
                  color: Color(0xff364D56),
                  index: 1,
                  asset: 'assets/imgs/negro.png',
                ),
                Positioned(
                  left: spaceButton * 1,
                  child: _BotonColor(
                    color: Color(0xff2099F1),
                    index: 2,
                    asset: 'assets/imgs/azul.png',
                  ),
                ),
                Positioned(
                  left: spaceButton * 2,
                  child: _BotonColor(
                    color: Color(0xffFFAD29),
                    index: 3,
                    asset: 'assets/imgs/amarillo.png',
                  ),
                ),
                Positioned(
                  left: spaceButton * 3,
                  child: _BotonColor(
                    color: Color(0xffC6D642),
                    index: 4,
                    asset: 'assets/imgs/verde.png',
                  ),
                ),
              ],
            ),
          ),
          BotonNaranja(
            texto: 'More related items',
            small: true,
            color: Colors.orange.shade100,
          )
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String asset;

  const _BotonColor({
    Key? key,
    this.color = Colors.red,
    required this.index,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 200),
      duration: Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = this.asset;
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: this.color,
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$180.00',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Bounce(
            delay: Duration(milliseconds: 500),
            from: 8,
            child: BotonNaranja(
              texto: 'Buy Now',
              small: true,
            ),
          ),
        ],
      ),
    );
  }
}
