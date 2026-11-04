---
layout: post
title: "Modular LaTeX Resume"
date: 2026-11-03 10:56:02 -0500
categories: professional
---
The first blog post will discuss a recent mini-project I completed - transforming my resume into a modular resume, in which the design and content were separated as is best practice.

This project required creating four files:
- .cls class file
- .yaml content file
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
    left      = 1in,    % Inner margin  % 1in is standard
    right     = 1in,    % Outer margin  % 1in is standard
    top       = 1in,    % Top margin    % 1in is standard
    bottom    = 1in,    % Bottom margin % 1in is standard
    marginpar = 0in,
 %   showframe,         % Uncomment to show how the type block is set on the page
}

% Name
\newcommand{\name}[1]{
  \savebox0{\Large{#1}}
  \centerline{\Large{#1}}
}

% Contact
\newcommand{\contact}[3]{
\centerline{
    \savebox1{#1}
    \makebox[\wd1][r]{#1} $\mid$ \makebox[\wd0]{#2} $\mid$ \makebox[\wd1][l]{#3}
    }
}

% Split
\newcommand{\split}{
  $\mid$
}

% Custom section
\titleformat{\section}            % Customise the \section command
  {\bfseries\scshape\raggedright} % Make the \section headers large (\Large),
                                  % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                         % Can be used to give a prefix to all sections, like 'Section ...'
  {}                              % Can be used to insert code before the heading
  [\titlerule]                    % Inserts a horizontal line after the heading

\titlespacing{\section}{0em}{0em}{2pt} % left spacing, before spacing, after spacing
```

The LaTeX file handles the following:
- (Some of the) Required Packages
- File metadata for PDF Resume including:
  - Author
  - Title
  - Language
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
\usepackage[T1]{fontenc}
\usepackage{newpxtext}
\usepackage{enumitem}
\usepackage{microtype}
\usepackage{hyperref}

\hypersetup{pdfauthor={$meta.author$},
            pdftitle={$meta.title$},
            pdflang={$meta.language$}
            }

\begin{document}

\pagenumbering{gobble}

% *****************************************
% Contact
% *****************************************
\name{$contact.name$}
\contact{$contact.email$}{$contact.phone$}{$contact.location$}

% *****************************************
% WORK EXPERIENCE
% *****************************************
$if(work)$ \section{Work Experience} $endif$
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
$if(internship)$ \section{Internships} $endif$
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
% COMPETITIONS / PROJECTS / ACTIVITIES
% *****************************************
$if(project)$ \section{Competitions} $endif$
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

$if(activity)$ \section{Activities} $endif$
$for(activity)$
    \noindent\textbf{$activity.title$ $if(activity.group)$ \unskip, \textit{$activity.group$} $endif$}\quad \textit{$activity.location$} \hfill {$activity.years$}
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
    \noindent\textbf{$education.university$}\hfill{$education.city$}\break
    \textit{$education.degree$}\hfill{$if(education.honors)$ Honors: \textit{$education.honors$} $endif$}\hfill{$education.year$}\break
    {$if(education.majors)$ Majors: {$education.majors$} $endif$}
    {$if(education.minors)$ \split{} Minors: {$education.minors$} $endif$}
    \par
$endfor$
\bigskip

% *****************************************
% SKILLS
% *****************************************
\section{Skills}
$for(skills)$
    \noindent\textbf{$skills.type$: }$if(skills.skill1)$ \unskip{$skills.skill1$} $endif$ $if(skills.skill2)$ \unskip, {$skills.skill2$} $endif$ $if(skills.skill3)$ \unskip, {$skills.skill3$}$endif$\hfill $if(skills.skill4)$ \unskip, {$skills.skill4$}$endif$\hfill $if(skills.skill5)$ \unskip, {$skills.skill5$}$endif$\hfill $if(skills.skill6)$ \unskip, {$skills.skill6$}$endif$\hfill $if(skills.skill7)$ \unskip, {$skills.skill7$}$endif$\hfill $if(skills.skill8)$ \unskip, {$skills.skill8$}$endif$\hfill \par
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
YAML=cv-data-kiro
TEX=pdflatex
BUILDTEX=$(TEX) $(PROJECT).tex

all:
	pandoc $(YAML).yml --template $(TEMPLATE).tex -o $(PROJECT).tex
	$(BUILDTEX)
	$(BUILDTEX)
	$(BUILDTEX)
	rm $(PROJECT).aux
	rm $(PROJECT).log
	rm $(PROJECT).out
	open $(PROJECT).pdf

clean-all:
	rm -f *.log *.aux *.out *.pdf

clean:
	rm -f *.log *.aux *.out
```

Then, the content is added to the YAML file:
```
---
version: 2025-06-10

meta:
  title: Peter Kratz Resume
  author: Peter Kratz
  date: 2025-06-10
  language: en-US

contact:
  name: Peter Kratz
  email: pkratz22@gmail.com
  phone: 1-347-456-9431
  location: New York, NY

education:
  - year: May 2020
    university: Villanova University
    degree: Bachelor of Business Administration
    honors: Cum Laude
    city: Villanova, PA
    majors: Business Analytics, Management Information Systems
    minors: Computer Science

work:
  - company: InformedDNA
    title: Data Engineer
    city: Remote
    years: March 2025 - Present
    achievement1: Designed and deployed production AWS serverless pipeline (Step Functions, Lambda, CDK) orchestrating claims processing, R-based report generation, and automated QuickSight dashboard refreshes, reducing client report turnaround from 15+ minutes of manual engineering effort to under 1 minute upon file receipt.
    achievement2: Built multi-Lambda SAM application automating patient enrollment and eligibility synchronization between Formstack, S3, and Zoho CRM, processing 100K+ records daily with structured logging and error handling, eliminating 2 hours of manual work per week.
    achievement3: Developed ETL pipelines standardizing 200+ claims files (pharmacy, medical, and professional) across 15+ client formats into unified schema, with automated S3 archival, deduplication, and data quality flagging, eliminating manual pre-processing and ensuring consistent downstream data availability.
    achievement4: Created AWS data quality toolkit auditing Athena views for staleness, profiling query performance across 30+ databases and 300+ tables/views, and tracing cross-service references (QuickSight, Glue, Lambda) to safely decommission deprecated resources.
  - company: Coriell Life Sciences
    title: Senior Data Analyst
    city: Philadelphia, PA
    years: March 2022 - March 2025
    achievement1: Built composite pharmacogenomic risk scoring model weighting 6 clinical factors to rank 17K+ members into deciles across 5 groups, optimizing program enrollment targeting for 2 clients.
    achievement2: Evaluated clinical program ROI by applying propensity score matching (MatchIt) to identify matched control groups, then running difference-in-differences and paired t-test models to compare healthcare costs and utilization across staggered treatment timings.
    achievement3: Developed simulation-based cost savings projection tool sampling from 1M+ historical records with demographic stratification, enrollment ramp-up schedules, and savings decay modeling, enabling prospective clients to assess program viability for their population before committing to full claims data transfer.
    achievement4: Built quarterly business reporting CLI with automated CRM/database merging, SQL generation, mismatch detection, and property-based testing to produce identified and deidentified cohort reports across 20+ client accounts.
  - company: Coriell Life Sciences
    title: Data Analyst
    city: Philadelphia, PA
    years: October 2020 - March 2022
    achievement1: Forecasted enrollment using changepoint detection (PELT) to isolate steady-state periods, then compared ETS, ARIMA, and Holt-Winters models with automatic quarterly fallback when monthly MAPE exceeded 30%, producing 12-month forecasts with confidence intervals.
    achievement2: Automated monthly billing reconciliation across multiple clients by pulling CRM data via API and applying client-specific business rules, eliminating manual CRM lookups per client and reducing risk of invoicing errors.
    achievement3: Designed outreach list generation pipelines combining S3 eligibility data with CRM enrollment status, applying household deduplication, minor filtering, and claims filtering to produce targeted mailing, email, and phone lists across 5+ clients on repeatable monthly cadence.

skills:
  - type: Languages & Tools
    skill1: Python (pandas, boto3, requests)
    skill2: R (tidyverse)
    skill3: SQL
    skill4: Git
  - type: Analytics & Visualization
    skill1: QuickSight
    skill2: R (ggplot2, R Markdown)
  - type: AWS
    skill1: Athena
    skill2: CDK
    skill3: Glue
    skill4: Lambda
    skill5: S3
    skill6: SAM
    skill7: Step Functions
---
```

You can view the output in the following PDF:
[Peter Kratz Resume]({{ site.baseurl }}/assets/pdfs/Peter_Kratz_Resume.pdf)

You can find the source files for cv-class.cls, cv-template.tex, and makefile below:
- [cv-class.cls]({{ site.baseurl }}/assets/modular_resume_source/cv-class.cls)
- [cv-template.tex]({{ site.baseurl }}/assets/modular_resume_source/cv-template.tex)
- [makefile]({{ site.baseurl }}/assets/modular_resume_source/makefile)

To run, you will need a TeX Engine and Pandoc. Get them here:
- [TeX](https://www.latex-project.org/get/)
- [Pandoc](https://pandoc.org/installing.html)