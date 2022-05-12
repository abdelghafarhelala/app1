import 'package:app1/appCubit/app_cubit.dart';
import 'package:app1/appCubit/app_states.dart';
import 'package:app1/app_locale/app_locale.dart';
import 'package:app1/components/components.dart';
import 'package:app1/modules/homePage/homePage.dart';
import 'package:app1/modules/myDrawer/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var emailController = TextEditingController();
        var nameController = TextEditingController();
        var messageController = TextEditingController();

        var formKey = GlobalKey<FormState>();
        return Scaffold(
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const MyDrawer(),
                  const MyDrawer().myDrawerList(context),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: Text('${getLang(context, 'contactUs')}'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back))
            ],
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
                          '${getLang(context, 'howCanWeHelp')}',
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
                            prefix: Icons.email_outlined,
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
                            lable: '${getLang(context, 'message')}',
                            controller: messageController,
                            prefix: Icons.message_outlined,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return '${getLang(context, 'messageCanNotBeEmpty')}';
                              }
                            },
                            context: context,
                            type: TextInputType.text),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: '${getLang(
                              context,
                              'additionalDetails',
                            )}',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultButton(
                            onPress: () {
                              if (formKey.currentState!.validate()) {
                                navigateTo(context, HomePage());
                              } else {}
                            },
                            text: '${getLang(context, 'submit')}'),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.grey,
                                height: 1,
                              ),
                            ),
                            Text(
                              '${getLang(context, 'OurSocialAccounts')}',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.grey,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlutterSocialButton(
                                mini: true,
                                onTap: () {},
                                buttonType: ButtonType.facebook),
                            FlutterSocialButton(
                                mini: true,
                                onTap: () {},
                                buttonType: ButtonType.twitter),
                            FlutterSocialButton(
                                mini: true,
                                onTap: () {},
                                buttonType: ButtonType.google),
                            FlutterSocialButton(
                                mini: true,
                                onTap: () {},
                                buttonType: ButtonType.linkedin),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
