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

The class file handles the following:
- (Some of the) Required packages
- Defined paper dimensions - used standard letterpaper with 1 inch margins since I am based in the US
- Defined formatting for name and contact information
- Defined formatting for education fields
- Defined formatting for skills section
- Defined formatting of section titles

```
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv-class}[2021/09/07 My custom CV class]

% Base class on article
\LoadClass{article}

% So can customize section headings
\RequirePackage{titlesec}

% Sets margins
\RequirePackage{geometry}
\geometry{
    paper=letterpaper,  % paper : letterpaper (US) or a4paper (uk)
    left      = 1in,        % Inner margin % 1in is standard
    right     = 1in,          % Outer margin % 1in is standard
    top       = 1in,         % Top margin % 1in is standard
    bottom    = 1in,         % Bottom margin %1in is standard
    marginpar = 0in,
 %   showframe,          % Uncomment to show how the type block is set on the page
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

The LaTeX file handles the following:
- (Some of the) Required Packages
- Defining the formatting for each area of the resume, which in my case is:
	- Contact information
	- Work experience
	- Internships
	- Competitions / Projects
	- Leadership / Activities
	- Education
	- Skills

```
\documentclass[11pt]{cv-class}

\usepackage[utf8]{inputenc}
\usepackage{times}
\usepackage{enumitem}
\usepackage{microtype}

\begin{document}

\pagenumbering{gobble}

% *****************************************
% Contact
% *****************************************
\name{$contact.name$}
\contact{$contact.email$}{$contact.phone$}

% *****************************************
% WORK EXPERIENCE
% *****************************************
\section{Work Experience}
$for(work)$
    \noindent\textbf{$work.company$}\hfill{$work.city$}\break\textit{$work.title$}\hfill{$work.years$}
    \begin{itemize}[noitemsep,nolistsep,leftmargin=*]
        $if(work.achievement1)$ \item \raggedright{$work.achievement1$} $endif$
        $if(work.achievement2)$ \item \raggedright{$work.achievement2$} $endif$
        $if(work.achievement3)$ \item \raggedright{$work.achievement3$} $endif$
        $if(work.achievement4)$ \item \raggedright{$work.achievement4$} $endif$
        $if(work.achievement5)$ \item \raggedright{$work.achievement5$} $endif$
    \end{itemize}
    \bigskip
$endfor$

% *****************************************
% INTERNSHIPS
% *****************************************
\section{Internships}
$for(internship)$
    \noindent\textbf{$internship.company$}\hfill{$internship.city$}\break\textit{$internship.title$}\hfill{$internship.years$}
    \begin{itemize}[noitemsep,nolistsep,leftmargin=*]
        $if(internship.achievement1)$ \item \raggedright{$internship.achievement1$} $endif$
        $if(internship.achievement2)$ \item \raggedright{$internship.achievement2$} $endif$
        $if(internship.achievement3)$ \item \raggedright{$internship.achievement3$} $endif$
        $if(internship.achievement4)$ \item \raggedright{$internship.achievement4$} $endif$
        $if(internship.achievement5)$ \item \raggedright{$internship.achievement5$} $endif$
    \end{itemize}
    \bigskip
$endfor$

% *****************************************
% COMPETITIONS / PROJECTS
% *****************************************
\section{Competitions / Projects}
$for(project)$
    \noindent\textbf{$project.title$ $if(project.descriptor)$ \unskip, \textit{$project.descriptor$} $endif$}\quad \textit{$project.location$} \hfill {$project.years$}
    \begin{itemize}[noitemsep,nolistsep,leftmargin=*]
        $if(project.achievement1)$ \item \raggedright{$project.achievement1$} $endif$
        $if(project.achievement2)$ \item \raggedright{$project.achievement2$} $endif$
        $if(project.achievement3)$ \item \raggedright{$project.achievement3$} $endif$
        $if(project.achievement4)$ \item \raggedright{$project.achievement4$} $endif$
        $if(project.achievement5)$ \item \raggedright{$project.achievement5$} $endif$
    \end{itemize}
    \bigskip
$endfor$

% *****************************************
% LEADERSHIP / ACTIVITIES
% *****************************************
\section{Leadership / Activities}
$for(activity)$
    \noindent\textbf{$activity.group$} \hfill {$activity.location$}\break\textit{$activity.title$} \hfill {$activity.years$}
    \begin{itemize}[noitemsep,nolistsep,leftmargin=*]
        $if(activity.achievement1)$ \item \raggedright{$activity.achievement1$} $endif$
        $if(activity.achievement2)$ \item \raggedright{$activity.achievement2$} $endif$
        $if(activity.achievement3)$ \item \raggedright{$activity.achievement3$} $endif$
        $if(activity.achievement4)$ \item \raggedright{$activity.achievement4$} $endif$
        $if(activity.achievement5)$ \item \raggedright{$activity.achievement5$} $endif$
    \end{itemize}
    \bigskip
$endfor$

% *****************************************
% EDUCATION
% *****************************************
\section{Education}
$for(education)$
    \education{$education.university$}{$education.city$}{$education.degree$}{$education.GPA$}{$education.honors$}{$education.year$}{$education.majors$}{$education.minors$}
    \bigskip
$endfor$

% *****************************************
% SKILLS
% *****************************************
\section{Skills}
$for(skills)$
    \noindent\textbf{$skills.type$: }$if(skills.skill1)$ \unskip{$skills.skill1$} $endif$ $if(skills.skill2)$ \unskip, {$skills.skill2$} $endif$ $if(skills.skill3)$ \unskip, {$skills.skill3$}$endif$\hfill\par
$endfor$

\end{document}

```

The makefile looks as follows:

```
#----------------------
# CONSTANTS
#----------------------
TEMPLATE=cv-template
PROJECT=Peter_Kratz_Resume
YAML=cv-data
TEX=pdflatex
BUILDTEX=$(TEX) $(PROJECT).tex

all:
	pandoc $(YAML).yml --template $(TEMPLATE).tex -o $(PROJECT).tex
	$(BUILDTEX)
	$(BUILDTEX)
	$(BUILDTEX)
	rm $(PROJECT).aux
	rm $(PROJECT).log
	open $(PROJECT).pdf

clean-all:
	rm -f *.log *.aux *.out *.pdf

clean:
	rm -f *.log *.aux *.out
```

Then, the content is added to the YAML file:
```
---
version: 2020-09-06

contact:
  name: Peter Kratz
  email: pkratz22@gmail.com
  phone: 1-347-456-9431

education:
  - year: May 2020
    university: Villanova University
    degree: Bachelor of Business Administration
    GPA: 3.55/4.0
    honors: Cum Laude
    city: Villanova, PA
    majors: Business Analytics, Management Information Systems
    minors: Computer Science

work:
  - company: Coriell Life Sciences
    title: Operations Associate
    city: Philadelphia, PA
    years: October 2020 - Present
    achievement1: Automated program processes, primarily using Python, decreasing time spent by 90%.
    achievement2: Implemented 30+ cross-departmental data quality control reports, checking for completeness, validity, and consistency using both Zoho CRM and Python.
    achievement3: Established client-facing dashboards, saving two hours per week during preparation of client presentations.
    achievement4: Redesigned patient-facing medication action plans using HTML and CSS with Apache FreeMarker templates.
    achievement5: Conducted change point detection using R on enrollment to gauge effectiveness of outreach by vendor and presented findings to executive team, giving company leverage during re-contracting, saving $10000.

internship:
  - company: NDH Capital Corporation
    title: Business Development Intern
    city: New York, NY
    years: June 2018 - August 2018, June 2019 - August 2019
    achievement1: Analyzed financial statements to evaluate client liquidity, asset management, leverage, and profitability ratios, depending on client and industry.
    achievement2: Presented findings in clear, concise reports to the president of NDH Capital, creating insight into structuring of transactions with clients.

project:
  - title: Deloitte Technology Case Competition
    descriptor: Winner
    location: Villanova University
    years: February 2019 - March 2019
    achievement1: Proposed Go-to-Market strategy involving product differentiation, company restructuring, partnership selection, and target audience leading to an estimated 10% return on investment and 20% gross margin.
    achievement2: Developed roll-out plan with specific 30, 90, and 180 day targets.
  - title: Linda Creed Breast Cancer Foundation
    location: Villanova University
    years: October 2018 - December 2018
    achievement1: Extracted client data from GiftMaker CRM, cleaned data, and uploaded to Salesforce, increasing data organization and streamlining processes, reducing time spent in CRM by approximately 30%.
    achievement2: Built 5 reports in Salesforce allowing client to analyze donor, donation, and contact activity.
  - title: Principles of Database Systems
    location: Villanova University
    years: October 2018 - December 2018
    achievement1: Designed Entity-Relationship Diagrams and Produced relational database with four tables using SQL and Oracle Database that allowed users to find information about cultural attractions by city.
  - title: Competitive Effectiveness
    location: Villanova University
    years: October 2017 - December 2017
    achievement1: Developed product packaging, pricing, distribution, and promotional strategies for a new BENGAY product line to sales by a calculated 7%.
    achievement2: Created promotional campaign strategy and proposed shift in target audience based on market research and demographic trends, leading to an estimated increase in brand relevance of 20%.

activity:
  - title: Treasurer
    group: Villanova Curling
    location: Villanova, PA
    years: August 2018 - May 2020
    achievement1: Fundraised over $700.00, allowing the organization to minimize dues while funding team expenses.

skills:
  - type: Programming Languages
    skill1: Python
    skill2: R
    skill3: SQL
  - type: Web Development
    skill1: HTML
    skill2: CSS
    skill3: Javascript
  - type: CRM Systems
    skill1: Zoho CRM
    skill2: Salesforce CRM
---
```

The output looks like the following PDF:
