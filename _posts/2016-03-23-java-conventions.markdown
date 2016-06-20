---
layout: post
title:  "Revisiting Java Conventions"
date:   2016-03-23 18:00:00
categories: java
---

When I'm trying a new tool or language, I also try to learn the conventions around it.

With Java is different. Java is my "day job", so I'm familiar with the conventions. When I start a pet project in Java, I try to use "unconventional" stuff.

This text is about some of those "unconventional" things that I came across and, I think, turned out to be better.

# JUnit test method names

Methods in Java are camel-case, which is fine. The thing that always bother me was using the same convention for JUnit test methods:

```
@Test
public void shouldDoSomethingWhenAGivenConditionIsTrueButSomeOtherConditionIsFalse() {
  ...
}
```

So, instead I decided to write it like this:

```
@Test
public void should_do_something_when_a_given_condition_is_true_but_some_other_condition_is_false() {
  ...
}
```

There are 2 things that make JUnit methods fundamentally different from regular methods:
1. you don't call them directly
2. since they lack context, they require more description


- package names
- default access modifier
- inner classes
- exceptions


[j8spec]:       http://j8spec.github.io
[rspec]:        http://rspec.info
[jasmine]:      http://jasmine.github.io
[junit]:        http://junit.org
