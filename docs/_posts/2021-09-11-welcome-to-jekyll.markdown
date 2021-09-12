---
layout: post
title:  "Modular LaTeX Resume"
date:   2021-09-11 22:05:31 -0400
categories: professional
---
The first blog post will discuss a recent mini-project I completed - transforming my resume into a modular resume, in which the design and content were separated as is best practice.

This project required creating four files:
- .cls class file
- .yml content file
- .tex design template file
- makefile

By properly defining the desired layout of the resume in the LaTeX template and cls class files, the user can define what content they want in their resume in the YAML file and then run the makefile to update their resume. 

This has two key benefits benefits:
- The content created will still be a nicely formatted PDF from LaTeX, which gives the creator more control over every aspect of the document and provides consistent and crisp results.
- It is very simple to add or remove parts to the resume, just add or remove content from the YAML file without having to adjust the LaTeX each time.
