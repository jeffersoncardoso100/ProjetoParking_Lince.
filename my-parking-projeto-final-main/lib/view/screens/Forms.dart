import 'dart:io';
import 'package:final_project/model/Register_provider.dart';
import 'package:final_project/model/shared.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddRegisterPage extends StatefulWidget {
  const AddRegisterPage({Key? key}) : super(key: key);

  @override
  State<AddRegisterPage> createState() => _AddRegisterPageState();
}

class _AddRegisterPageState extends State<AddRegisterPage> {
  ImagePicker imagePicker = ImagePicker();
  File? pickedImage;
  final TextEditingController _driverNameController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text(
          'Adicionar Veiculo',
          style: TextStyle(fontSize: 20),
        ),

        centerTitle: true,
        backgroundColor: Colors.white12,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
                children: [
            Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center()),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: TextFormField(
                    controller: _driverNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (value.length > 40) {
                        return 'Nome muito extenso.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: _buildBorder(Colors.black),
                      disabledBorder: _buildBorder(Colors.white),
                      labelText: 'Nome Condutor',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length > 7) {
                      return 'Placa muito extensa.';
                    } else if (value.isEmpty) {
                      return 'Campo obrigatório.';
                    } else if (value.length < 7) {
                      return 'Placa muito curta.';
                    }
                    return null;
                  },
                  controller: _licensePlateController,
                  decoration: InputDecoration(
                    border: _buildBorder(Colors.black),
                    focusedBorder: _buildBorder(Colors.black),
                    disabledBorder: _buildBorder(Colors.black),
                    labelText: 'Placa do veículo',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    getImage();
                  },
                  icon: const Icon(
                    Icons.linked_camera,
                    color: Colors.green,
                    size: 55,
                  )),

              SizedBox(
                height: 30,
              ),
              pickedImage == null
                  ? Container(
                width: 150,
                height: 150,
                child: const Icon(
                  Icons.add_a_photo_outlined,
                  size: 50,
                  color: Colors.white12,
                ),
              )
                  : SizedBox(
                width: 150,
                height: 150,
                child: ClipRRect(
                  child: Image.file(
                    pickedImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (!(Provider.of<RegisterProvider>(context,
                                        listen: false)
                                    .registers
                                    .length ==
                                Provider.of<Number>(context,
                                        listen: false)
                                    .numberOfLots)) {
                              Provider.of<RegisterProvider>(context,
                                      listen: false)
                                  .addRegister(
                                      _driverNameController.text,
                                      _licensePlateController.text,
                                      DateTime.now(),
                                      pickedImage);
                              Navigator.pop(context);
                            }
                          }
                        },
                        style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all<Color?>(
                              const Color.fromARGB(0, 0, 0, 0)),
                          backgroundColor: MaterialStateProperty.all<Color?>(
                              const Color.fromARGB(255, 23, 23, 26)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(34),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Adicionar",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    var temporaryImage =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (temporaryImage != null) {
      setState(() {
        pickedImage = File(temporaryImage.path);
      });
    }
  }
}

OutlineInputBorder _buildBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(34)),
    borderSide: BorderSide(
      color: color,
      width: 2.0,
    ),
  );
}
