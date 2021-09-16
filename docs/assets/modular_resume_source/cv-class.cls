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

% Split
\newcommand{\split}{
  $\mid$
}

% Custom section
\titleformat{\section}         % Customise the \section command
  {\bfseries\scshape\raggedright} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading

\titlespacing{\section}{0em}{0em}{2pt} % left spacing, before spacing, after spacing
