# Kanban

This page serves to track upcoming and past work and should help me stay
organized and on the right path. Let's take these tasks one by one. Using a
generated book is not a great option for Kanban, but hey, why not.

Each groomed card should contain information about motivation and the final
product. Backlog should be ordered by priority and cards on the top should be
sufficiently groomed.

* [In Progress](#in-progress)
* [Backlog](#backlog)
* [Done](#done)

## In Progress

> **Learn general Rust**
>
> * *Topic: Rust*
> * *Started: 2020-07-05*
>
> I chose to use Rust for embedded programming. It does not have that many
> resources as C, but hey, it is fun. As the result of this effort, I should
> list the resources I've used in the Rust section.
>
> I was playing with Rust couple of years back, but since then, the language
> changed quite a bit and I forgot most of it anyway. In order to re-learn Rust,
> I am using [The Book](https://doc.rust-lang.org/book/).
>
> As a part of this effort, I will post an introduction article about Rust.

> **Implement "Box" library without heap**
>
> * *Topic: Rust*
> * *Started: 2020-07-22*
>
> Using stack only has benefits of predictable memory usage, possibility to
> dedicate certain amount of memory to each section of your application and it
> also sounds fun. When it comes to microcontrollers, dynamic memory allocation
> needs to be brought by a package specific to given processor and that makes
> the code less portable. So I'm refusing to work with heap in this project.
> However, sometimes it would be really handy to have dynamic address allocation
> available. I know I will need a graph library and I know I will never have
> enough memory to spare for adjacency matrix. For that reason, I will implement
> something resembling the Box object, but on stack.
>
> As part of this effort, I will publish following:
> * An article in the Rust section about this library.
> * [Page](project-heapnotize.html) dedicated to this project.
> * This new library in [version 1.0](https://github.com/zlosynth/heapnotize).

## Backlog

> **Implement #![no_std] graph library**
>
> *Topic: Rust*
>
> In order to exercise learned Rust and have some fun, I want to write a library
> for graph representation and operations with no_std (aka, without heap). This
> should be later useful for calculation of sound moudles patching on a
> microprocessor.

> **Learn music theory and basics of DSP from [Musimathics](http://www.musimathics.com/)**
>
> *Topic: Audio Signal Processing*

> **Implement wave generator module**
>
> *Topic: Audio Signal Processing*

> **Implement system audio output module**
>
> *Topic: Audio Signal Processing*

> **Implement low-pass filter module**
>
> *Topic: Audio Signal Processing*

> **Implement distortion module**
>
> *Topic: Audio Signal Processing*

> **Implement mixer module**
>
> *Topic: Audio Signal Processing*

> **Implement patching module**
>
> *Topic: Audio Signal Processing*

> **Implement Max-like UI for the sound library**
>
> *Topic: Rust*
>
> Before I dive into embedded and start designing a box, it would make sense to
> first try the concept virtually. Let's implement simple Max-like (or Pd-like)
> UI to control and patch noise sources.
> [Condor](https://github.com/PistonDevelopers/conrod) seems to be a good
> library to draw such a free-form UI.

> **Buy STM32 Discovery board**
>
> *Topic: Microcontrollers*

> **Learn embedded Rust**
>
> *Topic: Rust, Microcontrollers*

> **Write an article about STM32 Discovery with Rust on Linux**
>
> *Topic: Microcontrollers*

> **Implement basic LED control on STM32**
>
> *Topic: Microcontrollers*

> **Learn how to use [RTFM](https://docs.rs/cortex-m-rtfm/0.5.3/rtfm/) on STM32**
>
> *Topic: Microcontrollers*

> **Implement mass RGB LED control on STM32 with SIPO**
>
> *Topic: Microcontrollers*

> **Implement mass RGB LED control with intensity on STM32 with SIPO**
>
> *Topic: Microcontrollers*

> **Implement reading of a button on STM32**
>
> *Topic: Microcontrollers*

> **Implement reading of a switch on STM32**
>
> *Topic: Microcontrollers*

> **Implement reading of a potentiometer on STM32**
>
> *Topic: Microcontrollers*

> **Implement reading of multiple inputs on STM32 through PISO**
>
> *Topic: Microcontrollers*
>
> Create a model of these components in code. Map them to PISO and get always
> up-to-date picture of what is going on on the board.

> **Implement audio output on STM32 with I2C**
>
> *Topic: Microcontrollers*
>
> Maybe spend some time with basic PWM and DAC. But going right for I2C may be
> a better investment.

> **Implement audio input on STM32 with I2C**
>
> *Topic: Microcontrollers*

## Done