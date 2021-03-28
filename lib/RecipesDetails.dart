import 'package:flutter/material.dart';

class RecipesDetails extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RecipesDetails> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return buildScaffold(context);
  }

  buildScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 33, 33),
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  buildBody() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "4.25",
                style: TextStyle(color: Colors.amber.shade200),
              ),
              Text(
                "(258)",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 260.0,
              width: 260.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                image: DecorationImage(
                  image: AssetImage("assets/mexica_potatoes.jpg"),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 5.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Recipe",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          Container(
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              color: Colors.amber.shade200,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                "45 MIN",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stepper(
                      controlsBuilder: (BuildContext context,
                          {VoidCallback onStepContinue,
                          VoidCallback onStepCancel}) {
                        return Row(
                          children: <Widget>[
                            Container(child: null
                                //  Icon(
                                //   Icons.arrow_back_ios,
                                //   color: Colors.white,
                                // ),
                                ),
                            Container(child: null
                                // Icon(
                                //   Icons.arrow_forward_ios,
                                //   color: Colors.white,
                                // ),
                                ),
                          ],
                        );
                      },
                      type: StepperType.vertical,
                      physics: ScrollPhysics(),
                      onStepTapped: (step) => tapped(step),
                      onStepContinue: continued,
                      onStepCancel: cancel,
                      currentStep: _currentStep,
                      steps: <Step>[
                        Step(
                          title: new Text(
                            'Step 1',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            children: <Widget>[
                              Text(
                                "Boil the potatoes for 5 mins. Meanwhile, heat the oil in a frying pan and gently fry the onion for 8 mins. Add the garlic and spices, then fry for 2 mins more.",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                ),
                              )
                            ],
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 0
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                        Step(
                          title: new Text(
                            'Step 2',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            children: <Widget>[
                              Text(
                                "Drain the potatoes and tip into the onion mix. Turn up the heat and shake the potatoes around so that they are all covered. Cook for 10 mins more until tender, then serve with soured cream, sprinkled with a little cayenne.",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                ),
                              )
                            ],
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 1
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 33, 33, 33),
      title: Text(
        "Mexican Potatoes",
        style: TextStyle(color: Colors.white),
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.apartment,
                color: Colors.white,
              ),
            )),
      ],
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
