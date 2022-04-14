import 'package:app1/app_locale/app_locale.dart';
import 'package:app1/components/components.dart';
import 'package:app1/modules/homePage/homePage.dart';
import 'package:app1/modules/login/login.dart';
import 'package:app1/modules/register/registerCubit/registerCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'registerCubit/registerStates.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('${getLang(context, 'register')}'),
              centerTitle: true,
            ),
            body: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            '${getLang(context, 'registerToSeeOurHotOffers')}',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          defaultTextField(
                              lable: '${getLang(context, 'name')}',
                              controller: nameController,
                              prefix: Icons.person,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return '${getLang(context, 'nameNotEmpty')}';
                                }
                              },
                              context: context,
                              type: TextInputType.text),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultTextField(
                              lable: '${getLang(context, 'emailAddress')}',
                              controller: emailController,
                              prefix: Icons.person,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return '${getLang(context, 'emailNotEmpty')}';
                                }
                              },
                              context: context,
                              type: TextInputType.emailAddress),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultTextField(
                              controller: passwordController,
                              lable: '${getLang(context, 'password')}',
                              prefix: Icons.lock,
                              suffix: RegisterCubit.get(context).suffix,
                              suffixPressed: () {
                                RegisterCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              isSecure: RegisterCubit.get(context).isPass,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return '${getLang(context, 'passwordNotEmpty')}';
                                }
                              },
                              context: context,
                              type: TextInputType.visiblePassword),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultTextField(
                              lable: '${getLang(context, 'phone')}',
                              controller: phoneController,
                              prefix: Icons.phone,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return '${getLang(context, 'phoneNotEmpty')}';
                                }
                              },
                              context: context,
                              type: TextInputType.phone),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultButton(
                              onPress: () {
                                if (formKey.currentState!.validate()) {
                                  navigateTo(context, HomePage());
                                } else {}
                              },
                              text: '${getLang(context, 'register')}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${getLang(context, 'HaveAnAccount')}'),
                              TextButton(
                                  onPressed: () {
                                    navigateTo(context, const LoginScreen());
                                  },
                                  child: Text(
                                    '${getLang(context, 'login')}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      // color: Colors.blue,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
