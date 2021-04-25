<p align="center">
<img src="entry.gif" alt="entry" />
</p>

# Entry

This Flutter package introduces a new widget : `Entry`.

It lets you simply animate a widget into a visible state.

- Don't just display widgets : make them **appear**.
- Lightweight and flexible : **one** widget is all you need.
- Wrap a widget with an `Entry` widget and watch it come to **life**.

`Entry` animates **opacity**, **scale**, **position** and **angle** concurrently.

You can visualize the `Curves` constants on the  [doc page](https://api.flutter.dev/flutter/animation/Curves-class.html).

---

## 🏭 Constructors

### Default

`Entry({key, delay, duration, curve, opacity, scale, xOffset, yOffset, angle, child})`

This constructor is **not animated** by default.

It includes every parameter available in named constructors.


### Named

`Entry` has four named constructors :

- `Entry.all({opacity, scale, xOffset, yOffset, angle})`
- `Entry.opacity({opacity})`
- `Entry.scale({scale})`
- `Entry.offset({xOffset, yOffset})`

_The `key`, `delay`, `duration`, `curve` and `child` parameters are omitted here._

---

## ✨ Extra magic

### 💕 Combining entries

Wrapping an `Entry` with another one works just as you expect it.

By playing with all the parameters, possibilities are endless.

You can copy one of the examples and start from there.

### 👷 Grid builders

Using `Entry` with **grid** builders can create a **staggered** effect :

- Wrap the generated child with an `Entry` widget
- Multiply the `delay` value by the `index % crossAxisCount`

In result, the widgets of a same row will appear after each other.

You could aso add a random number to your delay (or duration) :

`delay: Duration(milliseconds: 100 + (random.nextInt(200)))`

This makes the entries more independent from each other.

---

# ✊ Motivation

- Animations are key to elevate and refine the user experience.
- By default, all widgets appear instantly. It feels basic, almost webpage-like.
- Flutter doesn't provide a simple way to delay and animate a widget's entry into view.
- Animations overall implies a lot of complexity and boilerplate code.
- I got tired of copying the same file over multiple projects.

---

# 🙏 Credit

A special thank you to Felix Blaschke for his [simple_animations](https://pub.dev/packages/simple_animations) package. This package literally depends on it.
