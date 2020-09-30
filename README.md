MWM - Test App
================================
The purpose of this project was to replicate a music one view application in order to show my skill in iOS Swift for the MWM company. The app had one API call and one tabBar with 4 items on it (but only one was supposed to be developped). The tabBar item called "Chords" displayed a view with two collection view (or carousel) that the user could interact with in order to change a label.

The rules:
- 3 hours to develop and submit the app
- no external libraries
- if the project isnt finished on time, it is appreciated to finish it afterwards and send a second version of it

The target of this app is iOS 12.0 and above, and it is made for iPhones & iPad on portrait.

* [ScreenShots](#markdown-header-block-screenshots)
* [Architecture](#markdown-header-architecture)
* [Librairies](#markdown-header-librairies)
* [In the future](#markdown-header-in-the-future)
* [Download and Install](#markdown-header-download-and-install)

# ScreenShots

Here you will find screenshots of the application:

![Alt text](https://i.ibb.co/72NmRHM/Chords.png)

	Chords View - This is where you arrived after launching the app - Up are Keys, Down are Chords

![Alt text](https://i.ibb.co/t8snQCv/Work-in-progress.png)

	Other Views - The three other tab bar look like this since it was due

![Alt text](https://i.ibb.co/LN7DHpM/Network-Error.png)

	Network Error - In case the API call doesn't work

# Architecture

This project follows the Clean Swift architecture where all the components (View, VC, Interactor, Presenter, Worker, Model, Router) are separated to give them precise roles. This does not only clarify the codes making it less compact, but it also makes it more understandable & easier to make unit tests for since the business logic is only supposed to be in the interactor.

This app has been developped in Swift5 and I have been using git flow to push each feature.

For the UI, I've been using the auto-layout system, making it adaptable for all iPhone/iPad sizes.

# Librairies

No librairies have been used do to the rules of the test.

# In the future

Since this is a demo project, it can sure be improved in many ways.

I could improve the application by:

- making the collectionViews to grow/strink and change opacity while scrolling
- localize the app

But I could also improve the code by:

- adding swiftGen to securise the use of localizables, colors & fonts
- adding conventions for the code like swiftlint for swift

# Download and Install

To download the project, use either "git clone" or download in .zip file.

Once downloaded, you'll have to run "pod install" command within the project. This has been made because, even though there is no librairy yet, it doesn't mean there will never be in the future.
