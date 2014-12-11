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
%%% \type{}            -- one of MD: Management Document,
%%%                              TR: Technical Report,
%%%                              D: Deliverable,
%%%                              P: Published Paper
%%% \distribution{}    -- one of PU: Public,
%%%                              PP: Restricted to other programme participants (including commission services),
%%%                              RE: Restricted to a group specified by the consortium (including the commission services),
%%%                              CO: confidential, only for members of the consortium (including the commission services)
%%% \editor{}          -- a person
%%% \epartner{}        -- one of ICL, ENS, ARM, REAL, RWTHA, MONO, UT, RIGHT
%%% \contributors{}    -- a person or partner
%%% \localnumber{}     -- 3-digit number assigned by epartner
%%% \versionnumber{}   --  vX.Y  (X and Y numbers)
%%% \author{}          -- authors (people)
%%% \reviewers{}       -- reviewers (people)
%%% \address           -- and their addresses (design this yourself)
%%% \workpackages{}    -- contributing workpackages
%%% \preparationdate{} -- preparation date
%%% \duedate{}         -- due date
%%% \ecdate{}          -- date of actual delivery to the EC
%%% \address{}         -- address(es) of author(s)
%%% \abstract{}
%%%
%%%
%%% \date{}            -- to set a date (of completion)
%%%                      (default is \today)
%%% \cryear{}          -- to set a year for the copyright notice
%%%                      (default is this year)
%%%                      (default is pdf)
%%%
%%% You can place comments into the document as follows:
%%%
%%% \comment[Name]{Text} for comments labelled with your name
%%% \comment{Text}       for anonymous comments
%%% Use the carp class together with the comments option to
%%% make them visible: \documentclass[comments]{carp}.
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
\ifthenelse{\PublicDocument}
  { }
  {\thetitlepage \clearpage}
  \pagestyle{plain}
  \changetext{0pt}{-2cm}{}{}{}
  \thesecondpage
  \clearpage
  \printRevision
  \clearpage
  \tableofcontents
  \clearpage
}

% Commands to be executed at the end
\AtEndDocument{
  \label{maxpage} % to find out the number of pages
}

% Generate the title page
\newcommand{\thetitlepage}{
  \thispagestyle{first}
  \vspace*{-0.3cm}
% Added by KS
  \printlogo
  \begin{center}
  \vspace{0.3cm}
  \textbf{\LARGE \thetitle}
  \vspace{0.3cm}
  \end{center}
  \hrule\hrule
  \begin{center}
  \begin{tabular}{@{\ }p{\textwidth/2-2.8cm}p{\textwidth/2+0.5cm}}
  Grant Agreement:                          & 287767 \\[1mm]
  Project Acronym:                          & CARP \\[1mm]
  Project Name:                             &
      Correct and Efficient Accelerator Programming \\[1mm]
  Instrument:                               &
      Small or medium scale focused research project (STREP) \\[1mm]
  Thematic Priority:                        &
      Alternative Paths to Components and Systems \\[1mm]
  Start Date:                               & 1 December 2011 \\[1mm]
  Duration:                                 & 36 months \\[1mm]
  Document Type\small{$^1$}:                & \printtypestring \\[1mm]
  Document Distribution\small{$^2$}:        & \printdistributionstring \\[1mm]
  Document Code{\small$^3$}:                             &
      CARP-\theepartner-\thedocumentcode-\thelocalnumber \\[1mm]
  Version:                                  & \theversionnumber \\[1mm]
  Editor (Partner):                         & \theeditor\ (\theepartner) \\[1mm]
  Contributors:                             & \thecontributors \\[1mm]
  Workpackage(s):                           & \theworkpackages \\[1mm]
\ifthenelse{\PublicDocument}{}{
  Reviewer(s):                              & \thereviewers \\[1mm]
  Due Date:                                 & \theduedate \\[1mm]
  Submission Date:                          & \theecdate \\[1mm]
}
  Number of Pages:                          & \pageref{maxpage}  \\[1mm]
  \end{tabular}
  \end{center}
  \hrule %\hrule
  \vspace{0.8cm}

\vfill{
\noindent
\footnotesize{
$\!\!\line(1,0){60}$

\noindent
$^1$MD = management document; TR = technical report; D = deliverable; P = published paper; CD = communication/dissemination.%

\noindent
$^2$PU = Public; PP = Restricted to other programme participants (including the Commission Services); RE = Restricted to a group specified by the consortium (including the Commission Services); CO = Confidential, only for members of the consortium (including the Commission Services).%

\noindent
$^3$This code is constructed as described in the Project Handbook.
}
}
}

% Generate the second page
\newcommand{\thesecondpage}{
  \vspace*{-0.3cm}
  \hrule
  \begin{center}
  \vspace{7.6cm}
  \textbf{\LARGE \thetitle} \\[2cm]
  \textbf{\theauthor} \\[0.4cm]
  \theaddress \\[0.6cm]
  \end{center}
  \newpage
}

% Define title
\renewcommand{\title}[1]{\renewcommand{\thetitle}{#1}}
\newcommand{\thetitle}{Title}

% Define document type (one of MD, TR, D, P)
\newcommand{\type}[1]{\renewcommand{\thetype}{#1}}
\newcommand{\thetype}{??}

% Print type id with explanation (see handbook)
\newcommand{\printtypestring}{
  \ifthenelse{\equal{\thetype}{MD}}
    {MD (Management Document)}{
  \ifthenelse{\equal{\thetype}{TR}}
    {TR (Technical Report)}{
  \ifthenelse{\equal{\thetype}{D}}
    {D (Deliverable)}{
  \ifthenelse{\equal{\thetype}{P}}
    {P (Published Paper)}{
    {??}
  }}}}
}

% Define document distribution (one of PU, PP, RE, CO)
\newcommand{\distribution}[1]{\renewcommand{\thedistribution}{#1}}
\newcommand{\thedistribution}{??}

% Modified by Gaertner 07
% Print distribution id with explanation (see handbook)
\newcommand{\printdistributionstring}{
  \ifthenelse{\equal{\thedistribution}{PU}}
    {PU (Public)}{
  \ifthenelse{\equal{\thedistribution}{PP}}
    {PP (restricted to other programme participants - including the commission services)}{
  \ifthenelse{\equal{\thedistribution}{RE}}
    {RE (restricted to a group specified by the consortium - including the commission services)}{
  \ifthenelse{\equal{\thedistribution}{CO}}
    {CO (Confidential)}%, only for members of the consortium - including the commission services)}
    {??}
  }}}}
%BOH }

% Define editing partner
\newcommand{\epartner}[1]{\renewcommand{\theepartner}{#1}}
\newcommand{\theepartner}{??}

% Define workpackages
\newcommand{\workpackages}[1]{\renewcommand{\theworkpackages}{#1}}
\newcommand{\theworkpackages}{??}

% Define document number (local to each partner, three digits)
\newcommand{\localnumber}[1]{\renewcommand{\thelocalnumber}{#1}}
\newcommand{\thelocalnumber}{???}

% Define version number
\newcommand{\versionnumber}[1]{\renewcommand{\theversionnumber}{#1}}
\newcommand{\theversionnumber}{??}

% Define editor
\newcommand{\editor}[1]{\renewcommand{\theeditor}{#1}}
\newcommand{\theeditor}{??}

% Define contributors
\newcommand{\contributors}[1]{\renewcommand{\thecontributors}{#1}}
\newcommand{\thecontributors}{??}

% Define document code
\newcommand{\documentcode}[1]{\renewcommand{\thedocumentcode}{#1}}
\newcommand{\thedocumentcode}{??}

% Define year (for copyright note, default is current year)
\newcommand{\cryear}[1]{\renewcommand{\thecryear}{#1}}
\newcommand{\thecryear}{\number\year}

% Define date of preparation
\newcommand{\preparationdate}[1]{\renewcommand{\thepreparationdate}{#1}}
\newcommand{\thepreparationdate}{??}

% Define due date
\newcommand{\duedate}[1]{\renewcommand{\theduedate}{#1}}
\newcommand{\theduedate}{??}

% Define date of delivery to the EC
\newcommand{\ecdate}[1]{\renewcommand{\theecdate}{#1}}
\newcommand{\theecdate}{??}

% Define author(s)
\renewcommand{\author}[1]{\renewcommand{\theauthor}{#1}}
\newcommand{\theauthor}{??}

% Define reviewers(s)
\newcommand{\reviewers}[1]{\renewcommand{\thereviewers}{#1}}
\newcommand{\thereviewers}{??}

% Define author's address
\newcommand{\address}[1]{\renewcommand{\theaddress}{#1}}
\newcommand{\theaddress}{??}

% Define abstract
\renewcommand{\abstract}[1]{\renewcommand{\theabstract}{#1}}
\newcommand{\theabstract}{}

% Define revision
\newcommand{\revhistory}[1]{\renewcommand{\therevhistory}{
\begin{tabular}{|p{1.9cm}|p{1.3cm}|p{1.4cm}|p{8.1cm}|} \hline {\bf Date} & {\bf Version} & {\bf Author} & {\bf Modification} \\ \hline #1 \end{tabular}}}
\newcommand{\therevhistory}{}


% Define approvals
\newcommand{\approvals}[1]{\renewcommand{\theapprovals}{
\begin{tabular}{|p{3.4cm}|p{2.6cm}|p{1.5cm}|p{2.8cm}|} \hline {\bf Role} & {\bf Name} & {\bf Partner} & {\bf Date} \\ \hline #1 \end{tabular}}}
\newcommand{\theapprovals}{}

\newcommand{\changetextwidth}{\setlength{\textwidth}{14.5cm}}

% Print abstract (with lines etc)
\newcommand{\printRevision}{
\ifthenelse{\PublicDocument}
{
  \hrule
  \noindent
  \begin{center}
  \vspace{1cm}
  \textbf{REVISION HISTORY} \\[2.5mm]
  \therevhistory
  \end{center}
}
{
  \hrule
  \noindent
  \begin{center}
  \textbf{REVISION HISTORY} \\[2.5mm]
  \therevhistory
  \end{center}
  \noindent
  \begin{center}
  \textbf{APPROVALS} \\[2.5mm]
  \theapprovals
  \end{center}
}
}

%% Print Logo
\newcommand{\printlogo}{
  \hrule
  \vspace{2mm}
  \begin{center}
  \begin{tabular}{m{.2\textwidth}m{.45\textwidth}m{.2\textwidth}}
  \includegraphics[scale=0.14]{fp7logo} &
  \centering
  \includegraphics[scale=0.5]{carptitle} &
  \hfill
  \includegraphics[scale=0.55]{carplogo}
  \end{tabular}
  \end{center}
  \vspace{1mm}
  \hrule
}

\fancypagestyle{plain}{
\lhead{\raisebox{0.38cm}{\includegraphics[scale=0.2]{carptitle}}}
\chead{}
\rhead{\includegraphics[scale=0.3]{carplogo}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.4pt}
\renewcommand{\headheight}{33pt}
\setlength{\headwidth}{\textwidth}
\setlength{\fancyfootoffset}{0cm}
\ifthenelse{\PublicDocument}{}{\lfoot{CARP-\theepartner-\thedocumentcode-\thelocalnumber-\theversionnumber}}
\cfoot{\thepage}
\rfoot{\theecdate}
}

\fancypagestyle{first}{
\lhead{}
\chead{}
\rhead{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.4pt}
\setlength{\headwidth}{\textwidth}
\setlength{\fancyfootoffset}{0cm}
\lfoot{}
\cfoot{\footnotesize\textit{Copyright \copyright~\thecryear\ by the CARP Consortium.}}
\rfoot{}
}

\def\nl{\\ \hline}
