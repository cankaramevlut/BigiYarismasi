import 'package:bilgiya/test_veri.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];

  int soruIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                soruBankasi[soruIndex].soruMetni,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          runSpacing: 3,
          spacing: 5,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        primary: Colors.red[400],
                      ),
                      onPressed: () {
                        bool dogruYanit = soruBankasi[soruIndex].soruYaniti;

                        setState(() {
                          if (dogruYanit == false) {
                            secimler.add(dogruIconu);
                          } else {
                            secimler.add(yanlisIconu);
                          }
                          soruIndex++;
                        });
                      },
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        primary: Colors.green[400],
                      ),
                      onPressed: () {
                        bool dogruYanit = soruBankasi[soruIndex].soruYaniti;
                        setState(() {
                          if (dogruYanit == true) {
                            secimler.add(dogruIconu);
                          } else {
                            secimler.add(yanlisIconu);
                          }
                          soruIndex++;
                        });
                      },
                      child: Icon(Icons.thumb_up, size: 30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
