MWM - Test App
================================
This app is... --- PURPOSE ---

I had 3 hours to develop and submit this app, that is going to be reviewed for my application at MWM company.

The target of this app is iOS 9.0 and above, and it is made for iPhones only.

* [ScreenShots](#markdown-header-block-screenshots)
* [Architecture](#markdown-header-architecture)
* [Librairies](#markdown-header-librairies)
* [In the future](#markdown-header-in-the-future)

# ScreenShots

Here you will find screenshots of the application:

![Alt text](https://i.ibb.co/X5FkJqJ/Screenshot-2020-09-08-at-22-34-50.png)

	Home View - This is where you arrived after launching the app

# Architecture

This project follows the Clean Swift architecture where all the components (View, VC, Interactor, Presenter, Worker, Model, Router) are separated to give them precise roles. This does not only clarify the codes making it less compact, but it also makes it more understandable & easier to make unit tests for since the business logic is only supposed to be in the interactor.

This app has been developped in Swift5 and I have been using git flow to push each feature.

For the UI, I've been using the auto-layout system, making it adaptable for all iPhone sizes.

The application is fully translated in French & in English with the localizable Xcode system.

# Librairies

I used few librairies to help me with colors (lib: Colours) & with alertviews (lib: FCAlertView).

I also used one to fill up the models after an API calls that works like Codable in swift (lib: Mantle), even there are no API calls within the app.

# In the future

Since this is a demo project, it can sure be improved in many ways.

We can improve the application by:

- ..
- ..
- ..

But we can also improve the code by:

- adding swiftGen to securise the use of localizables, colors & fonts
- adding conventions for the code like swiftlint for swift
- etc..
