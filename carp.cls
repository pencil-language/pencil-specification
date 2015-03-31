%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Latex Document Class for CARP Documents
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% You should use the following commands in the preamble of your
%%% Latex file (see sample-document.tex for an example):
%%%
%%% \title{}
%%% \author{}          -- authors (people)
%%% \address           -- and their addresses (design this yourself)
%%% \ecdate{}          -- date of actual delivery to the EC
%%% \address{}         -- address(es) of author(s)
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% v1.0: 07/12/2011 by Alastair Donaldson (afd@doc.ic.ac.uk)
%%%       based on a template by Francesca Toni
%%%       in turn based on a template by Ulle Endriss
%%%
%%% v1.1: 23/04/2012 by Jeroen Ketema (jketema@doc.ic.ac.uk)
%%%       tweak logos and fonts; also add approval table and
%%%       make compilable with both pdflatex and latex
%%%
%%% v1.2: 25/11/2014 by Riyadh Baghdadi (riyadh.baghdadi@inria.fr)
%%%       disable verbose title page and some other things
%%%	  for public release.  Create the \printRevision command
%%%
%%% v1.3  31/03/2015 by Riyadh Baghdadi (riyadh.baghdadi@inria.fr)
%%%       Simplify the class for public release.
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{carp}[2012/05/05^^JLaTeX Document Class for
CARP Documents]

\RequirePackage{mathptmx}
\RequirePackage{calc}
\RequirePackage{graphicx}
\RequirePackage{ifthen}
\RequirePackage{chngpage}
\RequirePackage{fancyhdr}
\RequirePackage{array}
\RequirePackage{array}
\RequirePackage{color}

\ProcessOptions

% Based on report.cls
\LoadClass[twoside,11pt]{report}
\RequirePackage{caption}
\RequirePackage[justification=centerlast]{floatrow}
\RequirePackage{microtype}

% Redefine chapter heading not to include the word Chapter
\def\@makechapterhead#1{%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \Huge\bfseries \thechapter \hspace{.8ex \@plus .2ex \@minus .1ex}
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 20\p@
  }}

\def\@makeschapterhead#1{%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 20\p@
  }}

% Page size
\setlength{\textwidth}{16.5cm}
\setlength{\textheight}{22.5cm}%19.9
\setlength{\topmargin}{-1.5cm}%.8
\setlength{\oddsidemargin}{0.1cm}
\setlength{\evensidemargin}{0.1cm}

% Commands to be executed at the beginning
\AtBeginDocument{
  \pagestyle{plain}
  \changetext{0pt}{-2cm}{}{}{}
  \thesecondpage
  \clearpage
  \tableofcontents
  \lfoot{PENCIL\theversionnumber}
  \clearpage
}

% Commands to be executed at the end
\AtEndDocument{
  \label{maxpage} % to find out the number of pages
}

% Generate the second page
\newcommand{\thesecondpage}{
  \vspace*{-0.3cm}
  \hrule
  \begin{center}
  \vspace{7.6cm}
  \textbf{\LARGE \thetitle} \\[2cm]
  \textbf{\theauthor} \\[1cm]
  \theaddress \\[4cm]
  \text{Revision \RevisionNumber{}} \\[2.5mm]
  \end{center}
  \newpage
}

% Define title
\renewcommand{\title}[1]{\renewcommand{\thetitle}{#1}}
\newcommand{\thetitle}{Title}

% Define version number
\newcommand{\versionnumber}[1]{\renewcommand{\theversionnumber}{#1}}
\newcommand{\theversionnumber}{??}

% Define date of delivery to the EC
\newcommand{\ecdate}[1]{\renewcommand{\theecdate}{#1}}
\newcommand{\theecdate}{??}

% Define author(s)
\renewcommand{\author}[1]{\renewcommand{\theauthor}{#1}}
\newcommand{\theauthor}{??}

% Define author's address
\newcommand{\address}[1]{\renewcommand{\theaddress}{#1}}
\newcommand{\theaddress}{??}

\newcommand{\changetextwidth}{\setlength{\textwidth}{14.5cm}}

\fancypagestyle{plain}{
\lhead{\raisebox{0.38cm}{\includegraphics[scale=0.2]{carptitle}}}
\chead{}
\rhead{\includegraphics[scale=0.3]{carplogo}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.4pt}
\renewcommand{\headheight}{33pt}
\setlength{\headwidth}{\textwidth}
\setlength{\fancyfootoffset}{0cm}
\cfoot{\thepage}
\rfoot{\theecdate}
}

\def\nl{\\ \hline}
