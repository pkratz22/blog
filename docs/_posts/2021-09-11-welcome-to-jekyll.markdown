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

```
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv-class}[2021/09/07 My custom CV class]

% Base class on article
\LoadClass{article}

% So can customize section headings
\RequirePackage{titlesec}

% For columns to align top
%\usepackage{adjustbox}
% use: \adjustbox{valign=t}{\begin{minipage}[t]{0.2\textwidth} \end{minipage}}%

% Sets margins
\RequirePackage{geometry}
\geometry{
    paper=letterpaper,  % paper : letterpaper (US) or a4paper (uk)
    left      = 1in,        % Inner margin % 1in is standard
    right     = 1in,          % Outer margin % 1in is standard
    top       = 1in,         % Top margin % 1in is standard
    bottom    = 1in,         % Bottom margin %1in is standard
    marginpar = 0in,
 %   bindingoffset=.5cm, % Binding offset
 %   showframe,          % Uncomment to show how the type block is set on the page
}

\newcommand*{\trim}[1]{
  \trim@spaces@noexp{#1}
}

% Name
\newcommand{\name}[1]{
  \centerline{\Large{#1}}
}

% Contact
\newcommand{\contact}[2]{
\centerline{
    #1 $\mid$ #2
    }
}

% Education
\newcommand{\education}[8]{
\noindent\textbf{#1} $\hfill$ #2 \break
\textit{#3} $\hfill$ GPA: #4 $\hfill$ Honors: \textit{#5} $\hfill$ #6 \break
Majors: #7 $\mid$ Minor: #8 \hfill
}

% Skills
\newcommand{\skills}[4]{
  \noindent{\textbf{#1: }#2, #3, #4}\hfill\break
}

% Custom section
\titleformat{\section}         % Customise the \section command
  {\bfseries\scshape\raggedright} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading

\titlespacing{\section}{0em}{0em}{2pt} % left spacing, before spacing, after spacing

```