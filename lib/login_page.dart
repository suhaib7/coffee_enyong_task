import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'items.dart';
import 'items_class.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  double setX = -1;
  double setY = -1;

  void moveBox() {
    setState(() {
      setX = 1;
      setY = -1;
    });
  }

  bool isValid = false;

  List<ItemsList> items = [
    ItemsList('lib/assets/images/img0.png', 'Latte', 9.66, 'description'),
    ItemsList('lib/assets/images/img1.png', 'Cappucino', 10.99, 'description'),
    ItemsList('lib/assets/images/img2.png', 'Dalgona', 10.55, 'description'),
    ItemsList('lib/assets/images/img3.png', 'Americano', 9.55, 'description')
  ];

  login(String email, password) async {
    try {
      Response response = await post(
          Uri.parse(
              'https://reqres.in/api/login?email=eve.holt@reqres.in&password=cityslicka'),
          body: {
            'email': email,
            'password': password,
          });
      if (response.statusCode == 200) {
        isValid = true;
      } else {
        isValid = false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: AnimatedContainer(
            duration: const Duration(seconds: 1),
            alignment: const Alignment(0, 0),
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/images/33.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Stack(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const Text(
                              'Coffee Enyong',
                              style: TextStyle(
                                color: Color(0xFFFBD2A6),
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              height: MediaQuery
                                  .of(context)
                                  .viewInsets
                                  .bottom == 0
                                  ? 200:100,
                              width: MediaQuery
                                  .of(context)
                                  .viewInsets
                                  .bottom == 0
                                  ? 200:100,
                              child: Image.asset(
                                'lib/assets/images/coffee-machine.png',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Color(0xFF6F3C03),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 36,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            textField(
                                controller: emailTextController,
                                isPass: false,
                                label: "User name"),
                            textField(
                              controller: passwordTextController,
                              isPass: false,
                              label: "password",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                if ((emailTextController.text.isNotEmpty) &&
                                    (passwordTextController.text.isNotEmpty)) {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    login(emailTextController.text.toString(),
                                        passwordTextController.text.toString());
                                    isValid
                                        ? setState(() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Items(
                                                    items: items[0],
                                                  )));
                                    })
                                        : null;
                                  }
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content:
                                    Text("please Fill all Failed Required"),
                                  ));
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xFF6E4821),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Color(0xFFE7C6A7),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 95, left: 30),
                              child: Row(
                                children: [
                                  const Text(
                                    'Don\'t have an account?',
                                    style: TextStyle(
                                        color: Color(0xFF6F3C03), fontSize: 20),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Color(0xFF6F3C02),
                                          fontSize: 26),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  textField({TextEditingController? controller,
    String? label,
    bool? isPass,
    FormFieldValidator<String>? validator}) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                label ?? "",
                style: const TextStyle(
                  color: Color(0xFFC1864F),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                autofocus: false,
                obscureText: isPass ?? false,
                validator: validator,
                controller: controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFBE835D),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
