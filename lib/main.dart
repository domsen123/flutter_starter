import 'package:flutter/material.dart';
import 'package:theming/app/theme/app.theme.dart';
// import 'package:flutter/services.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.black.withOpacity(0), //top bar color
  //     // statusBarIconBrightness: Brightness.dark, // don't use this
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomAppTheme customAppTheme = CustomAppTheme(context: context);

    return MaterialApp(
      title: 'Theme',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: customAppTheme.getThemeData(false),
      darkTheme: customAppTheme.getThemeData(true),
      home: const MyTextFields(),
    );
  }
}

class MyButtons extends StatelessWidget {
  const MyButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: const Text('Enabled Elevated Button'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: CustomAppTheme.getSecondaryElevatedStyle(),
              child: const Text('Secondary Elevated Button'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Disabled Elevated Button'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Enabled Outlined Button'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: CustomAppTheme.getSecondaryOutlinedStyle(),
              child: const Text('Secondary Outlined Button'),
            ),
            const OutlinedButton(
              onPressed: null,
              child: Text('Disabled Outlined Button'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Enabled Text Button'),
            ),
            TextButton(
              onPressed: () {},
              style: CustomAppTheme.getSecondaryTextStyle(),
              child: const Text('Secondary Text Button'),
            ),
            const TextButton(
              onPressed: null,
              child: Text('Disabled Text Button'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextFields extends StatelessWidget {
  const MyTextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Fields'),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Standard Textfield',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Standard Textfield',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Buttons'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyButtons()));
            },
          ),
          ListTile(
            title: const Text('Text Fields'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyTextFields()));
            },
          ),
        ],
      ),
    );
  }
}
