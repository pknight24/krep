<h2>krep</h2>

A very simple command line parsing tool.

<h2>Installation</h2>

Clone the repository with 

>git clone

You can compile krep.hs with

>ghc --make krep.hs

and then move the binary to your appropriate /bin/ folder.

<h2>Usage</h2>

krep reads from stdin, which means that the best way to use it is with pipes.

Example:

>ls | krep hello

This will return any item in your current directory that contains the word "hello" in its title.
