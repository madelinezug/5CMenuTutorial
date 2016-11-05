# 5CMenuTutorial
5C Hackweek Fall 2016 Intro to iOS Development

Welcome to hackweek! In this workshop we'll be making a 5C menu app. 

---

We'll walk you through how to make the app step-by-step but this doc has some of the steps written out for reference.

##Getting Started

Open XCode and create a new Single View application.

	-We'll be working with Storyboards to build our app. Select your Main.storyboard file in the lefthand menu and you'll see our main ViewController!


We'll be getting dining hall menu data from the [ASPC Menu API](https://aspc.pomona.edu/api/)

and we'll parse it with help from [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON). This is a library.

[More instructions on how this works here](https://devdactic.com/parse-json-with-swift/)

##Installing Cocoapods

Before we continue let's install [cocoapods.] (https://cocoapods.org)

Open terminal and run:

```
$ sudo gem install cocoapods
```

If that doesn't work (especially if you are running El Capitan) try:

```
$ sudo gem install -n /usr/local/bin cocoapods
```

This will allow us to use libraries that will make our lives easier! 

Next we'll make sure pods are set up by running: 

```
$ pod setup --verbose
```

You should get a bunch of output that ends in Setup completed. We'll help you troubleshoot if things get crazy.

Next we want to create a Podfile for our project. A Podfile tells our app what libraries we have added so we can use them in our code. In our case we'll be adding the SwiftyJSON library to help us organize and use the data we get from ASPC's menu API. Libraries save us time by letting us use other people's open source code. 

We want to make our Podfile in the same folder as our app so navigate to that folder in Terminal. Once you're there run:

```
$ pod init
```

This creates the Podfile. To open it in XCode run:

```
$ open -a Xcode Podfile
```

To add the SwiftyJSON library we need to add the following to our Podfile. Replace "5CMenuTutorial" with the name of your app.

```
  target '5CMenuTutorial' do
    pod 'SwiftyJSON'
  end
```

##Continuing to build our app!

###Configuring our Storyboard

Back to our storyboard. We want to use a specific subclass of ViewController called TableViewController so we can display a table of the 7 dining hall options. 

Delete the automatic ViewController Xcode created for us, including the corresponding file.

Search for a TableViewController in the bottom right menu and drag it into our storyboard.

Now that we have our TableViewController we want to embed it in a NavigationController.This will allow us to navigate between multiple screens and will set up nice things like a back button.

To do this, select your TableViewController. Next select Editor->Embed in->Navigation Controller from the top menu bars.

Now we have a navigation controller and a TableViewController.

Add a second TableViewController.

Connect the two with a segue from the tableViewCell of the first TableViewController to the second TableViewController.

###Adding files

Add corresponding files








