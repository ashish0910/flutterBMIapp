import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState() ;
      }
    }
    
class HomeState extends State<Home> {
  final TextEditingController _ac = TextEditingController();
  final TextEditingController _hc = TextEditingController();
  final TextEditingController _wc = TextEditingController();
  double _result = 0.00 ;
  String _text = "";
  void _cal(){
    setState(() {
          if(_ac.toString().isNotEmpty && _wc.toString().isNotEmpty && _hc.toString().isNotEmpty){
            _result = num.parse(_wc.text)/(num.parse(_hc.text)*num.parse(_hc.text))  ;
            _result = num.parse(_result.toStringAsFixed(2));
            if(_result<18.5 && _result > 0){
              _text = "Underweigh";
            }
            if(_result>=18.5 && _result <=24.99 ){
              _text = "	Normal" ;
            }
            if(_result > 25 && _result <= 29.99 ){
              _text = "Overweight" ;
            }
            if(_result >= 30.0 ){
              _text = "Obese" ;
            }
          }
        });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
      ),
      body: new ListView(
        children: <Widget>[
          new Padding( padding: const EdgeInsets.only(top: 10.0), ),
          new Center(
            child: new Image.asset('images/bmilogo.png',height: 80.0,),
          ),
          new Center(
            child: new Container(
              padding: const EdgeInsets.all(10.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ac,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      labelText: "Age",
                      icon: new Icon(Icons.person)
                    ),
                  ),
                  new TextField(
                    controller: _wc,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      labelText: "Weight in Kg",
                      icon: new Icon(Icons.line_weight)
                    ),
                  ),
                  new TextField(
                    controller: _hc,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      labelText: "Height in Meter",
                      icon: new Icon(Icons.linear_scale)
                    ),
                  ),
                  new Padding( padding: const EdgeInsets.only(top: 20.0), ),
                  new MaterialButton(
                    child: new Text("Calculate",style: new TextStyle(color: Colors.white),),
                    color: Colors.pink,
                    splashColor: Colors.black,
                    onPressed: _cal,
                  ),
                  new Padding( padding: const EdgeInsets.only(top: 15.0), ),
                  new Text(_result>0 ? "Result: $_result" : "Enter Details",style: new TextStyle(color: Colors.black,fontSize: 25.0),),
                  new Padding( padding: const EdgeInsets.only(top: 10.0), ),
                  new Text("$_text",style: new TextStyle(color: Colors.pink,fontSize: 20.0),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}