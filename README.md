# [Prototype] CFC Performance Enhancements
A collection of clientside and serverside otpimizations that aim to increase performance while removing little or no functionality

## Dependencies
CFC Waiter: https://github.com/CFC-Servers/cfc_waiter

## Installation
Just pop it in yer addons folder!

## Usage
While in game, clients can type `!perfon` to enable performance enhancements

## Notes
These enhancments _do_ increase performance, but the issue is that the clients won't get even half of the enhancements.
This is because to enable some perofrmance flags (i.e. multithreading options) through the client's console (using `RunConsoleCommand`) doesn't actually save the value, and it also doesn't take effect immediately.

The only way to get these options to the client is to have them manually put them in a startup config, unfortunately.
The rest of the things (i.e. removing a bunch of useless hooks that just take up computation time) **do** work immediately, but their impact is minimal.

So, this addon doesn't actually work as intended, but maybe you can still get some use out of it :)
