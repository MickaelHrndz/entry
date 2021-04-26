
<p align="center" >
<img src="https://raw.githubusercontent.com/MickaelHrndz/entry/master/entry.gif" alt="entry" />
</p>

<h1 align="center">Entry</h1>

<p align="center">
  <a href="https://pub.dev/packages/entry">
    <img src="https://img.shields.io/pub/v/entry.svg"
      alt="Pub Package" />
  </a>
  <a href="https://flutter.dev">
    <img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter"
      alt="Platform" />
  </a>
  <a href="https://pub.dev/packages/effective_dart">
    <img src="https://img.shields.io/badge/style-effective_dart-40c4ff.svg"
      alt="style: effective dart" />
  </a>
  <!--br />
  <a href="https://pub.green/packages/entry#channel-stable">
    <img src="https://img.shields.io/endpoint?url=https://pub.green/packages/entry/badge?channel=stable&style=flat"
      alt="Latest compatibility result for Stable channel" />
  </a>
  <a href="https://pub.green/packages/entry#channel-beta">
    <img src="https://img.shields.io/endpoint?url=https://pub.green/packages/entry/badge?channel=beta&style=flat"
      alt="Latest compatibility result for Beta channel" />
  </a>
  <a href="https://pub.green/packages/entry#channel-dev">
    <img src="https://img.shields.io/endpoint?url=https://pub.green/packages/entry/badge?channel=dev&style=flat"
      alt="Latest compatibility result for Dev channel" />
  </a><br /-->
  <!--a href="https://codecov.io/gh/aagarwal1012/Animated-Text-Kit">
    <img src="https://codecov.io/gh/aagarwal1012/Animated-Text-Kit/branch/master/graph/badge.svg"
      alt="Codecov Coverage" />
  </a>
  <a href="https://www.codefactor.io/repository/github/aagarwal1012/animated-text-kit">
    <img src="https://www.codefactor.io/repository/github/aagarwal1012/animated-text-kit/badge"
      alt="CodeFactor" />
  </a-->
  <a href="https://pub.dev/packages/entry/license">
    <img src="https://img.shields.io/github/license/aagarwal1012/animated-text-kit?color=red"
      alt="License: MIT" />
  </a>
  <!--a href="https://github.com/Solido/awesome-flutter#animation">
    <img src="https://img.shields.io/badge/Awesome-Flutter-FC60A8?logo=awesome-lists"
      alt="Awesome Flutter" /-->
  </a>
  <a href="https://www.paypal.me/MickaelHrndz">
    <img src="https://img.shields.io/badge/Donate-PayPal-00457C?logo=paypal"
      alt="Donate" />
  </a>
</p></br>

This Flutter package introduces a new widget : `Entry`.

It lets you simply animate a widget into a visible state.

- Don't just display widgets : make them **appear**.
- Lightweight and flexible : **one** widget is all you need.
- Wrap a widget with an `Entry` widget and watch it come to **life**.

`Entry` animates **opacity**, **scale**, **position** and **angle** concurrently.

You can visualize the `Curves` constants on the  [doc page](https://api.flutter.dev/flutter/animation/Curves-class.html).

## 🏭 Constructors

### Default

`Entry({key, delay, duration, curve, opacity, scale, xOffset, yOffset, angle, child})`

This constructor is **motionless** by default.

It includes every parameter available in named constructors.


### Named

`Entry` has four named constructors :

- `Entry.all({opacity, scale, xOffset, yOffset, angle})`

`.all` makes use of every animation by default, except for the angle.

The three others are each dedicated to a single animation :

- `Entry.opacity({opacity})`
- `Entry.scale({scale})`
- `Entry.offset({xOffset, yOffset})`

_The `key`, `delay`, `duration`, `curve` and `child` parameters are omitted here._

## 💕 Combining entries

Wrapping an `Entry` with another one works just as you expect it.

By playing with all the parameters, possibilities are endless.

You can copy one of the [examples](https://pub.dev/packages/entry/example) and start from there.

<details>
  <summary>See in action</summary>
    <p align="center" >
        <img src="https://raw.githubusercontent.com/MickaelHrndz/entry/master/combined.gif" alt="entry" />
    </p>
</details>

## 👷 Grid builders

### Fixed crossed-axis count

Using `Entry` with **grid** builders can create a **staggered** effect :

- Wrap the generated child with an `Entry` widget
- Multiply the `delay` value by the `index % crossAxisCount`

In result, the widgets of a same row will appear after each other.

<details>
  <summary>See in action</summary>
    <p align="center" >
        <img src="https://raw.githubusercontent.com/MickaelHrndz/entry/master/staggered.gif" alt="entry" />
    </p>
</details>

### Randomization

You can set your delay and/or duration to a random number :

`delay: Duration(milliseconds: random.nextInt(300))`

This makes the entries look more independent from each other.

<details>
  <summary>See in action</summary>
    <p align="center" >
        <img src="https://raw.githubusercontent.com/MickaelHrndz/entry/master/randomized.gif" alt="entry" />
    </p>
</details>

# ✊ Motivation

- Animations are key to elevate and refine the user experience.
- By default, all widgets appear instantly. It feels basic, almost webpage-like.
- Flutter doesn't provide a simple way to delay and animate a widget's entry into view.
- Animations overall implies a lot of complexity and boilerplate code.
- I got tired of copying the same file over multiple projects.

# 🙏 Credit

A special thank you to Felix Blaschke for his [simple_animations](https://pub.dev/packages/simple_animations) package. This package literally depends on it.
