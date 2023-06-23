import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:merchant_kyc_app/screen/login/login_screen.dart';

import '../../helper_widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isHiddenPassword = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isCheckedOne = false;
  bool isCheckedTwo = false;

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();
    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  void initState() {
    //Начальное значение цвета кнопки
    enableColor = Colors.white;
    disableColor = const Color(0xffF5F5F5);
    super.initState();
  }

  late Color enableColor;
  late Color disableColor;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign up',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 165,
                          child: TextButton(
                            onPressed: () {
                              //Здесь меняем переменную цвета кнопки внутри state
                              setState(() {
                                index = 0;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              //Здесь указывается, что для цвета нужно взять переменную
                              backgroundColor:
                                  index == 0 ? disableColor : enableColor,
                            ),
                            child: const Text(
                              'Email',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          ),
                        )),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: 166,
                          child: TextButton(
                            onPressed: () {
                              //Здесь меняем переменную цвета кнопки внутри state
                              setState(() {
                                index = 1;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              //Здесь указывается, что для цвета нужно взять переменную
                              backgroundColor:
                                  index == 1 ? disableColor : enableColor,
                            ),
                            child: const Text(
                              'Phone Number',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            (index == 0)
                ? Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            controller: emailTextInputController,
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? 'Введите правильный Email'
                                    : null,
                            decoration: const InputDecoration(
                              hintText: 'Email:',
                              // label: Text('Email'),
                              labelStyle: TextStyle(
                                color: Color(0xFF585858),
                                fontWeight: FontWeight.bold,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            obscureText: isHiddenPassword,
                            controller: passwordTextInputController,
                            validator: (value) =>
                                value != null && value.length < 6
                                    ? 'Минимум 6 символов'
                                    : null,
                            decoration: InputDecoration(
                              hintText: 'Password:',
                              // label: Text('Password'),
                              labelStyle: const TextStyle(
                                color: Color(0xFF585858),
                                fontWeight: FontWeight.bold,
                              ),
                              suffix: InkWell(
                                onTap: togglePasswordView,
                                child: Icon(
                                  isHiddenPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black,
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                // color of tick Mark
                                activeColor: const Color(0xff54DF8B),
                                value: isCheckedOne,
                                shape: const CircleBorder(),
                                onChanged: (bool? value) {
                                  setState(() {
                                    isCheckedOne = value!;
                                  });
                                },
                              ),
                              Center(
                                  child: RichText(
                                text: TextSpan(
                                  text: "I have read and agree to THOTH's",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' Terms of \n Service',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            debugPrint(
                                                ' The button is clicked!');
                                          },
                                        style: const TextStyle(
                                          color: Colors.blue,
                                        )),
                                    const TextSpan(text: ' and '),
                                    TextSpan(
                                        text: ' Privacy Policy ',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            debugPrint('The button is clicked');
                                          },
                                        style: const TextStyle(
                                          color: Colors.blue,
                                        )),
                                  ],
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                // color of tick Mark
                                activeColor: const Color(0xff54DF8B),
                                value: isCheckedTwo,
                                shape: const CircleBorder(),
                                onChanged: (bool? value) {
                                  setState(() {
                                    isCheckedTwo = value!;
                                  });
                                },
                              ),
                              const Text(
                                  'I agree to receive promotional materials \n from THOTH'),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Center(
                            child: CustomButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => Screen(),
                                  ),
                                );
                              },
                              child: const Text('Next').tr(),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(color: Colors.black),
                                  )),
                                  child: const Center(
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      'Phone Number:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IntlPhoneField(
                                  dropdownIconPosition: IconPosition.trailing,
                                  initialCountryCode: 'RU',
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(color: Colors.black),
                                  )),
                                  child: const Center(
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      'Password:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  autocorrect: false,
                                  obscureText: isHiddenPassword,
                                  controller: passwordTextInputController,
                                  validator: (value) =>
                                      value != null && value.length < 6
                                          ? 'Минимум 6 символов'
                                          : null,
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                      color: Color(0xFF585858),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    suffix: InkWell(
                                      onTap: togglePasswordView,
                                      child: Icon(
                                        isHiddenPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.black,
                                      ),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              // color of tick Mark
                              activeColor: const Color(0xff54DF8B),
                              value: isCheckedOne,
                              shape: const CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheckedOne = value!;
                                });
                              },
                            ),
                            Center(
                                child: RichText(
                              text: TextSpan(
                                text: "I have read and agree to THOTH's",
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Terms of \n Service',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          debugPrint(' The button is clicked!');
                                        },
                                      style: const TextStyle(
                                        color: Colors.blue,
                                      )),
                                  const TextSpan(text: ' and '),
                                  TextSpan(
                                      text: ' Privacy Policy ',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          debugPrint('The button is clicked');
                                        },
                                      style: const TextStyle(
                                        color: Colors.blue,
                                      )),
                                ],
                              ),
                            )),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              // color of tick Mark
                              activeColor: const Color(0xff54DF8B),
                              value: isCheckedTwo,
                              shape: const CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheckedTwo = value!;
                                });
                              },
                            ),
                            const Text(
                                'I agree to receive promotional materials \n from THOTH'),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Center(
                          child: CustomButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const Screen(),
                                ),
                              );
                            },
                            child: const Text('Next').tr(),
                          ),
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ScreenState();
  }
}

class ScreenState extends State<Screen> {
  bool isCheckedOne = false;
  bool isCheckedTwo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const SignUpScreen(),
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'Registration with email',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'Please enter the 6 digit verification code that was sent to <email>. The code is valid for \n 30 minutes.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(color: Colors.black),
                    )),
                    child: const Center(
                      child: Text(
                        textAlign: TextAlign.start,
                        'Code',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                // color of tick Mark
                activeColor: const Color(0xff54DF8B),
                value: isCheckedTwo,
                shape: const CircleBorder(),
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedTwo = value!;
                  });
                },
              ),
              Center(
                  child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Didn` t receive the code?',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            debugPrint('The button is clicked');
                          },
                        style: const TextStyle(
                          color: Colors.blue,
                        )),
                  ],
                ),
              )),
            ],
          ),
          const SizedBox(height: 32),
          Center(
            child: CustomButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: const Text('Next').tr(),
            ),
          )
        ],
      ),
    );
  }
}
