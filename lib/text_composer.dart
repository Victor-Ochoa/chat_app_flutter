import 'package:chat_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/main.dart';

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;
  final _textController = TextEditingController();
  void _resetState() {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: Theme.of(context).platform == TargetPlatform.iOS
            ? BoxDecoration(
                border: Border(top: BorderSide(color: Colors.green[200])))
            : null,
        child: Row(
          children: <Widget>[
            Container(
              child: IconButton(
                icon: Icon(Icons.photo_camera),
                onPressed: () async {
                  
                },
              ),
            ),
            Expanded(
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    _isComposing = !(text == null || text.isEmpty);
                  });
                },
                onSubmitted: (text) {
                  handleSubmite(text);
                  _resetState();
                },
                decoration:
                    InputDecoration.collapsed(hintText: "Enviar uma Mensagem"),
                controller: _textController,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Theme.of(context).platform == TargetPlatform.iOS
                  ? CupertinoButton(
                      child: Text("Enviar"),
                      onPressed: _isComposing
                          ? () {
                              handleSubmite(_textController.text);
                              _resetState();
                            }
                          : null,
                    )
                  : IconButton(
                      onPressed: _isComposing
                          ? () {
                              handleSubmite(_textController.text);
                              _resetState();
                            }
                          : null,
                      icon: Icon(Icons.send),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
