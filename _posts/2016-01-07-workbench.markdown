---
layout: post
title: "workbench: managing a bunch of git repositories"
date: 2016-01-07 16:00:00
tags: bash vim tmux git github
---

Lately, I found myself actively working in several git repositories on a daily basis. Sometimes, coordinating changes across multiple code bases. Yes, I'm looking at you, [microservices][microservices]. On top of that, very often I would start something at the office and continue at home, or vice-versa. As you can imagine, very often I would also forget to push some of my local changes.

In the Java world, I'm glad to let Intellij take care of everything. But for other languages, e.g. Bash, Ruby, JavaScript, Erlang - pretty much everything else but Java - I became very found of the tmux + vim combo.

I started to put together a few bash scripts to help me manage the repositories on my Github account. The result is what I call `workbench`.

So far, it lets you list all the repositories your Github account has access, clone them, check the status of the ones present locally, and open a tmux window using a predefined layout.

{% highlight bash %}
$ workbench ls # or just workbench
j8spec/j8spec
tprado/dot-files
tprado/tprado
tprado/vim-config
...
{% endhighlight %}

You can clone one of them (auto-completion FTW):

{% highlight bash %}
$ workbench clone tprado/
tprado/dot-files    tprado/tprado
$ workbench clone tprado/dot-files
Cloning into '/home/tprado/workbench/tprado/dot-files'...
...
Checking connectivity... done.
{% endhighlight %}

And finally, you can start working on it in a new tmux window:

{% highlight bash %}
$ workbench tmux tprado/dot-files
{% endhighlight %}

This requires a tmux session to be active. By default, it will create a new tmux window, split it, open vim on the left pane, and a shell on the right. Note the name of the window at the status bar.

![default tmux layout](/assets/workbench-tmux-default-layout.png)

After some changes, let's check the status of all local repositories:

![status](/assets/workbench-status.png)

Repositories that have local changes are highlighted in red.

## project specific setup

### tmux layout

Besides Vim, it is very common to open some sort of REPL session when you are working on a project, like pry, guard, erl, whatever. You can tell `workbench` how many panes you want a particular project to have and what to execute in each of them. For example, let's say we have a jekyll project and we want vim, jekyll server, and a shell every time we do `workbench tmux`. All you need to do is create a CSV file called `tmux_layout.csv` under the `.workbench` directory.

{% highlight bash %}
$ cat .workbench/tmux_layout.csv
h,45,jekyll server --watch
v,50,
{% endhighlight %}

Each line is a new split in the previous pane, indicating the orientation (h - horizontal or v - vertical), the size of the new pane (in percentage), and the command to be executed in the new pane. In this example, the first line splits the "editor" pane and executes `jekyll server --watch` in the new pane; and the second line splits the "jekyll" pane. When no command is specified, the new pane opens a shell session.

![custom tmux](/assets/workbench-tmux-custom.png)

### tmux pane init

Also, it is possible to tell `workbench` to run a script on each pane.

[microservices]:    http://martinfowler.com/articles/microservices.html
[workbench-source]: https://github.com/tprado/workbench
[abs]:              http://tldp.org/LDP/abs/html
[github-api]:       https://developer.github.com/v3
