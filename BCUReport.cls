\ProvidesClass{BCUReport}
\LoadClass[a4paper, 12pt]{article}

% I like a sans-serif font. If you want to go back to the regular latex font just remove this line.
\renewcommand{\familydefault}{\sfdefault}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page layout settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\linespread{1.3} % Line spacing
\usepackage[inner=2cm, outer=2cm, bottom=2cm]{geometry} % Margin sizes
\usepackage{emptypage} % Remove headers from empty pages
\usepackage{microtype} % Always good to include for beautification
\usepackage{lscape} % For including landscape pages where necessary
\usepackage[all]{nowidow} % Increased penalty for widows and orphans

% Extra packages included by Harvey Fretwell
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{float}
\usepackage{amsmath}
\usepackage{url}
\usepackage{siunitx}
\usepackage{enumitem}
\usepackage{pdfpages}
\usepackage{multibib}
% ====================

% Section titles
\usepackage{titlesec}
\titleformat{\section}{\Huge\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\Large\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\large\bfseries}{\thesubsubsection}{1em}{}

\let\nospacesection\section
\renewcommand{\section}{\clearpage\nospacesection}

% ToC and others
\usepackage{tocloft}
\renewcommand{\cfttoctitlefont}{\Huge\bfseries}
\setlength{\cftaftertoctitleskip}{40pt}

\renewcommand{\cftloftitlefont}{\Huge\bfseries}
\setlength{\cftafterloftitleskip}{40pt}

\renewcommand{\cftlottitlefont}{\Huge\bfseries}
\setlength{\cftafterlottitleskip}{40pt}

% don't indent lists of figures or tables
\makeatletter
\renewcommand*\l@figure{\@dottedtocline{1}{0em}{2.3em}}
\let\l@table\l@figure
\makeatother

\AtBeginDocument{
    \let\tableofcontentsnopage\tableofcontents
    \renewcommand{\tableofcontents}{\clearpage\vspace*{50pt}\tableofcontentsnopage}

    \let\nopagelistoffigures\listoffigures
    \renewcommand{\listoffigures}{\clearpage\vspace*{50pt}\nopagelistoffigures}

    \let\listoftablesnopage\listoftables
    \renewcommand{\listoftables}{\clearpage\vspace*{50pt}\listoftablesnopage}
}

\newcommand{\listofacronyms}{
    \renewcommand{\section}{\clearpage\vspace*{50pt}\nospacesection}
    \printglossary[type=\acronymtype, nopostdot, nonumberlist, style=alttree]
    \renewcommand{\section}{\clearpage\nospacesection}
}

% Centered paragraph column type
\usepackage{array}
\newcolumntype{C}[1]{>{\centering}p{#1}}

% Blank space between paragraphs
\usepackage{parskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Useful packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Appendices
\usepackage[title,toc,page]{appendix}

% Figures
\usepackage{graphicx} % For including figure images
\usepackage[justification=centering]{caption} % Center align figure captions
\usepackage{epstopdf} % For including eps vector graphics

% Harvard Referencing
\usepackage{natbib} % Harvard referencing
\usepackage{bibentry} % For putting full reference detail in the body of the document
\nobibliography*

% Clickable reference links
\usepackage[backref=page]{hyperref}
\hypersetup
{
	colorlinks,
	citecolor=black,
	filecolor=black,
	linkcolor=black,
	urlcolor=black
}

% Show pages on which references have been cited in the reference list
\renewcommand*{\backref}[1]{}
\renewcommand*{\backrefalt}[4]
{
	\ifcase #1 [Not Cited.]
	\or [Cited on Page #2.]
	\else [Cited on Pages #2.]
	\fi
}

% Glossaries
%\usepackage[acronym, nonumberlist, toc]{glossaries}
%\makeglossaries
\usepackage[automake, acronym, nonumberlist]{glossaries-extra}

% Cross-referencing
\usepackage{cleveref} % Simple cross-referencing for sections, figures, etc.
\AtBeginEnvironment{appendices}{
    \clearpage
    \crefalias{section}{appendix}
    \crefalias{subsection}{appendix}
    \crefalias{subsubsection}{appendix}
    \titleformat{\section}{\Huge\bfseries}{\thesection}{1em}{}
    \renewcommand{\section}[1]{
        \nospacesection{#1}
        \renewcommand{\section}{\clearpage\nospacesection}
    }
}

% Some commands to make notes and todo lists.
% \usepackage{xcolor,colortbl}
\usepackage[xcdraw]{xcolor,colortbl}
\newcommand{\note}[1]{{\color{red}#1}}
\newcommand{\todo}[1]{{\color{blue}#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition of title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\newcommand{\studentid}[1]
{
	\newcommand{\@studentid}{#1}
}

\newcommand{\module}[1]
{
	\newcommand{\@module}{#1}
}

\newcommand{\course}[1]
{
	\newcommand{\@course}{#1}
}

\newcommand{\wordcount}[1]
{
	\newcommand{\@wordcount}{#1}
}

\renewcommand{\maketitle}
{
	\begin{titlepage}
		\begin{center}
			\includegraphics[width=0.15\textwidth]{Images/BCU.jpg} \\
			\vspace{0.5em}
			{\huge Birmingham City University} \\
			\vspace{10em}
			{\bfseries \Huge \@title} \\
			\vspace{3em}
			{\huge \@author} \\
			\vspace{2em}
			{\Large Student ID: \@studentid} \\
			\vspace{6em}

			{\Large \@module}
			
			{\Large \@course}
			
			{\Large Faculty of Computing, Engineering and the Built Environment}
			
			{\Large School of Computing and Digital Technology}
			
			{\Large Birmingham City University}
			
			{\Large Submitted \@date}
			
			\vspace*{\fill}
			{\Large Word Count: \@wordcount}
		\end{center}
	\end{titlepage}
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstract and acknowledgement environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{abstract}
{
    \clearpage
	\phantomsection
	\addcontentsline{toc}{section}{Abstract}
	\thispagestyle{plain}
	\setcounter{page}{1}
	\vspace*{\fill}
	\nospacesection*{Abstract}
}
{
	\vspace*{\fill}
}