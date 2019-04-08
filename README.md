# Hohmann Transfer delta-V calculator

The program utilises a set of physical principles behind orbit mechanics such as Hohmann Transfers formulas to calculate the delta V (ΔV) necessary to reach a planet. 
Given a satellite in a parking orbit around the Earth, 
a set of calculations can be made to figure out how much velocity has to change in order for the satellite to reach another planet’s sphere of influence (SOI) 
and enter into a circular orbit around it.

## Purpose

This project was made merely for the purpose of showing off the functionalities of different techniques
learned through my programming university module. It is, in its rawest form, a program that takes
destination as an user input and spews out a series of values calculated by applying physical principles
behind orbital mechanics as well as mathematics.

## Prerequisites

This program runs on MATLAB. You will need to have installed the MATLAB Compiler Runtime (MCR).
See the installation procedure for this at [Mathworks' website](https://uk.mathworks.com/products/compiler/matlab-runtime.html).

## Example

As previously mentioned, this program takes input from the user as to where the virtual satellite is directed.
Part of the input process takes place through MATLAB's GUI input. An example for a *Reconnaissance* satellite orbiting the planet *Venus* at a circular parking orbit of height *300 km*.

After using MATLAB's GUI menus for inputing satellite type and destination, it will ask for an orbit height, inputting as exampled:

```
What's the height of the parking orbit?
>> 300
```

It run the code separated into the different functions files present, and spew a result similar to this:

```
The destination of your Reconnaissance satellite will be Venus with an approximate weight of 450
It will have a deltaV of 6.80 km/s to fully perform the transfer to Venus.
Your satellite should arrive in 17-Aug-2019 07:01:31.
```

Followed by generic plot of a circular orbit for the mere purpose of proving plotting capabilities.


