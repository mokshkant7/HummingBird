import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import './call.dart';
import 'package:flash_chat/components/RoundedButton.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();

  /// if channel textField is validated to have error
  bool _validateError = false;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Video Call'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            alignment: Alignment(0.0, 1.0),
            image: AssetImage('images/HummingBirdLogo.png'),
          )),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 400,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    controller: _channelController,
                    decoration: InputDecoration(
                      errorText:
                          _validateError ? 'Channel name is mandatory' : null,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1),
                      ),
                      hintText: 'Channel',
                    ),
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RoundedButton(
                        onPressed: onJoin,
                        title: 'Join',
                        colour: Color(0xFFFAC989),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic();
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController.text,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}
