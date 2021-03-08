# TrialExercisesApp

If I had more time:

- I would like to add unit tests for the viewModels
- The SearchMoreTeams/Players function I would have liked to have as one function that handles both requests by switches. However in this case it felt that by making simple one made it slightly more complicated, so I stuck with the fastest and simplest option. 
- Behaviour that needs fixing; If after pressing More Players/Teams button it comes back with exactly 10 more and that’s it, the button won’t hide when pressed again.
- I would have loved to move core data handling out of the views and into the viewModels, however, I am not keen on “shoehorning” something that’s not designed to be there. In this case, by making a solution more complicated in order to fit a certain pattern, you would run the risk of introducing potential bugs. As it is now, it feels quite “safe”. I’m sure one can work around it in order to make it even more safe and more testable. 
- Make only the star button in the MainView tappable and not the whole cell as it is currently.
- Make sure you can only have one unique favourite player in the db. Currently you can add multiple entries of the same player.
