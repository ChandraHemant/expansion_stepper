# expansion_stepper

Combination of Expansion Tile Card and Another Stepper

### Features

* Stepper Cards: The app showcases two expansion stepper cards labeled 'A' and 'B.' Each card consists of multiple steps or phases representing a process.

* Card Interaction: Users can interact with the cards by tapping on them to expand or collapse. Additionally, there are buttons below each card to programmatically control the state of the other card (Open, Close, Toggle).

* Stepper Children: Each card contains stepper children, representing individual steps in a process. These steps include information such as order placement, order preparation, delivery progress, and order delivery.

* Debugging Statements: Debugging statements are included within the onTap callbacks to print messages to the console in debug mode.

## Getting Started

In the dependencies: section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  ...
  expansion_stepper: <latest_version>
```
Import the following in your working dart file:
```yaml
  import 'package:expansion_stepper/expansion_stepper.dart';
```
### Usage

This Flutter application demonstrates the usage of the ExpansionStepperCard widget, a drop-in replacement for Flutter's ExpansionTile. The ExpansionStepperCard provides an enhanced visual experience, making your app more Material.

1. Card Interaction:
   Tap on a card to expand or collapse it.
   Use the buttons below each card to programmatically control the state of the other card.

2. Stepper Children:
   Each card contains multiple stepper children, representing different steps in a process.
   Stepper children include information such as titles, subtitles, icons, and actions.

3. Debugging:
   Debugging statements are included in the onTap callbacks within stepper children. View the console output for debugging information in debug mode.

## Example ExpansionStepperCard

![Example](https://raw.githubusercontent.com/ChandraHemant/expansion_stepper/main/assets/demo.gif)

```dart
import 'package:expansion_stepper/expansion_stepper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpansionStepperCard Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'ExpansionStepperCard Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ExpansionStepperCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionStepperCardState> cardB = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionStepperCard(
              key: cardA,
              leading: const CircleAvatar(child: Text('A')),
              title: const Text('Tap me!'),
              subtitle: const Text('I expand!'),
              stepperChildren: [
                StepperChildren(
                    title: const Text(
                      "Order Placed",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    subtitle: const Text("Your order has been placed"),
                    iconWidget: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: const Icon(Icons.looks_one, color: Colors.white),
                    ),
                  onTap: (){
                      if (kDebugMode) {
                        print('Order Placed!');
                      }
                  },
                  padding: EdgeInsets.only(left: 16),
                  topContent: Divider(
                    thickness: 1,
                    color: Colors.black,
                  )
                ),
                StepperChildren(
                    title: const Text("Preparing"),
                    subtitle: const Text("Your order is being prepared"),
                    iconWidget: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: const Icon(Icons.looks_two, color: Colors.white),
                    ),
                    onTap: (){
                      if (kDebugMode) {
                        print('Order Preparing!');
                      }
                    },
                    padding: EdgeInsets.only(left: 16)
                ),
                StepperChildren(
                    title: const Text("On the way"),
                    subtitle: const Text(
                        "Our delivery executive is on the way to deliver your item"),
                    iconWidget: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: const Icon(Icons.looks_3, color: Colors.white),
                    ),
                    onTap: (){
                      if (kDebugMode) {
                        print('On the way!');
                      }
                    },
                    padding: EdgeInsets.only(left: 16)
                  ),
                StepperChildren(
                  title: const Text("Delivered",
                      style: TextStyle(
                        color: Colors.grey,
                      )),
                    onTap: (){
                      if (kDebugMode) {
                        print('Delivered!');
                      }
                    },
                    padding: EdgeInsets.only(left: 16)
                ),
              ],
              children: [
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      """Hi there, I'm a drop-in replacement for Flutter's ExpansionTile.

Use me any time you think your app could benefit from being just a bit more Material.

These buttons control the next card down!""",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardB.currentState?.expand();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.arrow_downward),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Open'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardB.currentState?.collapse();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardB.currentState?.toggleExpansion();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.swap_vert),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Toggle'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionStepperCard(
              key: cardB,
              expandedTextColor: Colors.red,
              leading: const CircleAvatar(child: Text('B')),
              title: const Text('Tap me!'),
              subtitle: const Text('I expand, too!'),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      """Hi there, I'm a drop-in replacement for Flutter's ExpansionTile.

Use me any time you think your app could benefit from being just a bit more Material.

These buttons control the card above!""",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.expand();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.arrow_downward),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Open'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.collapse();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.toggleExpansion();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.swap_vert),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Toggle'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

## How to Run

1. Clone the repository.

2. Open the project in a Flutter-compatible IDE (e.g., Visual Studio Code, Android Studio).

3. Run the application on an emulator or physical device.

## ExpansionStepperCard

The Flutter package described is designed to simplify the creation of customizable Horizontal and Vertical steppers in Flutter applications. It introduces an extension or enhancement of the standard ExpansionTile provided by the Flutter SDK, offering a visually elevated and customizable widget called ExpansionStepperCard. Inspired by the Google Material Theme, this package serves as a refined and raised alternative to the conventional ExpansionTile.

### Key features and characteristics of this package include:

#### Horizontal and Vertical Stepper Support:
    The package facilitates the effortless creation of both Horizontal and Vertical steppers. Developers can choose the orientation that best fits their application design.

#### ExpansionStepperCard Widget:
    The primary component introduced by the package is the ExpansionStepperCard widget.
    It serves as an elevated and visually enhanced alternative to Flutter's standard ExpansionTile.
    Developers can seamlessly replace ExpansionTile with ExpansionStepperCard to achieve a more polished and Material Theme-inspired appearance.

#### Customization:
    The ExpansionStepperCard widget is designed to be easily customizable, allowing developers to tailor the appearance to match their specific design requirements.
    Customization options may include adjusting colors, styles, and other visual aspects of the stepper.

#### Google Material Theme Inspired:
    The widget draws inspiration from the design principles of the Google Material Theme, ensuring a modern and cohesive look and feel within the Flutter application.

#### Drop-in Replacement for ExpansionTile:
    Developers can seamlessly integrate ExpansionStepperCard as a drop-in replacement for ExpansionTile in their existing codebase.
    This makes it convenient for Flutter developers familiar with ExpansionTile to adopt the enhanced features offered by ExpansionStepperCard without significant modifications.

#### Notes

* This demo is for educational purposes to showcase the usage of the ExpansionStepperCard widget.
* Explore the code to understand how to integrate and customize ExpansionStepperCard in your Flutter projects.
* Check the console output for debugging information when interacting with the cards.
