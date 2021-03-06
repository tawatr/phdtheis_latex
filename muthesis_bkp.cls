% muthesis.cls
%
% author: Michael A. Allen, Physics Department, Mahidol University
% email:  maa_software@yahoo.co.uk / frmaa"at"mahidol.ac.th
% webpage: einstein.sc.mahidol.ac.th/~scmal/LaTeX/
% adapted from: /usr/share/texmf/tex/latex/base/report.cls and Thai Latex
% also /usr/share/texmf/tex/latex/natbib/natbib.sty

% Modified by Puwis Amatyakul
% : September 2015

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{muthesis}[2010/03/02 v0.525 Mahidol University thesis class]
\LoadClass[11pt,a4paper]{report}
\RequirePackage[tableposition=top]{caption}
\RequirePackage{ifthen}
\RequirePackage{amsmath,amssymb}
% <puwis>
%\RequirePackage[top=2.5cm,bottom=2.5cm,left=3.75cm,right=2.5cm]{geometry}
\RequirePackage{indentfirst}
\RequirePackage[margin=2.5cm]{geometry}
\RequirePackage{titlesec}
%\RequirePackage{showframe}
%</puwis>

% to get linenumbers use \linenumbers
\RequirePackage[displaymath,mathlines]{lineno}
\newboolean{@natbibmode}\setboolean{@natbibmode}{false}
\DeclareOption{natbib}{%
  \setboolean{@natbibmode}{true}%
}
\ProcessOptions\relax
\if@natbibmode
  \RequirePackage{natbib}% this cannot go inside \DeclareOption argument
  \bibpunct{(}{)}{;}{a}{}{,}%
\else
\fi

%% PAGE LAYOUT 

%\textwidth 146mm % old values
%\textheight 227mm %
\textwidth 147.5mm  % Checked <puwis>
\textheight 234.5mm % Checked <puwis>
\oddsidemargin 1.25cm 
\evensidemargin 0mm 
\topmargin 0mm 
\newlength{\refbaselineskip}
\setlength{\refbaselineskip}{\baselineskip}
\newcommand{\linespacing}[1]{\baselineskip=#1\refbaselineskip}

% following taken from textcase.sty with extra `%' added to prevent
% extraneous space at start of output from \MakeTextUppercase
\def\@uclcnotmath#1#2#3#4{\begingroup
      #1%
      \def\({$}\let\)\(%$
      \def\NoCaseChange##1{\noexpand\NoCaseChange{\noexpand##1}}%
      \@nonchangecase\label%
      \@nonchangecase\ref%
      \@nonchangecase\ensuremath%
      \def\cite##1##{\toks@{\noexpand\cite##1}\@citex}%
      \def\@citex##1{\NoCaseChange{\the\toks@{##1}}}%
      \def\reserved@a##1##2{\let#2\reserved@a}%
      \expandafter\reserved@a\@uclclist\reserved@b{\reserved@b\@gobble}%
      \protected@edef\reserved@a{\endgroup%
          \noexpand\@skipmath#3#4$\valign$}%
      \reserved@a}%
\def\@nonchangecase#1{\def#1##1{\NoCaseChange{#1{##1}}}}%
\let\NoCaseChange\@firstofone%
\def\@skipmath#1#2$#3${%
  \@skip@nonchangecase#1#2\NoCaseChange\valign%
  \ifx\valign#3%
  \else%
    $#3$%
    \expandafter\@skipmath\expandafter#1%
  \fi}%
\def\@skip@nonchangecase#1#2\NoCaseChange#3{%
  #1{#2}%
  \ifx\valign#3%
  \else
    #3%
    \expandafter\@skip@nonchangecase\expandafter#1%
  \fi}
\DeclareRobustCommand\MakeTextUppercase{%
\@uclcnotmath{\def\i{I}\def\j{J}}{##1##2}\uppercase}
\protected@edef\MakeTextUppercase#1{\MakeTextUppercase{#1}}

% from thai style file

\def\tb{\hspace{0cm}} % Word Break Characters
%\def\tb{\linebreak[3]\hspace{0cm}} % Word Break Characters
\def\thai#1{\utfont #1} % Switch to Thai Font command
\def\spsizenormal{18} % for 11pt
%\def\spsizenormal{21.6} % for 12pt
\def\tfontname{dbtt}
\def\tfontsize{\spsizenormal pt}
\def\huispace{ }
\def\settfont{\font\utfont = \tfontname\huispace  at \tfontsize} 
\settfont % initialize thai font and size

\renewcommand\bibname{References}

% draft mode

\newboolean{@draftmode}\setboolean{@draftmode}{false}
\newcommand{\draft}{\setboolean{@draftmode}{true}}
\newboolean{@notitlepage}\setboolean{@notitlepage}{false}
\newcommand{\notitlepage}{\setboolean{@notitlepage}{true}}

% information for front page

\newcommand{\candidate}[1]{\def\@candidate{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}
  \ifthenelse{\equal{\@degree}{PhD}}
	{\def\@degree{Ph.D.} \def\@fulldegree{Doctor of Philosophy}}
	{\def\@degree{M.Sc.} \def\@fulldegree{Master of Science}}
}
\newcommand{\subject}[1]{\def\@subject{#1}}
\newcommand{\submissionyear}[1]{\def\@submissionyear{#1}}
\newcommand{\isbn}[1]{\def\@isbn{#1}}
\newcommand{\@TITLE}{\MakeTextUppercase{\@title}}

% information for page i

\newcommand{\candidatetitle}[1]{\def\@candidatetitle{#1}}
\newcommand{\majoradvisor}[1]{\def\@majoradvisor{#1}}
\newcommand{\majoradvisortitle}[1]{\def\@majoradvisortitle{#1}}
\newcommand{\majoradvisorletters}[1]{\def\@majoradvisorletters{#1}}
\newcommand{\majoradvisorsubject}[1]{\def\@majoradvisorsubject{#1}}
\newcommand{\coadvisor}[1]{\def\@coadvisor{#1}}
\newcommand{\coadvisortitle}[1]{\def\@coadvisortitle{#1}}
\newcommand{\coadvisorletters}[1]{\def\@coadvisorletters{#1}}
\newcommand{\coadvisorsubject}[1]{\def\@coadvisorsubject{#1}}
\newcommand{\coadvisorstatus}[1]{\def\@coadvisorstatus{#1}}
\newcommand{\coadvisorII}[1]{\def\@coadvisorII{#1}}
\newcommand{\coadvisorIItitle}[1]{\def\@coadvisorIItitle{#1}}
\newcommand{\coadvisorIIletters}[1]{\def\@coadvisorIIletters{#1}}
\newcommand{\coadvisorIIsubject}[1]{\def\@coadvisorIIsubject{#1}}
\newcommand{\coadvisorIII}[1]{\def\@coadvisorIII{#1}}
\newcommand{\coadvisorIIItitle}[1]{\def\@coadvisorIIItitle{#1}}
\newcommand{\coadvisorIIIletters}[1]{\def\@coadvisorIIIletters{#1}}
\newcommand{\coadvisorIIIsubject}[1]{\def\@coadvisorIIIsubject{#1}}
\newcommand{\programchair}[1]{\def\@programchair{#1}}
\newcommand{\programchairqual}[1]{\def\@programchairqual{#1}}
\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\graduatestudiesdean}[1]{\def\@graduatestudiesdean{#1}}
\newcommand{\GSDstatus}[1]{\def\@GSDstatus{#1}}

% information for page ii

\newcommand{\submissiondate}[1]{\def\@submissiondate{#1}}
\newcommand{\chair}[1]{\def\@chair{#1}}
\newcommand{\chairqual}[1]{\def\@chairqual{#1}}
\newcommand{\memberI}[1]{\def\@memberI{#1}}
\newcommand{\memberIqual}[1]{\def\@memberIqual{#1}}
\newcommand{\memberII}[1]{\def\@memberII{#1}}
\newcommand{\memberIIqual}[1]{\def\@memberIIqual{#1}}
\newcommand{\memberIII}[1]{\def\@memberIII{#1}}
\newcommand{\memberIIIqual}[1]{\def\@memberIIIqual{#1}}
\newcommand{\memberIV}[1]{\def\@memberIV{#1}}
\newcommand{\memberIVqual}[1]{\def\@memberIVqual{#1}}
\newcommand{\memberV}[1]{\def\@memberV{#1}}
\newcommand{\memberVqual}[1]{\def\@memberVqual{#1}}
\newcommand{\facultydean}[1]{\def\@facultydean{#1}}
\newcommand{\FDqual}[1]{\def\@FDqual{#1}}
\newcommand{\FDstatus}[1]{\def\@FDstatus{#1}}

% information for page iv (ABSTRACT)

\newcommand{\candidatenumber}[1]{\def\@candidatenumber{#1}}
\newcommand{\major}[1]{\def\@major{#1}}
\newboolean{@longsubject}\setboolean{@longsubject}{false}
\newcommand{\longsubject}{\setboolean{@longsubject}{true}}
\newcommand{\keywords}[1]{\def\@keywords{#1}}
\newcommand{\keywordsII}[1]{\def\@keywordsII{#1}}
\newcommand{\keywordsIII}[1]{\def\@keywordsIII{#1}}

% information for page v (THAI ABSTRACT)

\newcommand{\thaimajor}[1]{\def\@thaimajor{#1}}
\newcommand{\thaisubject}[1]{\def\@thaisubject{#1}}
\newcommand{\thaicandidate}[1]{\def\@thaicandidate{#1}}
\newcommand{\thaititle}[1]{\def\@thaititle{#1}}
\newcommand{\thaimajoradvisor}[1]{\def\@thaimajoradvisor{#1}}
\newcommand{\thaicoadvisor}[1]{\def\@thaicoadvisor{#1}}
\newcommand{\thaicoadvisorII}[1]{\def\@thaicoadvisorII{#1}}
\newcommand{\thaicoadvisorIII}[1]{\def\@thaicoadvisorIII{#1}}

% information for Biography

\newcommand{\dateofbirth}[1]{\def\@dateofbirth{#1}}
\newcommand{\placeofbirth}[1]{\def\@placeofbirth{#1}}
\newcommand{\firstdegree}[1]{\def\@firstdegree{#1}}
\newboolean{@longfirstdegree}\setboolean{@longfirstdegree}{false}
\newcommand{\longfirstdegree}{\setboolean{@longfirstdegree}{true}}
\newcommand{\firstdegreemajor}[1]{\def\@firstdegreemajor{#1}}
\newcommand{\firstdegreeinstitution}[1]{\def\@firstdegreeinstitution{#1}}
\newcommand{\firstdegreeyears}[1]{\def\@firstdegreeyears{#1}}
\newcommand{\preinstitution}[1]{\def\@preinstitution{#1}}
\newcommand{\preinstitutionLnII}[1]{\def\@preinstitutionLnII{#1}}
\newcommand{\preinstitutionII}[1]{\def\@preinstitutionII{#1}}
\newcommand{\preinstitutionIILnII}[1]{\def\@preinstitutionIILnII{#1}}
\newcommand{\years}[1]{\def\@years{#1}}
\newcommand{\postinstitution}[1]{\def\@postinstitution{#1}}
\newcommand{\postinstitutionLnII}[1]{\def\@postinstitutionLnII{#1}}
\newcommand{\postinstitutionII}[1]{\def\@postinstitutionII{#1}}
\newcommand{\postinstitutionIILnII}[1]{\def\@postinstitutionIILnII{#1}}
\newcommand{\scholarship}[1]{\def\@scholarship{#1}}
\newcommand{\scholarshipLnII}[1]{\def\@scholarshipLnII{#1}}
\newcommand{\scholarshipLnIII}[1]{\def\@scholarshipLnIII{#1}}
\newcommand{\scholarshipII}[1]{\def\@scholarshipII{#1}}
\newcommand{\scholarshipIILnII}[1]{\def\@scholarshipIILnII{#1}}
\newcommand{\scholarshipIILnIII}[1]{\def\@scholarshipIILnIII{#1}}
\newcommand{\scholarshipIII}[1]{\def\@scholarshipIII{#1}}
\newcommand{\scholarshipIIILnII}[1]{\def\@scholarshipIIILnII{#1}}
\newcommand{\scholarshipIIILnIII}[1]{\def\@scholarshipIIILnIII{#1}}
\newcommand{\scholarshipIV}[1]{\def\@scholarshipIV{#1}}
\newcommand{\scholarshipIVLnII}[1]{\def\@scholarshipIVLnII{#1}}
\newcommand{\scholarshipIVLnIII}[1]{\def\@scholarshipIVLnIII{#1}}
\newcommand{\position}[1]{\def\@position{#1}}
\newcommand{\workplace}[1]{\def\@workplace{#1}}
\newcommand{\workplaceLnII}[1]{\def\@workplaceLnII{#1}}
\newcommand{\homeaddress}[1]{\def\@homeaddress{#1}}
\newcommand{\homeaddressLnII}[1]{\def\@homeaddressLnII{#1}}
\newcommand{\homeaddressLnIII}[1]{\def\@homeaddressLnIII{#1}}
\newcommand{\email}[1]{\def\@email{#1}}
%\newcommand{\}[1]{\def\@{#1}}

% set defaults for non-essential parameters
\degree{}
\submissionyear{\number\year}
\isbn{}
\coadvisorstatus{Co-advisor}
\coadvisortitle{Lect.\ }
\coadvisorletters{}
\coadvisorsubject{}
\coadvisorII{}
\coadvisorIItitle{Lect.\ }
\coadvisorIIletters{}
\coadvisorIIsubject{}
\coadvisorIII{}
\coadvisorIIItitle{Lect.\ }
\coadvisorIIIletters{}
\coadvisorIIIsubject{}
\graduatestudiesdean{Prof.~Banchong Mahisavariya, M.D.}
\GSDstatus{}
\chair{}
\memberI{}
\memberIqual{}
\memberII{}
\memberIIqual{}
\memberIII{}
\memberIIIqual{}
\memberIV{}
\memberIVqual{}
\memberV{}
\memberVqual{}
\facultydean{Prof.~Skorn Mongkolsuk}
\FDqual{Ph.D.}
\FDstatus{}
\major{}
\keywordsII{}
\keywordsIII{}
\thaicandidate{}
\thaimajor{}
\thaimajoradvisor{}
\thaicoadvisor{}
\thaicoadvisorII{}
\thaicoadvisorIII{}
\firstdegree{Bachelor of Science}
\preinstitution{}
\preinstitutionLnII{}
\preinstitutionII{}
\preinstitutionIILnII{}
\postinstitution{}
\postinstitutionLnII{}
\postinstitutionII{}
\postinstitutionIILnII{}
\scholarship{}
\scholarshipLnII{}
\scholarshipLnIII{}
\scholarshipII{}
\scholarshipIILnII{}
\scholarshipIILnIII{}
\scholarshipIII{}
\scholarshipIIILnII{}
\scholarshipIIILnIII{}
\scholarshipIV{}
\scholarshipIVLnII{}
\scholarshipIVLnIII{}
\position{}
\workplace{}
\workplaceLnII{}
\homeaddress{}
\homeaddressLnII{}
\homeaddressLnIII{}
\email{}

% alternative heading used for CONTENTS (CONT.), etc
\newcommand{\@althead}{}
% right-hand heading used for Appendix section
\newcommand{\@appname}{}

\def\@facgradstud{Fac.~of Grad.~Studies, Mahidol Univ.}
\def\@sigdots{..........................................}
% signature dots followed by parbox
\newcommand{\@sbx}[1]{\parbox[t]{70mm}{\RaggedRight\@sigdots\\#1}}
\newlength{\@halftextwidth}
\@halftextwidth=0.53\textwidth
\def\@thesisentitled{\vspace*{-15mm}Thesis \\ entitled \\ \vskip 1em
	\large \bfseries \@TITLE \\ 
	\normalsize\rm
}
\author{\@candidate}
\date{}

\renewcommand\maketitle{\par
	\linespacing{1.3}
	\begingroup
	\renewcommand\thefootnote{\@fnsymbol\c@footnote}
    	\def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}
    	\long\def\@makefntext##1{\parindent 1em\noindent
		\hb@xt@1.8em{%
                	\hss\@textsuperscript{\normalfont\@thefnmark}}##1}
	\if@twocolumn
	\ifnum \col@number=\@ne
        \@maketitle
      	\else
        \twocolumn[\@maketitle]%
	\fi
	\else
	\newpage
	\global\@topnum\z@   % Prevents figures from going at top of page.
      	\@maketitle
    	\fi
    	\thispagestyle{empty}\@thanks
  	\endgroup
	\setcounter{footnote}{0}%
	\global\let\thanks\relax
	\global\let\maketitle\relax
	\global\let\@maketitle\relax
	\global\let\@thanks\@empty
	\global\let\@author\@empty
	\global\let\@date\@empty
%	\global\let\@title\@empty
	\global\let\title\relax
	\global\let\author\relax
	\global\let\date\relax
	\global\let\and\relax
}

\def\@maketitle{
\if@draftmode\else\setboolean{@notitlepage}{false}\fi
\if@notitlepage\else
	\newpage
	\thispagestyle{empty}	
	\begin{center}
	\Large \bfseries \@TITLE \par
  	\null
  	\vskip 2em%
\if@draftmode\@author\vskip 2em\else
  	\let \footnote \thanks
    	\vskip 7.5em%
    	{\Large
      	\lineskip .5em%
      	\begin{tabular}[t]{c}
        \MakeUppercase\@author
      	\end{tabular}\par}
    	\vfill
	{\Large % US spelling is FULFILLMENT 
    	A THESIS SUBMITTED IN PARTIAL FULFILMENT \\
	OF THE REQUIREMENTS FOR \\
	THE DEGREE OF \MakeUppercase\@fulldegree\
	(\MakeUppercase\@subject) \\
	FACULTY OF GRADUATE STUDIES \\
	MAHIDOL UNIVERSITY \\
	\@submissionyear \\ \mbox{}\\
	%\number\year \\
	\ifthenelse{\equal{\@isbn}{}}{}{ISBN~\@isbn \\ }
	COPYRIGHT OF MAHIDOL UNIVERSITY} 
  	\end{center}
  	\par
  	\vskip 1.5em
	\newpage  % THESIS ADVISORS
	\setcounter{page}{1}
	\thispagestyle{empty}	
	\begin{center}
	\@thesisentitled \vfill
	\begin{tabbing}
	\hspace{\@halftextwidth}\=\@sbx{\@candidatetitle \@candidate \\
	Candidate} \\ \\ \\ \\
	\ifthenelse{\equal{\@coadvisorII}{}}{ \\ }{}
	\>\@sbx{\@majoradvisortitle \@majoradvisor, \\
        \@majoradvisorletters~(\@majoradvisorsubject) \\
	Major advisor} \\ \\ \\ \\	
	\ifthenelse{\equal{\@coadvisorII}{}}{ \\ }{}
	\>\@sbx{\@coadvisortitle \@coadvisor, \\
        \@coadvisorletters~(\@coadvisorsubject) \\
	\@coadvisorstatus} \\ \\ \\ \\
	\ifthenelse{\equal{\@coadvisorII}{}}{ \\ }{%
		\>\@sbx{\@coadvisorIItitle \@coadvisorII, \\
                \@coadvisorIIletters~(\@coadvisorIIsubject) \\
		Co-advisor} \\ \\ \\ \\
	}
	\ifthenelse{\equal{\@coadvisorIII}{}}{ \\ }{%
		\>\@sbx{\@coadvisorIIItitle \@coadvisorIII, \\
                \@coadvisorIIIletters~(\@coadvisorIIIsubject) \\
		Co-advisor} \\ \\ \\ \\
	}
	\@sbx{\@graduatestudiesdean\\
          \ifthenelse{\equal{\@GSDstatus}{}}{}{\@GSDstatus\ } Dean\\
	Faculty of Graduate Studies}
	\>\@sbx{\@programchair, \\\@programchairqual \\Chair \\
	  \@fulldegree\ Programme \\in \@subject \\ Faculty of \@faculty}
        \end{tabbing}
  	\end{center}	
	\newpage  % THESIS EXAM COMMITTEE
	\thispagestyle{empty}
	\begin{center}
	\@thesisentitled \vskip 1em
	was submitted to the Faculty of Graduate Studies, Mahidol University \\
	for the degree of \@fulldegree\ (\@subject) \\
	on \\
	\@submissiondate \\ \vfill
	\begin{tabbing}
	\hspace{\@halftextwidth}\=\@sbx{\@candidatetitle \@candidate \\
	Candidate} \\ \\ \\ \\
	\>\@sbx{\@chair,\\ \@chairqual\\ Chair} \\ \\ \\ \\
	\ifthenelse{\equal{\@memberIV}{}}{}
                   {\@sbx{\@memberIV,\\\@memberIVqual\\ Member}}
	\>\@sbx{\ifthenelse{\equal{\@memberI}{}}
	{\@majoradvisortitle \@majoradvisor,\\
          \@majoradvisorletters~(\@majoradvisorsubject)}
        {\@memberI,\\\@memberIqual} \\ Member} \\ \\ \\ \\
	\ifthenelse{\equal{\@memberIII}{}}{}%
                   {\@sbx{\@memberIII,\\\@memberIIIqual\\ Member}}
	\>\@sbx{\ifthenelse{\equal{\@memberII}{}}
	{\@coadvisortitle
	\@coadvisor,\\\@coadvisorletters~(\@coadvisorsubject)}
        {\@memberII, \\ \@memberIIqual} \\ Member} \\ \\ \\ \\
	\@sbx{\@graduatestudiesdean\\
        \ifthenelse{\equal{\@GSDstatus}{}}{}{\@GSDstatus\ }Dean \\
        Faculty of Graduate Studies\\
        Mahidol University}
        \>\@sbx{\@facultydean,\\ \@FDqual \\
	\ifthenelse{\equal{\@FDstatus}{}}{}{\@FDstatus\ }Dean \\
	Faculty of \@faculty \\Mahidol University}
	\end{tabbing}
\fi
  	\end{center}
\fi	
}

\newcommand{\acknowledgements}[1]{\if@draftmode\else
        \chapter*{Acknowledgements}
	\thispagestyle{empty}
  	\markright{Thesis}
	\addcontentsline{toc}{chapter}{ACKNOWLEDGEMENTS}
	\linespacing{1.3} 
        #1\mbox{}\newline\newline\mbox{}\hfill\@candidate
\fi
}

\def\@abstractbox{
	\thispagestyle{myheadings}
	\markright{
	\hspace*{-0.05\textwidth}
	\protect\raisebox{-9mm}{
%	\fbox{\protect\rule[-\textheight]{0pt}{0pt}\hspace*{1.04\textwidth}}}
%	\hspace*{-1.03\textwidth}\small\@facgradstud\hfil Thesis / \thepage
	\fbox{\protect\rule[-\textheight]{0pt}{0pt}\hspace*{1.03\textwidth}}}
	\hspace*{-1.03\textwidth}\small\@facgradstud\hfil Thesis / \thepage
	}
}

\renewcommand{\abstract}[1]{\if@draftmode\if@notitlepage\else
 #1 \newpage \fi
\else
	%\titlepage
	\newpage
	\addcontentsline{toc}{chapter}{ABSTRACT (ENGLISH)}
	\@abstractbox
      	%\null\vfil
	\parindent = 8 ex
        \noindent\sloppy
        \@TITLE. \\ \\ \vspace{-1mm}%
  	\MakeUppercase\@candidate~~\@candidatenumber \\ \\ \vspace{-1mm}%
	\@degree\ (\MakeUppercase\@subject) 
	\ifthenelse{\equal{\@degree}{M.Sc.}}{
	\ifthenelse{\equal{\@major}{}}
	{}{MAJOR IN \MakeUppercase\@major}}{} \\ \\ \vspace{-1mm}%
%        : \= MAJOR : 
%	\ifthenelse{\equal{\@major}{}}
%	{\MakeUppercase\@subject\ }{\MakeUppercase\@major\ };
%	\ifthenelse{\boolean{@longsubject}}{ \\ \> }{}
        %\sloppy
        %\begin{flushleft}
        THESIS ADVISORS : 
	\MakeUppercase\@majoradvisor, \@majoradvisorletters\ 
        (\MakeUppercase\@majoradvisorsubject),
	\MakeUppercase\@coadvisor, \@coadvisorletters\
        (\MakeUppercase\@coadvisorsubject)%
	\ifthenelse{\equal{\@coadvisorII}{}}{ }{,
	\MakeUppercase\@coadvisorII, \@coadvisorIIletters\
        (\MakeUppercase\@coadvisorIIsubject)}%
	\ifthenelse{\equal{\@coadvisorIII}{}}{ }{,
	\MakeUppercase\@coadvisorIII, \@coadvisorIIIletters\
        (\MakeUppercase\@coadvisorIIIsubject)} \\ %\end{flushleft} 
	\begin{center}ABSTRACT\end{center}
	\@beginparpenalty\@lowpenalty
        \@endparpenalty\@M
	\par #1
        \begin{tabbing}
	KEY WORDS~: \= \MakeTextUppercase\@keywords \\ 
	\ifthenelse{\equal{\@keywordsII}{}}{}{
	 \> \MakeTextUppercase\@keywordsII\\ }
	\ifthenelse{\equal{\@keywordsIII}{}}{}{
	 \> \MakeTextUppercase\@keywordsIII\\ } \\ \vspace{-5mm}%
	\pageref{biography}\ pages \ifthenelse{\equal{\@isbn}{}}{}{ISBN~\@isbn}
      	\end{tabbing}\fussy
\fi
}
%{\par\vfil\null\endtitlepage}

\newcommand{\thaiabstract}[1]{\if@draftmode\else
	%\titlepage
	\linespacing{1.3}
	\newpage
	\addcontentsline{toc}{chapter}{ABSTRACT (THAI)}
	\@abstractbox
      	%\null\vfil
	\parindent = 8 ex
        \noindent\sloppy
        \@thaititle\ (\@TITLE). \\ \\
	\ifthenelse{\equal{\@thaicandidate}{}}
                   {\MakeTextUppercase\@candidate}
                   {\@thaicandidate}~~\@candidatenumber\\ \\
	\ifthenelse{\equal{\@degree}{Ph.D.}}{{\thai ��.�.}}{{\thai Ƿ.�.}} %
	(\@thaisubject)
        \ifthenelse{\equal{\@degree}{M.Sc.}}{%
	\ifthenelse{\equal{\@thaimajor}{}}%
	{}{{\thai �Ң��Ԫ��͡}\@thaimajor\ }}{} \\
	\par\fussy\noindent
        \sloppy
	{\thai ��С�����äǺ����Է�ҹԾ���}
	: \ifthenelse{\equal{\@thaimajoradvisor}{}}
        {\MakeUppercase\@majoradvisor}{\@thaimajoradvisor},
        \@majoradvisorletters\ (\MakeUppercase\@majoradvisorsubject),
	\ifthenelse{\equal{\@thaicoadvisor}{}}{\MakeUppercase\@coadvisor}
	{\@thaicoadvisor}, \@coadvisorletters\
        (\MakeUppercase\@coadvisorsubject)%
	\ifthenelse{\equal{\@coadvisorII}{}}{ }{,
        \ifthenelse{\equal{\@thaicoadvisorII}{}}{%
	\MakeUppercase\@coadvisorII}{\@thaicoadvisorII}, \@coadvisorIIletters\
        (\MakeUppercase\@coadvisorIIsubject)}%
	\ifthenelse{\equal{\@coadvisorIII}{}}{ }{,
        \ifthenelse{\equal{\@thaicoadvisorIII}{}}{%
	\MakeUppercase\@coadvisorIII}{\@thaicoadvisorIII}, 
        \@coadvisorIIIletters\
        (\MakeUppercase\@coadvisorIIIsubject)} \\
	%\tolerance=1000
	%\spaceskip 0.333em plus 1em minus 0.222em
	%\@beginparpenalty\@lowpenalty
        %\@endparpenalty\@M
	\begin{center}{\thai ���Ѵ�}\end{center}
	\par
	\linespacing{1.5}
	\sloppy #1 \par
        \fussy\mbox{}\newline
	\noindent\pageref{biography}~{\thai ˹��} 
        \ifthenelse{\equal{\@isbn}{}}{}{ISBN~\@isbn}
\fi
} % the \par is necessary to get last paragraph to have good spacing

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
%	\thispagestyle{plain}
	\global\@topnum\z@
	\@afterindentfalse
	\secdef\@chapter\@schapter
}
% used to make optional argument the heading only (not the toc entry)
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#2}%(was 1)
                    \else
                      \addcontentsline{toc}{chapter}{#2}% (was 1)
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{
	\ifthenelse{\equal{\thechapter }{1}}{\renewcommand{\@althead}{}
		\pagestyle{headings}
		\pagenumbering{arabic}}{}
        \ifthenelse{\equal{\thechapter}{A}}{\renewcommand{\@althead}{}}{}
	\vspace*{5\p@}
	{\parindent \z@ \raggedright \normalfont
	\ifnum \c@secnumdepth >\m@ne
	\begin{center}
        \Large\bfseries \MakeTextUppercase\@chapapp\space \thechapter
%        \large\bfseries \MakeTextUppercase\@chapapp\space \@arabic\c@chapter
	\end{center}
        \par\nobreak
        \vskip 10\p@
	\fi
	\interlinepenalty\@M
	\begin{center}
	\Large \bfseries\MakeTextUppercase{#1}\par\nobreak
	\end{center}
	\vskip 20\p@
}}

\def\@schapter#1{
	\if@twocolumn
	\@topnewpage[\@makeschapterhead{#1}]
	\else
	\@makeschapterhead{#1}%
	\@afterheading
	\fi
	%\@doublespaced
}
\def\@makeschapterhead#1{
	\vspace*{5\p@}
	{\parindent \z@ \raggedright
	\normalfont
	\interlinepenalty\@M
	\begin{center}
	\Large \bfseries\MakeTextUppercase{#1}\par\nobreak
	\end{center}
	\vskip 20\p@ % originally 40
}}

% <puwis>

%% section
\titleformat{\section}[block]
  {\normalfont\large\bfseries}
  {\thesection}
  {0.5em}
  {\linespacing{1.5}}

%% subsection  
\titleformat{\subsection}[block]
  {\normalfont\large\bfseries}
  {\hspace{2cm}\thesubsection}
  {0.5em}
  {\linespacing{1.5}}

%% subsubsection  
\titleformat{\subsubsection}[block]
  {\normalfont\normalsize\bfseries}
  {\hspace{4cm}\thesubsubsection}
  {0.5em}
  {\linespacing{1.5}}

\titlespacing{\section} {0pt}{1.75cm plus 0ex minus 0ex}{0ex plus 1mm}
\titlespacing{\subsection} {0pt}{0.85cm plus 0ex minus 0ex}{0ex plus 1mm}
\titlespacing{\subsubsection}{0pt}{0ex plus 0ex minus 0ex}{0ex plus 0mm}

% Previous version 
% \renewcommand\section{%
	% \@startsection {section}{1}{\z@}%
	% {-4.7ex \@plus -1ex \@minus -.2ex}% space above heading
	% {0.9ex \@plus.2ex}% space below heading
	% {\normalfont\large\bfseries}%
% }
% \renewcommand\subsection{%
	% \@startsection{subsection}{2}{\z@}%
	% {-4.25ex\@plus -1ex \@minus -.2ex}%
	% {0.9ex \@plus .2ex}%
	% {\normalfont\large\bfseries}
% }
% \renewcommand\subsubsection{%
	% \@startsection{subsubsection}{3}{\z@}%
	% {-4.25ex\@plus -1ex \@minus -.2ex}%
	% {0.9ex \@plus .2ex}%
	% {\normalfont\normalsize\bfseries}% 
% }

% </puwis>

\def\ps@headings{
	\let\@oddfoot\@empty
	\def\@oddhead{\small\ifthenelse{\equal{\@althead}{}}{%
	\ifodd\value{page}{\@facgradstud}\else\@candidate \fi 
	\hfil 
        \ifthenelse{\equal{\@appname}{}}{%
	\ifodd\value{page} \@degree\ (\@subject)\ \else \rightmark\
	\fi}{\@appname} / \thepage}
	{\@althead\thepage}}
	\let\@mkboth\markboth
	\def\chaptermark##1{%
	\markright { ##1}}
}
\def\ps@myheadings{ % used by abstractbox 
	\let\@oddfoot\@empty\let\@evenfoot\@empty
	\def\@evenhead{\thepage\hfil\slshape\leftmark}
	\def\@oddhead{\rightmark}
	\let\@mkboth\@gobbletwo
	\let\chaptermark\@gobble
	\let\sectionmark\@gobble
}

\newcommand{\@contfont}{\fontsize{14pt}{14pt}\selectfont\bfseries} % cont font

\renewcommand\tableofcontents{
\if@draftmode\else
	\if@twocolumn
	\@restonecoltrue\onecolumn
	\else
	\@restonecolfalse
	\fi
 	\chapter*{\contentsname}
	\renewcommand{\@althead}{\hspace{0.35\textwidth}{\@contfont CONTENTS~(CONT.)}\hfil}
	\pagestyle{headings}
       	\thispagestyle{empty}
	\@starttoc{toc}%
	\if@restonecol\twocolumn\fi
\fi
}

\renewcommand\listoffigures{
\if@draftmode\else
	\if@twocolumn
	\@restonecoltrue\onecolumn
	\else
	\@restonecolfalse
	\fi
	\chapter*{\listfigurename}
\renewcommand{\@althead}{\hspace{0.3\textwidth}{\@contfont LIST OF FIGURES~(CONT.)}\hfil}
	\pagestyle{headings}
       	\thispagestyle{empty}
	\linespacing{1.3}
	\addcontentsline{toc}{chapter}{\MakeTextUppercase\listfigurename}
	\@starttoc{lof} % must go after addcontentsline
	\if@restonecol\twocolumn\fi
\fi
}

\renewcommand\listoftables{
\if@draftmode\else
	\if@twocolumn
	\@restonecoltrue\onecolumn
	\else
	\@restonecolfalse
	\fi
	\chapter*{\listtablename}
\renewcommand{\@althead}{\hspace{0.3\textwidth}{\@contfont LIST OF TABLES~(CONT.)}\hfil}
	\pagestyle{headings}
       	\thispagestyle{empty}
	\linespacing{1.3}
	\addcontentsline{toc}{chapter}{\MakeTextUppercase\listtablename}
	\@starttoc{lot}%
	\if@restonecol\twocolumn\fi
\fi
}

\newcommand\appendices{
  \if@draftmode\else\newpage\mbox{}\vskip 9cm
  %\renewcommand{\@althead}{\@facgradstud\hfil\@degree\ (\@subject)\ / }
  \renewcommand{\@appname}{Appendices}
  \begin{center}{\Large\bf APPENDICES}\end{center}
  \par\fi
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}

\renewcommand\appendix{
  \if@draftmode\else\newpage\mbox{}\vskip 9cm
  %\renewcommand{\@althead}{\@facgradstud\hfil\@degree\ (\@subject)\ / }
  \renewcommand{\@appname}{Appendix}
  \begin{center}{\Large\bf APPENDIX}\end{center}
  \par\fi
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}

\renewenvironment{thebibliography}[1]{
	\chapter*{\bibname}
  \renewcommand{\@appname}{}
  	\markright{\bibname}
	\addcontentsline{toc}{chapter}{\MakeUppercase\bibname}
\ifthenelse{\boolean{@natbibmode}}{%
	\linespacing{1.3}
  \list{\@biblabel{\arabic{NAT@ctr}}}{\@bibsetup{#1}%
    \setcounter{NAT@ctr}{0}}%
    \ifNAT@openbib
      \renewcommand\newblock{\par}
    \else
      \renewcommand\newblock{\hskip .11em \@plus.33em \@minus.07em}%
    \fi
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax
    \let\citeN\cite \let\shortcite\cite
    \let\citeasnoun\cite}{\list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
       		\leftmargin\labelwidth%
            	\advance\leftmargin\labelsep%
            	\@openbib@code%
            	\usecounter{enumiv}%
            	\let\p@enumiv\@empty
            	\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m
}}{\ifthenelse{\boolean{@natbibmode}}{%
\def\@noitemerr{%
  \PackageWarning{natbib}
     {Empty `thebibliography' environment}}%
  \endlist\vskip-\lastskip}{\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}}

\newcommand{\biography}{
\if@draftmode\else
        \ifthenelse{\equal{\@appname}{}}{}{\renewcommand{\@appname}{}}
        \chapter*{Biography}
	\linespacing{1.7}
  	\markright{Biography}
	\label{biography} % last page of thesis
	\addcontentsline{toc}{chapter}{BIOGRAPHY}
	\begin{tabbing}
	{\bf NAME} \hspace{5.5cm}\=\@candidatetitle \@candidate \\
	{\bf DATE OF BIRTH} \>\@dateofbirth \\
	{\bf PLACE OF BIRTH} \>\@placeofbirth \\
	{\bf INSTITUTIONS ATTENDED} \>\@firstdegreeinstitution,
	\@firstdegreeyears \\
	\>\hspace{1cm}\=\@firstdegree\ 
% the extra `(' seems to be necessary -- some bug in LaTeX???
        \ifthenelse{\boolean{@longfirstdegree}}{ \\ \>\> (}%
	(\@firstdegreemajor) \\
	\ifthenelse{\equal{\@preinstitution}{}}{}{\>\@preinstitution \\
	\ifthenelse{\equal{\@preinstitutionLnII}{}}{}{%
	\>\>\@preinstitutionLnII \\ }}%
	\ifthenelse{\equal{\@preinstitutionII}{}}{}{\>\@preinstitutionII \\
	\ifthenelse{\equal{\@preinstitutionIILnII}{}}{}{%
	\>\>\@preinstitutionIILnII \\ }}%
	\>Mahidol University, \@years \\
	\>\>\@fulldegree\ (\@subject) \\ 
	\ifthenelse{\equal{\@postinstitution}{}}{}{\>\@postinstitution \\
	\ifthenelse{\equal{\@postinstitutionLnII}{}}{}{%
	\>\>\@postinstitutionLnII \\ }}%
	\ifthenelse{\equal{\@postinstitutionII}{}}{}{\>\@postinstitutionII \\
	\ifthenelse{\equal{\@postinstitutionIILnII}{}}{}{
	\>\>\@postinstitutionIILnII \\ }}%
	\ifthenelse{\equal{\@scholarship}{}}{}{%
	        \ifthenelse{\equal{\@scholarshipII}{}}{\bf{SCHOLARSHIP}}%
		{\bf SCHOLARSHIPS}%   
		\>\@scholarship \\ \>\>\@scholarshipLnII \\ 
	\ifthenelse{\equal{\@scholarshipLnIII}{}}{}%
	{\>\>\@scholarshipLnIII \\ }}%
	\ifthenelse{\equal{\@scholarshipII}{}}{}{%
		\>\@scholarshipII \\ \>\>\@scholarshipIILnII \\ 
	\ifthenelse{\equal{\@scholarshipIILnIII}{}}{}%
	{\>\>\@scholarshipIILnIII \\ }}%
	\ifthenelse{\equal{\@scholarshipIII}{}}{}{%
		\>\@scholarshipIII \\ \>\>\@scholarshipIIILnII \\ 
	\ifthenelse{\equal{\@scholarshipIIILnIII}{}}{}%
	{\>\>\@scholarshipIIILnIII \\ }}%
	\ifthenelse{\equal{\@scholarshipIV}{}}{}{%
		\>\@scholarshipIV \\ \>\>\@scholarshipIVLnII \\ 
	\ifthenelse{\equal{\@scholarshipIVLnIII}{}}{}%
	{\>\>\@scholarshipIVLnIII \\ }}%
	\ifthenelse{\equal{\@position}{}}{}{{\bf POSITION} \>\@position \\ }%
	\ifthenelse{\equal{\@workplace}{}}{}{\>\@workplace \\ 
	\ifthenelse{\equal{\@workplaceLnII}{}}{}%
	{\>\@workplaceLnII \\ }}%
	\ifthenelse{\equal{\@homeaddress}{}}{}{{\bf HOME ADDRESS}%
		\>\@homeaddress \\ \>\@homeaddressLnII \\ 
	\ifthenelse{\equal{\@homeaddressLnIII}{}}{}%
	{\>\@homeaddressLnIII \\ }}%
	\ifthenelse{\equal{\@email}{}}{}{{\bf E-MAIL} \>\@email \\ }%
	\end{tabbing}
\fi
} % the `%' after each line are necessary - otherwise get extra spaces

% improve eqnarray
\def\eqnarray{\stepcounter{equation}\let\@currentlabel\theequation
\global\@eqnswtrue
\global\@eqcnt\z@\tabskip\@centering\let\\\@eqncr
$$\halign to \displaywidth\bgroup\@eqnsel\hskip\@centering
  $\displaystyle\tabskip\z@{##}$&\global\@eqcnt\@ne
  \hfil${\;##\;}$\hfil
  &\global\@eqcnt\tw@ $\displaystyle\tabskip\z@{##}$\hfil 
   \tabskip\@centering&\llap{##}\tabskip\z@\cr}

\def\endeqnarray{%
      \@@eqncr
      \egroup
      \global\advance\c@equation\m@ne
   $$\global\@ignoretrue
}

% stuff for line numbers
\newcommand*\patchAmsMathEnvironmentForLineno[1]{%
  \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
  \expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
  \renewenvironment{#1}%
     {\linenomath\csname old#1\endcsname}%
     {\csname oldend#1\endcsname\endlinenomath}}%
\newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{%
  \patchAmsMathEnvironmentForLineno{#1}%
  \patchAmsMathEnvironmentForLineno{#1*}}%
% to get linenumbers to work in paragraph before eqnarray
\let\oldeqnarray\eqnarray
\let\endoldeqnarray\endeqnarray
\renewenvironment{eqnarray}%
{\begin{linenomath}\begin{oldeqnarray}}%
{\end{oldeqnarray}\end{linenomath}}
\patchBothAmsMathEnvironmentsForLineno{align}
\patchBothAmsMathEnvironmentsForLineno{multline}
\patchAmsMathEnvironmentForLineno{split}
\patchAmsMathEnvironmentForLineno{gather}

\pagestyle{headings}
\AtBeginDocument{\pagenumbering{roman}\if@draftmode\linenumbers\fi}
