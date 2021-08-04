import 'package:flutter/material.dart';
import 'package:fresno/locator.dart';
import 'package:fresno/views/layout_template/layout_template.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:flutter/services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresno',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LayoutTemplate(), //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/*Acts as the RentView as creating a separate file for
Rent has integration problems with the blockchain*/

class _MyHomePageState extends State<MyHomePage> {
  //Alert for BMX Bike
  void showBMXAlert() {
    Alert(context: context, title: "BMX", desc: "BMX Bike rented").show();

    Alert(context: context, title: "Transaction ID", desc: txHash).show();
  }

  //Alert for Race Bike
  void showRaceBikeAlert() {
    Alert(context: context, title: "Race Bike", desc: "Race Bike Rented")
        .show();
    Alert(context: context, title: "Transaction ID", desc: txHash).show();
  }

  var myData; //Data sent when page loaded for blockchain
  var rentStart = 0;
  String txHash; //Transaction hash storage

  //Blockchain variables
  Client httpClient;
  Web3Client ethclient;
  bool data = false;
  final address = "0x43951f16931Cafe12859F368e50616DBC900e4A2";

//Initialize ethereum client
  void initState() {
    super.initState();
    httpClient = Client();
    ethclient = Web3Client(
        "https://rinkeby.infura.io/v3/710607f127894189b79130c4b555b5f1",
        httpClient);
    getConnection(address);
  }

//Gets deployed contract and returns it
  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString("assets/Blockchain/abi.json");
    String contractAddress = "0xc4b536E9988eC38aF06925A2977E649C9aC318c2"; //Address changes when contract is modified & redoployed

    final contract = DeployedContract(ContractAbi.fromJson(abi, "FresCoin "),
        EthereumAddress.fromHex(contractAddress));
    return contract;
  }

  //Queries the blockchain and checks for the contract
  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethclient.call(
        contract: contract, function: ethFunction, params: args);

    return result;
  }

  Future<void> getConnection(String targetAddress) async {
    //EthereumAddress address = EthereumAddress.fromHex(targetAddress);

    List<dynamic> result = await query("getConnection", []);

    myData = result[0];
    data = true;
    setState(() {});
  }

  //Submit/send function
  Future<String> submit(String functionName, List<dynamic> args) async {
    EthPrivateKey credentials = EthPrivateKey.fromHex(
        "c3be0f5ec9557df8b8bacf107c44d8e9ddc278c5d75729507d4a5226fff92a69"); //Metamask private key, have to replace with own Metamask private key

    DeployedContract contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethclient.sendTransaction(
        credentials,
        Transaction.callContract(
            contract: contract, function: ethFunction, parameters: args),
        fetchChainIdFromNetworkId: true);
    return result;
  }

  //Rent bike function
  Future<String> rentBike() async {
    var rent = BigInt.from(rentStart);
    var response = await submit("rentBike", [rent]);
    print("Rented"); //Shows console log
    txHash = response; // Assigns response value to txHash
    setState(() {});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                child:
                    new Image.asset('assets/BMX.jpg', height: 300, width: 300),
              ), 

              new Container(
                  child: ElevatedButton(
               
                child: Text('BMX (Left)'),
                onPressed: () {
                  rentBike();
                  showBMXAlert();
                },
              )),

              new Container(
                child: new Image.asset('assets/Race Bikes.jpg',
                    height: 300, width: 300),
              ),

              new Container(
                  child: ElevatedButton(

                child: Text('Race Bike (Right)'),
                onPressed: () {
                  rentBike();
                  showRaceBikeAlert();
                },
              )),
            ]),
      ),
    );
  }
}
