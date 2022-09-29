import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hackatec/env.dart';
import 'package:hackatec/providers/chat_provider.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import 'services.dart';

enum ServerStatus { online, offline, connecting }

class SocketProvider extends ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;

  late io.Socket _socket;
  final baseUrl = Env.baseUrl;
  late dynamic services = [];

  String newMessage = "";

  ServerStatus get serverStatus => _serverStatus;
  io.Socket get socket => _socket;

  Function get emit => _socket.emit;
  late BuildContext _context;

  void connect() async {
    
    final token = await AuthService.getToken();

    _socket = io.io(
      baseUrl,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .enableForceNew()
          .setExtraHeaders({'authentication': token})
          .build(),
    );

    _socket.on('connect', (_) {
      print("connected");
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket.on('disconnect', (_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });


    
    _socket.on('messageResponse', (_) {
      print(_['message']);
      _context.read<ChatProvider>().addResponse(_['message']);
      notifyListeners();
    });

  }

  void disconnect() {
    _socket.disconnect();
  }

  void sendMessage(String fromUserId, String message) {
    log('enviando...');
    _socket.emit('messageClient', {
      "from": fromUserId,
      "message": message,
    });
  }

    void passContext(BuildContext context){
      _context = context;
    }
}
