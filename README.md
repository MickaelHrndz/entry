
<p align="center" >
<img src="https://raw.githubusercontent.com/MickaelHrndz/entry/master/example/assets/entry.gif" alt="entry" />
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
  </a><br />
  <a href="https://pub.dev/packages/entry/score" target="_blank"><img src="https://img.shields.io/pub/likes/entry?logo=dart&label=likes"></a>
  <a href="https://pub.dev/packages/entry/score" target="_blank"><img src="https://img.shields.io/pub/popularity/entry?logo=dart&label=popularity"></a>
  <a href="https://pub.dev/packages/entry/score" target="_blank"><img src="https://img.shields.io/pub/points/entry?logo=dart&label=points"></a><br />
  <a href="https://www.codefactor.io/repository/github/mickaelhrndz/entry"><img src="https://www.codefactor.io/repository/github/mickaelhrndz/entry/badge" alt="CodeFactor" /></a>
  <a href="https://github.com/MickaelHrndz/entry/issues"><img src="https://img.shields.io/github/issues/mickaelhrndz/entry.svg" alt="CodeFactor" /></a>
  <a href="https://github.com/MickaelHrndz/entry" target="_blank"><img src="https://img.shields.io/github/stars/mickaelhrndz/entry"></a>
  <a href="https://pub.dev/packages/entry/license">
    <img src="https://img.shields.io/github/license/aagarwal1012/animated-text-kit?color=red"
      alt="License: MIT" />
  </a>
  <!--a href="https://github.com/Solido/awesome-flutter#animation">
    <img src="https://img.shields.io/badge/Awesome-Flutter-FC60A8?logo=awesome-lists"
      alt="Awesome Flutter" /-->
  </a>
</p></br>

This Flutter package introduces a new widget : `Entry`.

It lets you simply animate a widget into a visible state.

- Don't just display widgets : make them **appear** (and disappear).
- Lightweight and flexible : **one** widget is all you need.
- Wrap a widget with an `Entry.all` and watch it **come to life**.

`Entry` animates **opacity**, **scale**, **position** and **angle** concurrently.

You can visualize the `Curves` constants on its [ documentation page](https://api.flutter.dev/flutter/animation/Curves-class.html).

## 🏭 Constructors

### Default

`Entry({key, delay, duration, curve, visible, opacity, scale, xOffset, yOffset, angle, child})`

This constructor is **motionless** by default.

It includes every parameter available in named constructors.


### Named

`Entry` has **four** named constructors :

1. `Entry.all({visible, opacity, scale, xOffset, yOffset, angle})`

`.all` makes use of every animation by default, except for `angle` and `xOffset`.

The three others are each dedicated to a single animation :

2. `Entry.opacity({opacity})`
3. `Entry.scale({scale})`
4. `Entry.offset({xOffset, yOffset})`

_The `key`, `delay`, `duration`, `curve`, `visible` and `child` parameters are omitted here._

## 💕 Combining entries

Wrapping an `Entry` with another one works just as you expect it.

By playing with all the parameters, possibilities are endless.

You can copy one of the [examples](https://pub.dev/packages/entry/example) and start from there.

<details>
  <summary>See in action</summary>
    <p align="center" >
        <img src="https://raw.githubusercontent.com/MickaelHrndz/entry/master/example/assets/combined.gif" alt="entry" />
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
        <img src="https://raw.githubusercontent.com/MickaelHrndz/entry/master/example/assets/staggered.gif" alt="entry" />
    </p>
</details>

### Randomization

You can set your delay and/or duration to a random number :

`delay: Duration(milliseconds: random.nextInt(300))`

This makes the entries look more independent from each other.

<details>
  <summary>See in action</summary>
    <p align="center" >
        <img src="https://raw.githubusercontent.com/MickaelHrndz/entry/master/example/assets/randomized.gif" alt="entry" />
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
