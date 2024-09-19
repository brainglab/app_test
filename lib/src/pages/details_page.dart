import 'package:app_test/src/custom/constants.dart';
import 'package:app_test/src/custom/library.dart';
import 'package:app_test/src/custom/validation.dart';
import 'package:app_test/src/providers/global_provider.dart';
import 'package:app_test/src/widgets/custom_button.dart';
import 'package:app_test/src/widgets/custom_input.dart';
import 'package:app_test/src/widgets/navbar_back.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final _formKey = GlobalKey<FormState>();

  Validation mValidationCountryName = Validation();
  Validation mValidationCountryCode = Validation();

  late TextEditingController mCountryNameController;
  late TextEditingController mCountryCodeController;

  @override
  void initState() {
    super.initState();

    mCountryNameController = TextEditingController();
    mCountryCodeController = TextEditingController();

    mCountryNameController.text = Provider.of<GlobalProvider>(context, listen: false).mCountry.mCountryName ?? '';
    mCountryCodeController.text = Provider.of<GlobalProvider>(context, listen: false).mCountry.mCountryCode ?? '';
  }

  @override
  void dispose() {
    mCountryNameController.dispose();
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

      // Get a reference to your Supabase client
      final supabase = Supabase.instance.client;

      try {
        // update country into the 'countries' table
        await supabase.from('countries').update({
          'country_name': mCountryNameController.text,
          'country_code': mCountryCodeController.text,
        }).eq('idx', Provider.of<GlobalProvider>(context, listen: false).mCountry.mIdx!);

        // Show success message
        globalContext = context;
        ScaffoldMessenger.of(globalContext!).showSnackBar(
          const SnackBar(
            content: Text('País guardado exitosamente'),
          ),
        );
        Navigator.of(globalContext!).pop();

        // Clear the input fields
        mCountryNameController.clear();
        mCountryCodeController.clear();

        // Optionally, you can navigate back or refresh the list
        // Navigator.of(context).pop();
      } catch (e) {
        // Show error message if the insertion fails
        globalContext = context;
        ScaffoldMessenger.of(globalContext!).showSnackBar(
          SnackBar(content: Text('Error al guardar el país: $e')),
        );
      }
    }

    if (mMessage.isNotEmpty) {
      globalContext = context;
      customShowToast(globalContext!, mMessage);
      _clear();
    }
  }

  _clear() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarBack(
        backgroundColor: Constants.colorDark,
        backgroundButtonColor: Constants.colorDark,
        tinte: Tinte.dark,
        title: "Editar país",
        showBack: true,
        mListActions: [],
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
                              return mValidationCountryName.validate(
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
                            title: 'Código del país',
                            hint: 'Ej: AR',
                            controller: mCountryCodeController,
                            textInputType: TextInputType.text,
                            validator: (value) {
                              return mValidationCountryCode.validate(
                                type: TypeValidation.text,
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
