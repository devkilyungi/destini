import 'package:flutter/material.dart';
import 'story_brain.dart';

StoryBrain storyBrain = StoryBrain();

void main() => runApp(const Destini());

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destini'),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        constraints: const BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 12,
              child: Center(
                child: Text(
                  storyBrain.getStory(),
                  style: const TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    //Choice 1 made by user.
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  child: Text(
                    storyBrain.getChoice1(),
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                )),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      //Choice 2 made by user.
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    child: Text(
                      storyBrain.getChoice2(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
