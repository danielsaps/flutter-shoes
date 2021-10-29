import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;
  const ZapatoSizePreview({Key? key, this.fullScreen = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!this.fullScreen) {
          cambiarStatusLight();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => ZapatoDescriptionPage(),
            ),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: (this.fullScreen) ? 5 : 30,
          vertical: (this.fullScreen) ? 0 : 5,
        ),
        padding: EdgeInsets.only(bottom: (this.fullScreen) ? 35 : 30),
        width: double.infinity,
        // height: 400,
        decoration: BoxDecoration(
          color: Color(0xffFFCF53),
          borderRadius: BorderRadius.circular((this.fullScreen) ? 20 : 50),
        ),
        child: Column(
          children: [
            _ZapatoConSombra(),
            if (!this.fullScreen) _ZapatoTallas(),
          ],
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 10,
      // margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ZapatoTallaCaja(7),
          _ZapatoTallaCaja(7.5),
          _ZapatoTallaCaja(8),
          _ZapatoTallaCaja(8.5),
          _ZapatoTallaCaja(9),
          _ZapatoTallaCaja(9.5),
        ],
      ),
    );
  }
}

class _ZapatoTallaCaja extends StatelessWidget {
  final double numero;

  const _ZapatoTallaCaja(this.numero);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        zapatoModel.talla = numero;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          '${numero.toString().replaceAll('.0', '')}',
          style: TextStyle(
            color: (numero == zapatoModel.talla)
                ? Colors.white
                : Color(0xffFFCF53),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color:
              (numero == zapatoModel.talla) ? Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (numero == zapatoModel.talla)
              BoxShadow(
                color: Color(0xffF1A23A),
                blurRadius: 20,
                offset: Offset(0, 5),
              ),
          ],
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            right: 0,
            child: _ZapatoSombra(),
          ),
          Image(
            image: AssetImage(zapatoModel.assetImage),
          ),
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color(0xffEBA14E), blurRadius: 40),
          ],
        ),
      ),
    );
  }
}
