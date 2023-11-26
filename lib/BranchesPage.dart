// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'Branch.dart';

class BranchesPage extends StatefulWidget {
  const BranchesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BranchesPageState createState() => _BranchesPageState();
}

class _BranchesPageState extends State<BranchesPage> {
  final Set<Marker> _branchesList = {};
  final Completer<GoogleMapController> _controller = Completer();
  void onComplete(GoogleMapController controller) {
    // ignore: null_argument_to_non_null_type
    _controller.complete();
  }

  @override
  void initState() {
    
    super.initState();
    fetchPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "فروشگاه",
          style: TextStyle(color: Colors.black45, fontFamily: "Vazir"),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GoogleMap(
        onMapCreated: onComplete,
        markers: _branchesList,
        initialCameraPosition:
            const CameraPosition(target: LatLng(32.605599, 54.165450), zoom: 5),
      ),
    );
  }

  void fetchPoints() async {
    var url = "http://welearnacademy.ir/flutter/branches.json";
    Response response = await get(url as Uri);
    setState(() {
      var pointsJson = json.decode(utf8.decode(response.bodyBytes));
      for (var point in pointsJson) {
        var b = Branch(point['shop_name'], point['id'], point['tel'],
            point['lat'], point['lng'], point['manager']);
        Marker marker = Marker(
            markerId: MarkerId(b.id.toString()),
            position: LatLng(b.lat, b.lng),
            infoWindow: InfoWindow(title: b.name, snippet: b.manager));
        _branchesList.add(marker);
      }
    });
  }
}
