# Kinetic Model #

This program models elastic collisions among spherical particles and the walls
of a container.  `KineticModel` uses the conservation of momentum [p = m·v] and
kinetic energy [KE = ½·m·v2] to determine the velocity of particles after a
collision.  To simplify calculations, position and velocity are stored in
2-dimensional vectors as described below.

## Design ##

The design of `KineticModel` is an example of the `Model-View-Controller`
pattern.  The main class, `KineticModel`, creates an instance of the model,
which is an `Ensemble` of `Particle`.  It then creates the main view of that
model, a `DisplayPanel`.  A separate `ControlPanel` allows setting the
simulation's parameters.  The `Vector` class stores 2-dimensional vector data
and provides elementary vector operations.  Finally, a `Histogram` gives a
continuously updated view of the Particles' velocities.

## Implementation ##

This implementation requires Java 1.5 or later.  The animation loop is driven
by a `javax.swing.Timer` instance in the controller.  After an initial delay,
the `Timer` fires at a nominal rate of 25 Hz, invoking the controller's
`actionPerformed()` method.  The latter repaints the main view, a histogram of
particle velocities, and several informational labels.  Three animation
techniques are used: texture-paint, erase-draw, and label-icon.

In texture-paint animation, an instance of `TexturePaint` is created with a
small `BufferedImage`.  At each iteration, the image's raw pixels are randomly
re-colored, and the `TexturePaint` is used to frame the view.  Because the
underlying image is small and used repeatedly for filling, the animation
overhead is small.

The erase-draw method simply erases the entire panel to black, moves each
particle to it's next position and re-draws the particle.  The `Particle` may
be filled with `Color` or drawn from a `GradientImage` The model's `iterate()`
method handles collisions.  Because the `JPanel` itself is double-buffered, the
animation remains smooth.

Finally, the velocity histogram is repainted.  The `Histogram` class simply
extends `JLabel` and implements the icon interface, becoming its own icon.

## References ##

- [Spatial Vectors](https://en.wikipedia.org/wiki/Euclidean_vector)

- [2-Dimensional Elastic Collisions](https://www.vobarian.com/collisions/)

- [Predictive Collision Detection](https://www.a-coding.com/2010/10/predictive-collision-detection.html)

- [Kinetic Theory](https://en.wikipedia.org/wiki/Kinetic_theory)

## Course material ##

- Dr. David R. Gibson, Valdosta State University.

- CS 4322 – Project 1

- CS 4322 – Project 3

## Revision history ##

* 1.2.0 15-Oct-2008 Use `RadialGradientPaint`.

* 1.1.0 01-Sep-2008 Initial release.

* 1.0.67 15-Jul-2008 Initial Java version.

`KineticModel` is an open-source project, distributed under the terms of the
LGPL, version 3.

Copyright: ©2008, John B. Matthews.

Last updated 17-Oct-2008
