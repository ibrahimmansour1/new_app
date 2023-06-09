import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/features/presentation/manager/auth/cashe_helper.dart';
import 'package:news_app/features/presentation/manager/auth/user_secure_storage.dart';
import 'package:news_app/features/presentation/views/widgets/custom_loading_indicator.dart';

import '../../manager/auth/login/login_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController? emailController = TextEditingController();

  TextEditingController? passwordController = TextEditingController();
  bool visiblePassword = true;
  final formKey = GlobalKey<FormState>();
  // @override
  // Future<void> initState()  {
  //   final email = await UserSecureStorage.getEmail() ?? '';
  //   setState(() {
  //     emailController!.text = email;
  //   });
  //   super.initState();
  // }

  final _loginCubit = LoginCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/akhbary-logo.png',
                  height: 110,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Akhbary",
                  style: GoogleFonts.lobster(
                    fontWeight: FontWeight.bold,
                    fontSize: 54,
                    color: const Color.fromARGB(255, 7, 48, 214),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DefaultTextFormField(
                  controller: emailController,
                  lText: 'Email',
                  prefixIconName: Icons.person,
                  keyboard: TextInputType.name,
                ),
                const SizedBox(
                  height: 10,
                ),
                DefaultTextFormField(
                  controller: passwordController,
                  lText: 'Password',
                  obscureText: visiblePassword,
                  prefixIconName: Icons.lock_outline_rounded,
                  suffixIconName: IconButton(
                    icon: visiblePassword == true
                        ? const Icon(
                            Icons.visibility_off_rounded,
                          )
                        : const Icon(
                            Icons.remove_red_eye_rounded,
                          ),
                    onPressed: () {
                      setState(() {
                        visiblePassword = !visiblePassword;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Colors.grey, fontSize: 14,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      ),
                      child: const Text(
                        'Don\'t Have an Account? ',
                        style: TextStyle(
                          color: Colors.grey, fontSize: 14,
                          // decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const CustomLoadingIndicator();
                    }
                    if (state is LoginSuccessState) {
                      CacheHelper.saveData(key: 'uId', value: state.uId);
                      context.go('/homeView');
                    }
                    return BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is LoginLoadingState) {
                            return const CustomLoadingIndicator();
                          }

                          return CustomButton(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                _loginCubit.userLogin(
                                  email: emailController!.text.trim(),
                                  password: passwordController!.text.trim(),
                                );
                                await UserSecureStorage.setEmail(
                                  emailController!.text.trim(),
                                );
                                context.go('/homeView');
                              }
                            },
                            text: 'Login',
                          );
                        });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.grey[400],
                      height: 1,
                      width: MediaQuery.of(context).size.width * .365,
                    ),
                    const Text(
                      '    OR    ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Container(
                      color: Colors.grey[400],
                      height: 1,
                      width: MediaQuery.of(context).size.width * .365,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.white,
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/600px-Facebook_Logo_%282019%29.png',
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ]),
            ),
          ),
        )),
      ),
    );
  }
}