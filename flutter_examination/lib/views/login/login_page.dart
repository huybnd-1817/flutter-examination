import 'package:flutter/material.dart';
import 'package:flutter_examination/custom_views/gradient_text.dart';
import 'package:flutter_examination/helpers/assets_factory.dart';
import 'package:flutter_examination/helpers/device_helper.dart';
import 'package:flutter_examination/helpers/themes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // MARK: - Properties

  String _email = "";
  String _password = "";
  bool _rememberPassValue = false;

  @override
  Widget build(BuildContext context) {
    DeviceHelper().init(context);
    return GestureDetector(
      onTap: () {
        _onDismissKeyboard(context);
      },
      child: _contentView(),
    );
  }

  // MARK: - Child Widgets

  Widget _contentView() {
    return Container(
      decoration: backgroundDecoration,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SafeArea(bottom: false, child: _appIconImage()),
              _appNameText(),
              _descriptionText(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 25),
                child: _signInText(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                child: _emailTextField(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 10),
                child: _passwordTextField(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: _rememberPasswordCheckBox(),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(45, 0, 45, 25),
                child: _getStartedButton(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _facebookButton(),
                  const SizedBox(width: 32),
                  _twitterButton()
                ],
              ),
              const SizedBox(height: 4),
              _forgotPasswordButton(),
              const SizedBox(height: 16),
              _signUpView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appIconImage() {
    return Image(
      image: AssetImage(AssetsFactory.appIcon),
      height: (DeviceHelper.screenHeight * 0.15),
    );
  }

  Widget _appNameText() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
            fontFamily: 'ArtegraSoft',
            fontWeight: FontWeight.w500,
            fontSize: 32),
        children: <TextSpan>[
          TextSpan(
              text: 'CONN',
              style: TextStyle(color: Color.fromRGBO(244, 50, 111, 1))),
          TextSpan(text: 'EXION', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _descriptionText() {
    return const Text(
      'Find and Meet people around \nyou to find LOVE',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: Colors.white,
      ),
    );
  }

  Widget _signInText() {
    return const Text('SIGN IN',
        style: TextStyle(
          fontFamily: "ArtegraSoft",
          fontWeight: FontWeight.w300,
          fontSize: 24,
          color: Colors.white,
        ));
  }

  Widget _emailTextField() {
    return TextField(
      autocorrect: false,
      cursorColor: Colors.white,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Enter Email",
        hintStyle: hintTextStyle,
        enabledBorder: inputBorderStyle,
        focusedBorder: inputBorderStyle,
      ),
      onChanged: (text) {
        _email = text;
      },
    );
  }

  Widget _passwordTextField() {
    return TextField(
      autocorrect: false,
      obscureText: true,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: hintTextStyle,
        enabledBorder: inputBorderStyle,
        focusedBorder: inputBorderStyle,
      ),
      onChanged: (text) {
        _password = text;
      },
    );
  }

  Widget _rememberPasswordCheckBox() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _rememberPassValue = !_rememberPassValue;
        });
      },
      child: Row(
        children: <Widget>[
          const Spacer(),
          Checkbox(
              activeColor: activeCheckBoxColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              value: _rememberPassValue,
              onChanged: _onRememberPasswordChanged),
          const Text("Remember Password",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }

  Widget _getStartedButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: stadiumButtonStyle,
        child: GradientText(
          "Get started".toUpperCase(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(244, 50, 111, 1),
            Color.fromRGBO(255, 121, 68, 1),
          ]),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _facebookButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Image(image: AssetImage(AssetsFactory.facebookIcon), height: 32),
      style: circleButtonStyle,
    );
  }

  Widget _twitterButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Image(image: AssetImage(AssetsFactory.twitterIcon), height: 32),
      style: circleButtonStyle,
    );
  }

  Widget _forgotPasswordButton() {
    return TextButton(
      child: Text("Forgot password?".toUpperCase(),
          style: const TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600)),
      onPressed: () {},
    );
  }

  Widget _signUpView() {
    return Container(
      color: const Color.fromRGBO(203, 31, 81, 1),
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Don't have account?".toUpperCase(),
              style: const TextStyle(
                  color: Color.fromRGBO(244, 122, 75, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.w700)),
          _signUpButton()
        ],
      ),
    );
  }

  Widget _signUpButton() {
    return TextButton(
      child: Text("Sign Up".toUpperCase(),
          style: const TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w700)),
      onPressed: () {},
    );
  }

  // MARK: - Private Methods

  void _onRememberPasswordChanged(bool? newValue) => setState(() {
        _rememberPassValue = newValue ?? false;
      });

  void _onDismissKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
