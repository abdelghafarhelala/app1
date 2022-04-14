import 'package:app1/app_locale/app_locale.dart';
import 'package:app1/components/components.dart';

import 'package:app1/modules/homePage/homePage.dart';
import 'package:app1/modules/login/loginCubit/loginCubit.dart';
import 'package:app1/modules/login/loginCubit/loginStates.dart';
import 'package:app1/modules/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('${getLang(context, 'login')}'),
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
                          Text('${getLang(context, 'loginToSeeOurHotOffers')}',
                              style: Theme.of(context).textTheme.bodyText1),
                          const SizedBox(
                            height: 30,
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
                              type: TextInputType.visiblePassword),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultTextField(
                              controller: passwordController,
                              lable: '${getLang(context, 'password')}',
                              prefix: Icons.lock,
                              suffix: LoginCubit.get(context).suffix,
                              suffixPressed: () {
                                LoginCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              isSecure: LoginCubit.get(context).isPass,
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
                          defaultButton(
                              onPress: () {
                                if (formKey.currentState!.validate()) {
                                  navigateTo(context, HomePage());
                                } else {}
                              },
                              text: '${getLang(context, 'login')}'),
                          // Container(
                          //   width: double.infinity,
                          //   height: 50,
                          //   child: OutlinedButton(
                          //       onPressed: () {}, child: const Text('data')),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${getLang(context, 'doNotHaveAnAccount')}',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              TextButton(
                                  onPressed: () {
                                    navigateTo(context, const RegisterScreen());
                                  },
                                  child: Text(
                                    '${getLang(context, 'register')}',
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
