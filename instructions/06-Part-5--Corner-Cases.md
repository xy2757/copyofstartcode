# Part 5: Corner Cases

---------------

By now you should be familiar with the cycle:

1.  Pick a new scenario to work on (you should have 2/4 working at this point)
2.  Run the scenario and watch it fail
3.  Develop code that makes each step of the scenario pass
4.  Repeat till all steps passing.

Use this process to develop the code for the remaining actions `win` and `lose`.  You will need to add code to the `show` action that checks whether the game state it is about to show is actually a winning or losing state, and if so, it should redirect to the appropriate `win` or `lose` action.  Recall that your game logic model has a method for testing if the current game state is win, lose, or keep playing. The scenario `game_over.feature` tests these behaviors in your SaaS app.

Deploy to Render and make sure everything still works.  Give yourself a break and play a few rounds of your new word guessing game!

While you're playing, what happens if you directly add `/win` to the end of your app's URL?  Make sure the player cannot cheat by simply visiting `GET /win`.  Consider how to modify the actions for `win`, `lose`, and `show` to prevent this behavior.

---

[← Part 4: Introducing Cucumber](05-Part-4--Introducing-Cucumber.md) | [Contents](README.md) | [Submission →](07-Submission.md)
