import 'dart:async';

import 'package:app_test/src/custom/constants.dart';
import 'package:app_test/src/custom/library.dart';
import 'package:app_test/src/custom/validation.dart';
import 'package:app_test/src/providers/global_provider.dart';
import 'package:app_test/src/widgets/custom_button.dart';
import 'package:app_test/src/widgets/custom_input.dart';
import 'package:app_test/src/widgets/navbar_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FormCountryPage extends StatefulWidget {
  const FormCountryPage({super.key});

  @override
  State<FormCountryPage> createState() => _FormCountryPageState();
}

class _FormCountryPageState extends State<FormCountryPage> {
  // Get a reference to your Supabase client
  final supabase = Supabase.instance.client;

  final _formKey = GlobalKey<FormState>();

  Validation mValidation = Validation();

  late TextEditingController mCountryNameController;
  late TextEditingController mCountryCodeLetterController;
  late TextEditingController mCountryCodeController;

  @override
  void initState() {
    super.initState();

    mCountryNameController = TextEditingController();
    mCountryCodeLetterController = TextEditingController();
    mCountryCodeController = TextEditingController();

    mCountryNameController.text = Provider.of<GlobalProvider>(context, listen: false).mCountry.mCountryName ?? '';
    mCountryCodeLetterController.text = Provider.of<GlobalProvider>(context, listen: false).mCountry.mCountryCodeLetter ?? '';
    mCountryCodeController.text = Provider.of<GlobalProvider>(context, listen: false).mCountry.mCountryCode ?? '';
  }

  @override
  void dispose() {
    mCountryNameController.dispose();
    mCountryCodeLetterController.dispose();
    mCountryCodeController.dispose();
    super.dispose();
  }

  _formValidation() async {
    String mMessage = "";
    if (!_formKey.currentState!.validate()) {
      _clear();
    } else {
      // Validate inputs
      if (mCountryNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, complete todos los campos')),
        );
        return;
      }

      // set global context
      globalContext = context;

      try {
        if (Provider.of<GlobalProvider>(context, listen: false).mCountry.mIdx == null) {
          // insert country into the 'countries' table
          progressDialogShow(globalContext!);
          await supabase.from('countries').insert({
            'country_name': mCountryNameController.text,
            'country_code_letter': mCountryCodeLetterController.text,
            'country_code': mCountryCodeController.text,
          });
          dialogDismiss();

          // alert
          customShowToast(globalContext!, 'País creado exitosamente');
        } else {
          // update country into the 'countries' table
          progressDialogShow(globalContext!);
          await supabase.from('countries').update({
            'country_name': mCountryNameController.text,
            'country_code_letter': mCountryCodeLetterController.text,
            'country_code': mCountryCodeController.text,
          }).eq('idx', Provider.of<GlobalProvider>(context, listen: false).mCountry.mIdx!);
          dialogDismiss();

          customShowToast(globalContext!, 'País actualizado exitosamente');
        }

        Navigator.of(globalContext!).pop();

        // Clear the input fields
        mCountryNameController.clear();
        mCountryCodeLetterController.clear();
        mCountryCodeController.clear();
      } catch (e) {
        // Show error message if the insertion fails
        customShowToast(globalContext!, 'Error al guardar el país: $e');
      }
    }

    if (mMessage.isNotEmpty) {
      customShowToast(globalContext!, mMessage);
      _clear();
    }
  }

  _clear() {
    setState(() {});
  }

  deleteConfirmation({required BuildContext context, required String mCountryName}) {
    return showModalBottomSheet(
      context: context,
      enableDrag: true,
      backgroundColor: Constants.colorBackgroundPanel,
      builder: (BuildContext context) {
        return Container(
          color: Constants.colorBackgroundPanel,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Eliminar país',
                  style: Constants.textStyleAccentTitle,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Text(
                  '¿Confirmas eliminar a $mCountryName de la lista? ',
                  style: Constants.textStyleLight,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      width: double.infinity,
                      color: Constants.colorBlack,
                      callback: () => Navigator.pop(context),
                      child: Text(
                        "Atrás",
                        style: Constants.textStyleAccentSemiBold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      width: double.infinity,
                      color: Constants.colorAccent,
                      callback: () {
                        deleteCountry();
                        Navigator.pop(globalContext!);
                        Navigator.pop(globalContext!);
                      },
                      child: Text(
                        "Eliminar",
                        style: Constants.textStyleBlackBold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  deleteCountry() async {
    try {
      if (Provider.of<GlobalProvider>(context, listen: false).mCountry.mIdx == null) {
        // alert
        customShowToast(globalContext!, 'No fue posible eliminar registro');
      } else {
        // update country into the 'countries' table
        progressDialogShow(globalContext!);
        await supabase.from('countries').delete().eq('idx', Provider.of<GlobalProvider>(context, listen: false).mCountry.mIdx!);
        Timer(const Duration(seconds: 3), () {});
        dialogDismiss();

        customShowToast(globalContext!, 'País eliminado exitosamente');
      }
    } catch (e) {
      // Show error message if the insertion fails
      customShowToast(globalContext!, 'Error al guardar el país: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarBack(
        backgroundColor: Constants.colorDark,
        backgroundButtonColor: Constants.colorDark,
        tinte: Tinte.dark,
        title: Provider.of<GlobalProvider>(context, listen: false).mCountry.mIdx == null ? "Nuevo Pais" : "Editar país",
        showBack: true,
        mListActions: [
          Provider.of<GlobalProvider>(context, listen: false).mCountry.mIdx == null
              ? const SizedBox()
              : CustomButton(
                  color: Colors.transparent,
                  width: 50,
                  callback: () async {
                    globalContext = context;
                    deleteConfirmation(context: globalContext!, mCountryName: Provider.of<GlobalProvider>(context, listen: false).mCountry.mCountryName!);
                  },
                  child: Icon(
                    TablerIcons.trash,
                    color: Constants.colorAccent,
                    size: 25,
                  ),
                )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: RefreshIndicator(
          backgroundColor: Constants.colorAccent,
          color: Constants.colorLight,
          strokeWidth: 3,
          displacement: 80,
          onRefresh: () async {
            if (mounted) {
              globalContext = context;
            }
          },
          child: SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          CustomInput(
                            title: 'Nombre del país',
                            hint: 'Ej: Argentina',
                            controller: mCountryNameController,
                            textInputType: TextInputType.text,
                            validator: (value) {
                              return mValidation.validate(
                                type: TypeValidation.text,
                                name: 'Nombre del país',
                                value: mCountryNameController.text,
                                isRequired: true,
                                min: 3,
                                max: 80,
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomInput(
                            title: 'Código de letras del país',
                            hint: 'Ej: AR',
                            controller: mCountryCodeLetterController,
                            textInputType: TextInputType.text,
                            validator: (value) {
                              return mValidation.validate(
                                type: TypeValidation.text,
                                name: 'Código de letras del país',
                                value: mCountryCodeLetterController.text,
                                isRequired: true,
                                min: 2,
                                max: 2,
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomInput(
                            title: 'Código del país',
                            hint: 'Ej: AR',
                            controller: mCountryCodeController,
                            textInputType: TextInputType.text,
                            validator: (value) {
                              return mValidation.validate(
                                type: TypeValidation.numbers,
                                name: 'Código del país',
                                value: mCountryCodeController.text,
                                isRequired: false,
                                min: 2,
                                max: 2,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      color: Constants.colorAccent,
                      callback: () async {
                        _formValidation();
                      },
                      child: Text(
                        'Guardar',
                        style: Constants.textStyleBlackBold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
