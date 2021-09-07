import 'package:flutter/material.dart';
// import 'package:validators/validators.dart';
// import 'package:validators/sanitizers.dart';

class EditPost extends StatefulWidget {
  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {

  late String? title;
  late String? description;
  late String? url;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //Title Widget
  Widget _buildTitle() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Title',
        border: UnderlineInputBorder(),
      ),
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Title is required!';
        }
        return null;
      },
      onSaved: (String? value) {
        title = value;
      },
    );
  }

  //Description Widget
  Widget _buildDesc() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Description',
        border: UnderlineInputBorder(),
      ),
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Description is required!';
        }
        return null;
      },
      onSaved: (String? value) {
        description = value;
      },
    );
  }

  //URL Widget
  Widget _buildUrl() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Image URL',
        border: UnderlineInputBorder(),
      ),
      keyboardType: TextInputType.url,
      validator: (String? value) {
        if (value == null || value.isEmpty || !Uri.parse(value).isAbsolute) {
          return 'Valid URL is required!';
        }
        return null;
      },
      onSaved: (String? value) {
        url = value;
      },
    );
  }

  void validate() {
    if(_formkey.currentState!.validate()) {
      return;
    }

    _formkey.currentState!.save();
    Navigator.pop(context,{
      'title' : title,
      'desc' : description,
      'url' : url,
    });

    print(title);
    print(description);
    print(url);
  }

  @override
  Widget build(BuildContext context) {

    Map data={};
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    title = TextEditingController(text: data['title']) as String?;
    description = TextEditingController(text: data['description']) as String?;
    url = TextEditingController(text: data['imgUrl']) as String?;

    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text('Create a Post'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              _buildTitle(),
              SizedBox(height: 10.0,),
              _buildDesc(),
              SizedBox(height: 10.0,),
              _buildUrl(),
              SizedBox(height: 10.0,),
              ElevatedButton(
                style: ButtonStyle(
                  alignment: Alignment.center,
                ),
                onPressed: () {
                  validate();
                },
                child: Text(
                  'Post',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}