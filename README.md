<p align="center">
<img src="entry.gif" alt="entry" />
</p>

# Entry

Here is the pitch :

- Don't just display widgets : make them **appear**.
- Lightweight and flexible : **one** widget is all you need.
- Wrap a widget with an `Entry` widget, and watch the **magic** happen.

The `Entry` widget lets you simply animate a widget into a visible state.
The default constructor animates **opacity**, **scale** and **position**.
You can specify the **delay**, **duration** and **curve** of the animation.

`Entry` has three named constructors :

- `Entry.alpha()` : animates **opacity** only
- `Entry.scale()` : animates **scale** only
- `Entry.offset()` : animates **position** only



# What to know

- Works well with lists and grids
- 3 concurrent animations : **alpha**, **scale** and **offset**
- 3 named constructors for single animations
- You can set the **delay** and the **animation curve**
- On the default constructor, all parameters are exposed but optional

# Motivation

- Animations are key to elevate and refine the user experience.
- By default, all widgets appear instantly. It feels basic, almost webpage-like.
- Flutter doesn't provide a simple way to delay and animate a widget's entry into view.
- Animations overall implies a lot of complexity and extra boilerplate code.

# Credit

A special thank you to Felix Blaschke for his [simple_animations](https://pub.dev/packages/simple_animations) package, this package literally depends on it.
