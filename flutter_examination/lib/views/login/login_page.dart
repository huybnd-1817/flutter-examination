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

  TextStyle _hintTextStyle = const TextStyle();
  ButtonStyle _stadiumButtonStyle = const ButtonStyle();
  ButtonStyle _circleButtonStyle = const ButtonStyle();

  void init(BuildContext context) {
    DeviceHelper().init(context);
    _hintTextStyle = TextStyle(
        fontSize: 2 * DeviceHelper.blockSize, fontWeight: FontWeight.w300, color: Colors.white);

    _stadiumButtonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 2.3 * DeviceHelper.blockSize),
      primary: Colors.white,
      shape: const StadiumBorder(),
    );

    _circleButtonStyle = ElevatedButton.styleFrom(
      shape: const CircleBorder(),
      padding: EdgeInsets.all(2 * DeviceHelper.blockSize),
      primary: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    init(context);
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
        body: LayoutBuilder(builder: (context, constraint) {
          return Form(
              child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SafeArea(bottom: false, child: _appIconImage()),
                    _appNameText(),
                    _descriptionText(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 3 * DeviceHelper.blockSize, 0, 2 * DeviceHelper.blockSize),
                      child: _signInText(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(4 * DeviceHelper.blockSize, 0,
                          4 * DeviceHelper.blockSize, 5 * DeviceHelper.blockSize),
                      child: _emailTextField(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(4 * DeviceHelper.blockSize, 0,
                          4 * DeviceHelper.blockSize, 2 * DeviceHelper.blockSize),
                      child: _passwordTextField(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4 * DeviceHelper.blockSize),
                      child: _rememberPasswordCheckBox(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5 * DeviceHelper.blockSize,
                          vertical: 3 * DeviceHelper.blockSize),
                      child: _getStartedButton(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _facebookButton(),
                        SizedBox(width: 3.5 * DeviceHelper.blockSize),
                        _twitterButton()
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, DeviceHelper.blockSize, 0, 3 * DeviceHelper.blockSize),
                      child: _forgotPasswordButton(),
                    ),
                    const Spacer(),
                    _signUpView(),
                  ],
                ),
              ),
            ),
          ));
        }),
      ),
    );
  }

  Widget _appIconImage() {
    return Image(
      image: AssetImage(AssetsFactory.appIcon),
      height: 15 * DeviceHelper.blockSize,
    );
  }

  Widget _appNameText() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
            fontFamily: 'ArtegraSoft',
            fontWeight: FontWeight.w500,
            fontSize: 4 * DeviceHelper.blockSize),
        children: const <TextSpan>[
          TextSpan(text: 'CONN', style: TextStyle(color: Color.fromRGBO(244, 50, 111, 1))),
          TextSpan(text: 'EXION', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _descriptionText() {
    return Text(
      'Find and Meet people around \nyou to find LOVE',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 1.7 * DeviceHelper.blockSize,
        color: Colors.white,
      ),
    );
  }

  Widget _signInText() {
    return Text('SIGN IN',
        style: TextStyle(
          fontFamily: "ArtegraSoft",
          fontWeight: FontWeight.w300,
          fontSize: 3 * DeviceHelper.blockSize,
          color: Colors.white,
        ));
  }

  Widget _emailTextField() {
    return TextField(
      autocorrect: false,
      cursorColor: Colors.white,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.white,
        fontSize: 2 * DeviceHelper.blockSize,
      ),
      decoration: InputDecoration(
        hintText: "Enter Email",
        hintStyle: _hintTextStyle,
        enabledBorder: inputBorderStyle,
        focusedBorder: inputBorderStyle,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
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
      style: TextStyle(
        color: Colors.white,
        fontSize: 2 * DeviceHelper.blockSize,
      ),
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: _hintTextStyle,
        enabledBorder: inputBorderStyle,
        focusedBorder: inputBorderStyle,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
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
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              value: _rememberPassValue,
              onChanged: _onRememberPasswordChanged),
          Text("Remember Password",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 1.5 * DeviceHelper.blockSize,
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }

  Widget _getStartedButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: _stadiumButtonStyle,
        child: GradientText(
          "Get started".toUpperCase(),
          style: TextStyle(fontSize: 2 * DeviceHelper.blockSize, fontWeight: FontWeight.w700),
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
      child:
          Image(image: AssetImage(AssetsFactory.facebookIcon), height: 4 * DeviceHelper.blockSize),
      style: _circleButtonStyle,
    );
  }

  Widget _twitterButton() {
    return ElevatedButton(
      onPressed: () {},
      child:
          Image(image: AssetImage(AssetsFactory.twitterIcon), height: 4 * DeviceHelper.blockSize),
      style: _circleButtonStyle,
    );
  }

  Widget _forgotPasswordButton() {
    return TextButton(
      child: Text("Forgot password?".toUpperCase(),
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.white,
              fontSize: 1.5 * DeviceHelper.blockSize,
              fontWeight: FontWeight.w600)),
      onPressed: () {},
    );
  }

  Widget _signUpView() {
    return Container(
      color: const Color.fromRGBO(203, 31, 81, 1),
      padding: EdgeInsets.symmetric(vertical: 2.5 * DeviceHelper.blockSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Don't have account?".toUpperCase(),
              style: TextStyle(
                  color: const Color.fromRGBO(244, 122, 75, 1),
                  fontSize: 1.5 * DeviceHelper.blockSize,
                  fontWeight: FontWeight.w700)),
          _signUpButton()
        ],
      ),
    );
  }

  Widget _signUpButton() {
    return TextButton(
      child: Text("Sign Up".toUpperCase(),
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.white,
              fontSize: 1.5 * DeviceHelper.blockSize,
              fontWeight: FontWeight.w700)),
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
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
