import 'package:flutter/material.dart';


class Lease extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return  LeaseState();
  }

}

class LeaseState extends State<Lease>
{
  double? _calculation;
  double? _totalMoney;
  String? _calcResult;
  String? _result;

  TextEditingController _moneyFieldController =  TextEditingController();
  TextEditingController _areaFieldController =  TextEditingController();
  TextEditingController _totalMoneyFieldController =  TextEditingController();

  void _calculationLease(){
    double money = double.parse(_moneyFieldController.text);
    double area = double.parse(_areaFieldController.text);
    double total = double.parse(_totalMoneyFieldController.text);

    if(money!=null && area!=null && total!=null){
      setState(() {
        _totalMoney = 20 * (area/total);

        _calculation = money*(area/total);
        _calcResult = _calculation!.toStringAsFixed(2);
        _result = (area + _calculation!).toStringAsFixed(2);



      });
    }



  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar:  AppBar(

        backgroundColor: Colors.purple[800],
        title:  Center(child: Text("লিজের টাকার ক্যালকুলেটর")),
      ),
      body:  ListView(
        padding: const EdgeInsets.all(3.5),
        children: <Widget>
        [
          Image.asset("images/applogo.png",height: 120,width: 150.0,),
          Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _areaFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "মোট টাকা নিবে",
                    icon: Icon(Icons.calendar_today),
                  ),
                ),

                TextFormField(
                  controller: _totalMoneyFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "মোট টাকা( ১ বিঘার )",
                    icon: Icon(Icons.info),
                  ),
                ),

                TextFormField(
                  controller: _moneyFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "লিজের টাকার পরিমান ( প্রতি বিঘা )",
                    icon: Icon(Icons.shutter_speed),
                  ),
                ),


                Padding(padding: const EdgeInsets.all(7.5)),
                ElevatedButton(onPressed: _calculationLease,
                    child: Text("Calculate",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[800],

                    ),
                    ),

                ),



              ],
            ),
          ),



          Padding(padding: const EdgeInsets.all(5.5)),
          Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_totalMoney!=null? "জমির পরিমান:$_totalMoney কাঠা":'',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(_calcResult!=null? "লিজের টাকা : $_calcResult": '',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                Text(_result!=null? "মোট টাকা(লিজেরসহ): $_result": '',
                style: TextStyle(
                  fontSize: 25.0,

                ),
                )
              ],
            ),
          ),



        ],
      ),
    );
  }
}
