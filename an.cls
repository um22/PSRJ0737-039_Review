% This is an.cls
% AN DOCUMENT CLASS (January 2004) for LaTeX2e
%
% LaTeX document class for Astronomische Nachrichten (conference poster papers)
%
% 2006/05/23 -MWL- Paper size reset to letterpaper (from a4paper)
% 2006/05/05 -MWL- Option earlyview added, does same as early
% 2006/01/13 -MWL- Old Bibliography format restored, at publisher's request
% 2005/11/21 -MWL- New commands \received, \accepted, \publonline, 
%              new footnote symbols for \thanks, and a few corrections
% 2005/11/06 -MWL- New page layout, headers and footers enhanced, etc.
% 2004/01/28 Journal abbreviations update
% 2003/11/11 Early view option 
% 2003/09/15 Copyright line left/right on left/right pages UK
% 2003/09/13 Added copyright line on all pages UK
% 2003/07/03 Add copyright line below abstract, copyrfoot simpler
% 2003/03/24 Remove 'Berlin' from copyright line
% 2003/01/07 Change ordering of copyright line
% 2002/07/03 Changed copyright line from insert to footer U.K.
% 2001/12/10 Added copyright line U.K.
%
%%
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{an}[2006/05/23 v1.09c 
  LaTeX document class for Astronomische Nachrichten (-MWL-)]
\RequirePackage{cite}% -MWL- 2005-11-06
% 
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
% \DeclareOption{11pt}{\renewcommand\@ptsize{1}}
% \DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{mathleft}{\setlength{\mathindent}{0pt}}% -MWL- 2005-11-06
\DeclareOption{mathindented}{\setlength{\mathindent}{\parindent}}% -MWL- 2005-11-06
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
%
\let\if@runhead\iffalse
\DeclareOption{runningheads}{\let\if@runhead\iftrue}
\let\if@envcntreset\iffalse
\DeclareOption{envcountreset}{\let\if@envcntreset\iftrue}
\let\if@envcntsect\iffalse
\DeclareOption{envcountsect}{\let\if@envcntsect\iftrue}
\let\if@referee\iffalse
\DeclareOption{referee}{\let\if@referee\iftrue}
\let\if@early\iffalse
\DeclareOption{early}{\let\if@early\iftrue}
\DeclareOption{earlyview}{\let\if@early\iftrue}
\let\if@nyobjects\iffalse
%
%\ExecuteOptions{a4paper,twoside,twocolumn,fleqn,final,10pt,runningheads}
% removal of 'runningheads' activates \markboth
\ExecuteOptions{%
letterpaper% -MWL- 2005-11-06
% ,a4paper% -MWL- 2006-05-23
,twoside,twocolumn,fleqn,final,10pt%
,runningheads,mathindented% -MWL- 2005-11-06
}
\ProcessOptions
\AtEndOfClass{\let\abstract=\aaabstract}% -MWL- 2005-11-06
%\AtEndOfClass{\mathindent\z@} % test 11jun01
% ok, druckt den Abstract in onecolumn
%
\if\@ptsize 0
%
   \renewcommand\normalsize{%
      \@setfontsize\normalsize\@xpt{12}%
      \abovedisplayskip 8.55\p@ \@plus4\p@ \@minus5\p@
      \abovedisplayshortskip \z@ \@plus3\p@
      \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
      \belowdisplayskip \abovedisplayskip
      \let\@listi\@listI}
   \normalsize
   \newcommand\small{%
      \@setfontsize\small\@ixpt{11}%
      \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
      \abovedisplayshortskip \z@ \@plus2\p@
      \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
      \def\@listi{\leftmargin\leftmargini
                  \parsep 0\p@ \@plus1\p@ \@minus\p@
                  \topsep 8\p@ \@plus2\p@ \@minus4\p@
                  \itemsep0\p@}%
      \belowdisplayskip \abovedisplayskip
   }
   \newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
   \newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
%    \newcommand\large{\@setfontsize\large\@xiipt{13dd}}
   \newcommand\large{\@setfontsize\large\@xiipt{14}}% -MWL- 2005-11-06
%    \newcommand\Large{\@setfontsize\Large\@xviipt{17dd}}
   \newcommand\Large{\@setfontsize\Large\@xivpt{18}}% -MWL- 2005-11-06
%    \newcommand\LARGE{\@setfontsize\LARGE\@xviipt{17dd}}
   \newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}% -MWL- 2005-11-06
   \newcommand\huge{\@setfontsize\huge\@xxpt{25}}
   \newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
   %
   \setlength\parindent{15\p@}
   \setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
   \setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
   \setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
%   \setlength\headheight{12\p@}
%   \setlength\headsep   {14\p@}
   \setlength\headheight{8\p@} % AN value - ADS 010997
   \setlength\headsep   {6mm} % AN value - ADS 010997
   \setlength\topskip   {10\p@}
% \advance\headsep by1.5mm
%   \setlength\footskip{30\p@}
   \setlength\footskip{11.5mm}
   \setlength\maxdepth{.5\topskip} % AN value - ADS 110601
   %
   \@settopoint\textwidth
   \setlength\marginparsep {10\p@}
   \setlength\marginparpush{5\p@}
%   \setlength\oddsidemargin   {-30\p@}
%   \setlength\evensidemargin  {-30\p@}
   \setlength\oddsidemargin   {-25\p@} % AN value - ADS 010997
   \setlength\evensidemargin  {-25\p@} % AN value - ADS 010997
   \setlength\marginparwidth  {48\p@}
%   \setlength\topmargin{-60pt} 
%    \setlength\topmargin{0pt} % AN value - ADS 010997
   \setlength\topmargin{-1cm} % AN value - ADS 06012000
   \setlength\footnotesep{8\p@}
   \setlength{\skip\footins}{9\p@ \@plus 4\p@ \@minus 2\p@}
   \setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
   \setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
    \setlength\intextsep   {20\p@ \@plus 2\p@ \@minus 2\p@}
   \setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
   \setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
   \setlength\@fptop{0\p@ \@plus 1fil}
   \setlength\@fpsep{8\p@ \@plus 2fil}
   \setlength\@fpbot{0\p@ \@plus 1fil}
   \setlength\@dblfptop{0\p@ \@plus 1fil}
   \setlength\@dblfpsep{8\p@ \@plus 2fil}
   \setlength\@dblfpbot{0\p@ \@plus 1fil}
   \setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}
   \def\@listi{\leftmargin\leftmargini
               \parsep \z@
               \topsep 4\p@ \@plus2\p@ \@minus4\p@
               \itemsep\parsep}
   \let\@listI\@listi
   \@listi
   \def\@listii {\leftmargin\leftmarginii
                 \labelwidth\leftmarginii
                 \advance\labelwidth-\labelsep
                 \topsep    \z@
                 \parsep    \topsep
                 \itemsep   \parsep}
   \def\@listiii{\leftmargin\leftmarginiii
                 \labelwidth\leftmarginiii
                 \advance\labelwidth-\labelsep
                 \topsep    \z@
                 \parsep    \topsep
                 \itemsep   \parsep}
   \def\@listiv {\leftmargin\leftmarginiv
                 \labelwidth\leftmarginiv
                 \advance\labelwidth-\labelsep}
   \def\@listv  {\leftmargin\leftmarginv
                 \labelwidth\leftmarginv
                 \advance\labelwidth-\labelsep}
   \def\@listvi {\leftmargin\leftmarginvi
                 \labelwidth\leftmarginvi
                 \advance\labelwidth-\labelsep}
\else
   \input{size1\@ptsize.clo}
\fi% \@ptsize 0
%
% \let\footnotesize\small
\def\footnotesize{\fontsize{8}{9.5}\selectfont}% -MWL- 2005-11-21
%
% \setlength{\textwidth}{175mm} % the AN width - ADS 010997
% \setlength{\textheight}{247mm} % the AN height - ADS 010997
\setlength{\textwidth}{38cc} % new AN width -MWL- 2005-11-06
\setlength{\textheight}{53cc} % new AN height -MWL- 2005-11-06
%
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
%\setlength\parskip{0\p@ \@plus \p@}
\setlength\parskip{1\p@ plus 2\p@ minus 1\p@} % AN value - ADS 010997
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
%
\setcounter{topnumber}{4}
\renewcommand\topfraction{.9}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{6}
\renewcommand\textfraction{.15}
\renewcommand\floatpagefraction{.85}
\setcounter{dbltopnumber}{3}
\renewcommand\dbltopfraction{.85}
\renewcommand\dblfloatpagefraction{.85}
%\AtEndDocument
\def\ps@headings{%
%     \let\@oddfoot\@empty\let\@evenfoot\@empty
%%%% Copyright-Zeile im Fuss -MWL- 2005-11-06
\def\@oddfoot{% -MWL- 2005-11-21
  \fontsize{8}{9\p@}\normalfont
  \textbf{\@journalURL}
  \hfill  
  \fontsize{6}{7\p@}\normalfont\upshape%
  \copyright~\copyrightholder}%
\def\@evenfoot{% -MWL- 2005-11-21
  \fontsize{6}{7\p@}\normalfont\upshape
  \copyright~\copyrightholder
  \hfill
  \fontsize{8}{9\p@}\normalfont
  \textbf{\@journalURL}}%
%     \def\@evenhead{\small\rlap{\thepage}\hfil\leftmark\hfil}%
%     \def\@oddhead{\small\hfil\rightmark\hfil\llap{\thepage}}%
    \def\@oddhead{\parbox{\textwidth}{\small\rightmark\hfill\thepage\vskip0.75mm\hrule}}% -MWL- 2005-11-06
    \def\rightmark{\@journalfullname~(\yearofpublic)}% -MWL- 2005-11-06
    \def\@evenhead{\parbox{\textwidth}{\small{\thepage}\hfill\leftmark\vskip0.75mm\hrule}}% -MWL- 2005-11-06
    \def\leftmark{\thetitle}% -MWL- 2005-11-06
%     \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
    }
%%%
%  \def\ps@myheadings{%
%      \let\@oddfoot\@empty\let\@evenfoot\@empty
%      \def\@evenhead{test \small\thepage\hfil\leftmark}%
%      \def\@oddhead{\small\rightmark\hfil\thepage}%
%      \let\@mkboth\@gobbletwo
%      \let\sectionmark\@gobble
%      \let\subsectionmark\@gobble
%      }
%%%
\def\copyrightfoot{%
%   \fontsize{7}{8\p@}\normalfont\upshape%
  \fontsize{6}{7\p@}\normalfont\upshape% -MWL- 2005-11-06
  \makebox[\textwidth][c]{% -MWL- 2005-11-06
    \includegraphics[height=5.5mm]{wislogo}\hfill% -MWL- 2005-11-06
    \copyright~\copyrightholder}% 
}% -MWL- 2005-11-06 
%%%
\def\ps@firstpage{\ps@empty% -MWL- 2005-11-06 completely new
% \Pagespan{0}{0}%        --> \startpage, \lastpage, \pages
% \Yearpublication{0000}% --> \yearofpublic
% \Yearsubmission{0000}%  --> \yearofsubmission
% \Month{00}%             --> \monthofpublic
% \Volume{000}%           --> \volume
% \Issue{00}%             --> \issue
\headnote{\@journalfullname~\textbf{\volume},~No.\,\issue,~\pages~(\yearofpublic)~/~%
          \textbf{DOI}~\doi}
\if@early
% %    {\small % headnotesize changed to small - ADS 010997
% %     \ignorespaces\@headnote\par\vskip0.75mm\hrule}%
  \def\@oddhead{\parbox{\textwidth}{\vskip-10mm%
                \@earlyhead\hfill\vskip1.5mm
                \@headnote\vskip0.75mm\hrule}}% -MWL- 2005-11-06
 \else
    \def\@oddhead{\parbox{\textwidth}{\@headnote\hfill\vskip0.75mm\hrule}}% -MWL- 2005-11-06
 \fi%@early
    \let\@evenhead\@oddhead% -MWL- 2005-11-06 in case the article begins on a left side
    \def\@oddfoot{\hfil\copyrightfoot}%
    \let\@evenfoot\@oddfoot
%     \let\@mkboth\@gobbletwo% -MWL- 2005-11-06
}

% make indentations changeable
\def\setitemindent#1{\settowidth{\labelwidth}{#1}%
        \leftmargini\labelwidth
        \advance\leftmargini\labelsep
   \def\@listi{\leftmargin\leftmargini
        \labelwidth\leftmargini\advance\labelwidth by -\labelsep
        \parsep=\parskip
        \topsep=\medskipamount
        \itemsep=\parskip \advance\itemsep by -\parsep}}
\def\setitemitemindent#1{\settowidth{\labelwidth}{#1}%
        \leftmarginii\labelwidth
        \advance\leftmarginii\labelsep
\def\@listii{\leftmargin\leftmarginii
        \labelwidth\leftmarginii\advance\labelwidth by -\labelsep
        \parsep=\parskip
        \topsep=\z@
        \itemsep=\parskip \advance\itemsep by -\parsep}}
% labels of description
\def\descriptionlabel#1{\hspace\labelsep #1\hfil}
% adjusted environment "description"
% if an optional parameter (at the first two levels of lists)
% is present, its width is considered to be the widest mark
% throughout the current list.
\def\description{\@ifnextchar[{\@describe}{\list{}{\labelwidth\z@
          \itemindent-\leftmargin \let\makelabel\descriptionlabel}}}
\let\enddescription\endlist
%
\def\describelabel#1{#1\hfil}
\def\@describe[#1]{\relax\ifnum\@listdepth=0
\setitemindent{#1}\else\ifnum\@listdepth=1
\setitemitemindent{#1}\fi\fi
\list{--}{\let\makelabel\describelabel}}
%


\newdimen\logodepth
\logodepth=1.3cm
\newdimen\headerboxheight
%\headerboxheight=160.00pt
\headerboxheight=0.00pt
\newdimen\betweenumberspace          % dimension for space between
% \betweenumberspace=3.33pt            % number and text of titles.
\betweenumberspace=1em% -MWL- 
\newdimen\aftertext                  % dimension for space after
\aftertext=5pt                       % text of title.
\newdimen\headlineindent             % dimension for space between
\headlineindent=1.166cm              % number and text of headings.
\def\andname{{\rm and}}
% \def\keywordname{{\bf Key words:}}
\def\keywordname{\textbf{Key words}}% -MWL- 2005-11-06
\def\lastandname{, and}
\def\mailname{{\it Correspondence to\/}:}
% 
% \newcommand{\keywords}[1]{\par\vskip6pt\noindent\keywordname\enspace#1\ignorespaces\vskip6pt}
% -MWL- key words now are set by \maketitle
\newcommand{\keywords}[1]{%
\if!#1!%
  \let\@keywords\relax%
\else%
  \def\@keywords{\textbf{\keywordname}\quad#1\ignorespaces\vskip6pt}%
\fi}
\keywords{}
% 
% New commands: \received, \accepted, \publonline -MWL- 2005-11-21
\newcommand{\received}[1]{%
\if!#1!%
  \let\@received\relax%
  \date{The dates of receipt and acceptance should be inserted later}%
\else%
  \def\@received{Received~#1}%
  \date{\@received\@accepted\@publonline}%
\fi}
\received{}
% 
\newcommand{\accepted}[1]{%
\if!#1!%
  \let\@accepted\relax%
\else%
  \def\@accepted{, accepted~#1}%
\fi}
\accepted{}
% 
\newcommand{\publonline}[1]{%
\if!#1!%
  \let\@publonline\relax%
\else%
  \def\@publonline{\newline Published~online~#1}%
\fi}
\publonline{}
% 
% \def\email#1{{e-mail: \tt#1}}
\def\email#1{\textrm{e-mail:~#1}}% -MWL- 2005-11-21
%
\newcounter{inst}
\newcounter{auth}
\newdimen\instindent
\newbox\authrun
\newtoks\authorrunning
\newbox\titrun
\newtoks\titlerunning

\def\journalname#1{\gdef\@journalname{#1}}
\gdef\@journalname{AN}
%
\def\journalfullname#1{\gdef\@journalfullname{#1}}% -MWL- 2005-11-06
\journalfullname{Astron. Nachr.~/~\@journalname}% -MWL- 2005-11-06
%
\def\journalURL#1{\gdef\@journalURL{#1}}% -MWL- 2005-11-06
\journalURL{www.an-journal.org}% -MWL- 2005-11-06

\def\dedication#1{\gdef\@dedic{#1}}
\def\@dedic{}

% \let\@date\undefined

\def\aaabstract#1{\gdef\@abstract{#1}}

\def\institute#1{\gdef\@institute{#1}}

\def\institutename{\par
 \begingroup
 \parindent=0pt
 \parskip=0pt
 \setcounter{inst}{1}%
 \def\and{\par\stepcounter{inst}%
 \hangindent\instindent
 \noindent
 \hbox to\instindent{\hss$^{\theinst}$\enspace}\ignorespaces}%
 \setbox0=\vbox{\def\thanks##1{}\@institute}
 \ifnum\value{inst}>9\relax\setbox0=\hbox{$^{88}$\enspace}%
                 \else\setbox0=\hbox{$^{8}$\enspace}\fi
 \instindent=\wd0\relax
 \ifnum\value{inst}=1\relax
 \else
   \setcounter{inst}{1}%
   \hangindent\instindent
   \noindent
   \hbox to\instindent{\hss$^{\theinst}$\enspace}\ignorespaces
 \fi
 \small
 \ignorespaces
 \@institute\par
 \endgroup}

\def\correspondence#1{% -MWL- 2005-11-06 command is obsolete!
\begingroup
\def\protect{\noexpand\protect\noexpand}%
\xdef\@thanks{\@thanks%
\protect\footnotetext[0]{\unskip%
% % \hskip-1.5em{\it Correspondence to\/}: % orig
\hskip-1.5em%
\textbf{The \textbackslash\texttt{correspondence} command is obsolete!} % -MWL- 2005-11-06 
\ignorespaces
% #1% -MWL- 2005-11-06
}}%
\endgroup\ignorespaces
}%

\def\mail#1{\gdef\@mail{#1}}
\def\@mail{}

\def\@thanks{}

%%% -MWL- 2005-11-21 footnotsymbols changed (no \dagger = "Totenkreuz")
%%%
% \def\@fnsymbol#1{\ifcase#1\or\star\or{\star\star}\or{\star\star\star}%
%    \or \dagger\or \ddagger\or
%    \mathchar "278\or \mathchar "27B\or \|\or **\or \dagger\dagger
%    \or \ddagger\ddagger \else\@ctrerr\fi\relax}
% 
\def\@fnsymbol#1{\ifcase#1%
  \or \star% 
  \or {\star\star}% 
%   \or {\star\star\star}% 
  \or \circ% 
  \or {\circ\circ}% 
%   \or \bullet%
%   \or {\bullet\bullet}%
  \or \diamond% 
  \or {\diamond\diamond}% 
%   \or \clubsuit% 
%   \or \diamondsuit% 
%   \or \heartsuit% 
%   \or \spadesuit% 
%   \or {\scriptscriptstyle +}
%   \or {\scriptscriptstyle ++}
%   \or {\scriptscriptstyle +++}
%   \or \mathchar"278% 
%   \or \mathchar"278\mathchar"278% 
%   \or \mathchar"27B% 
%   \or \mathchar"27B\mathchar"27B% 
%   \or \|% 
%   \or *% 
%   \or **% 
%   \else\@ctrerr%
\else{\textsf{\scriptsize\textcircled{\tiny\arabic{footnote}}}}%
\fi\relax}

\def\inst#1{\unskip$^{#1}$}
\def\fnmsep{\unskip$^,$}

\def\subtitle#1{\gdef\@subtitle{#1}}
\def\@subtitle{}

\def\headnote#1{\gdef\@headnote{#1}}% Kolumnentitel Titelseite (normal)
\def\@headnote{}

\def\earlyhead#1{\gdef\@earlyhead{#1}}% Kolumnentitel Titelseite (early)
\def\@earlyhead{}

\def\thesaurus#1{\gdef\@thesaurus{#1}}

\def\ch@ckobl#1#2{\@ifundefined{@#1}
 {\typeout{Warning: Missing
\expandafter\string\csname#1\endcsname}%
  \csname #1\endcsname{#2}}
 {}}

\newif\if@normhead \@normheadtrue
\def\hugehead{\@normheadfalse
\onecolumn
\let\thanks=\footnote
\long\def\@makefntext##1{\parindent\bibindent
     \columnwidth\textwidth\advance\columnwidth -\columnsep
     \divide\columnwidth\tw@\hsize\columnwidth \linewidth\columnwidth
     \noindent\hbox to\parindent{\hss$\m@th^{\@thefnmark}$ }##1}%
}

\def\maketitle{\par
\ch@ckobl{journalname}{Noname}
\ch@ckobl{date}{the date of receipt and acceptance should be inserted later}
\ch@ckobl{title}{A title should be given}
\ch@ckobl{author}{Name(s) and initial(s) of author(s) should be given}
\ch@ckobl{institute}{Address(es) of author(s) should be given}
\begingroup
%
%     \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
%%% To set the absolut size of the footnote symbols:
% \renewcommand\thefootnote{\mbox{\footnotesize$\@fnsymbol\c@footnote$}}% -MWL- 2005-11-21
\renewcommand\thefootnote{\mbox{\scriptsize$\@fnsymbol\c@footnote$}}% -MWL- 2005-12-05
    \def\@makefnmark{$^{\@thefnmark}$}%
%
 \def\lastand{\ifnum\value{inst}=2\relax
                 \unskip{} \andname\
              \else
                 \unskip, \andname\
              \fi}%
 \def\and{\stepcounter{auth}\relax
          \ifnum\value{auth}=\value{inst}%
             \lastand
          \else
             \unskip,
          \fi}%
 \ifnum \col@number=\@ne
   \@maketitle
 \else
   \twocolumn[\@maketitle]%
 \fi
 \thispagestyle{firstpage}
 \global\@topnum\z@
 \if@normhead
    \@thanks
 \else% --> hugehead
    \twocolumn[\vspace{\@tempdima}]
    \addtocounter{page}{-1}
    \if!\the\authorrunning!
       \authorrunning{ }%
    \fi
 \fi% @normhead
 \if!\@mail!\else
    \footnotetext[0]{\kern-\bibindent\mailname\
    \ignorespaces\@mail}%
 \fi
%
 \if@runhead
    \def\\{\unskip\ \ignorespaces}%
    \def\inst##1{\unskip{}}%
    \def\thanks##1{\unskip{}}%
    \def\fnmsep{\unskip}%
    \def\object##1{##1}%
    \instindent=\textwidth
    \advance\instindent by-2\headlineindent
    \if!\the\titlerunning!\else
      \edef\@title{\the\titlerunning}%
    \fi
    \global\setbox\titrun=\hbox{\small\rm\unboldmath\ignorespaces\@title}%
    \ifdim\wd\titrun>\instindent
       \global\setbox\titrun=\hbox{\small\rm
       Title Suppressed Due to Excessive Length}%
    \fi
    \xdef\@title{\copy\titrun}%
%
    \if!\the\authorrunning!
    \else
      \setcounter{auth}{1}%
      \edef\@author{\the\authorrunning}%
    \fi
    \ifnum\value{auth}>2
       \def\stripauthor##1\and##2\endauthor{%
       \protected@xdef\@author{##1\unskip\unskip\if!##2!\else
       \ et al.\fi}}%
       \expandafter\stripauthor\@author\and\endauthor
    \else
       \gdef\and{\unskip\ \& \ignorespaces}%
       {\def\and{\noexpand\protect\noexpand\and}%
       \protected@xdef\@author{\@author}}
    \fi
    \global\setbox\authrun=\hbox{\small\unboldmath\@author\unskip:
                                 \unhbox\titrun}%
    \ifdim\wd\authrun>\instindent
    \typeout{^^JWarning: The running head built automatically
             from \string\author\space and \string\title
             ^^Jexceeds the pagewidth, please supply a shorter form
             ^^Jwith \string\authorrunning\space and/or
             \string\titlerunning\space prior to \string\maketitle}%
    \global\setbox\authrun=\hbox{\small\rm Please give a shorter version
       with: {\tt\string\authorrunning\space}and/or{\tt\space
       \string\titlerunning\space}prior to{\tt\space\string\maketitle}}%
    \fi
    \xdef\@author{\copy\authrun}%
%     \markboth{\@author}{\@author}% -MWL- 2005-11-06
    \global\let\thetitle\@author% -MWL
 \fi
%
 \endgroup
 \setcounter{footnote}{0}
 \setcounter{footnote}{0}%
 \global\let\thanks\relax
 \global\let\maketitle\relax
 \global\let\@maketitle\relax
 \global\let\@thanks\@empty
 \global\let\@author\@empty
 \global\let\@date\@empty
 \global\let\@title\@empty
 \global\let\@subtitle\@empty
 \global\let\title\relax
 \global\let\author\relax
 \global\let\date\relax
 \global\let\and\relax}

% \headnote{Astron. Nachr. / AN {\bf xxx} (xxxx) x, xxx--xxx}

\earlyhead{%
% \begin{minipage}{2\hsize}
% \parbox{6cm}{
%\resizebox{\hsize}{!}{\includegraphics[clip=]{/home/astr_n/cls/wislogo.eps}}
% \raisebox{4mm}[0pt][0pt]{
\includegraphics*{early}
% }% -MWL- 2005-11-06
% \resizebox{\hsize}{!}{\includegraphics[clip=]{WIS_logo.eps}}%
% }%
% \hspace*{1cm}%
% \parbox{\hsize}{\sf
% Early View publication on www.interscience.wiley.com\\
% (issue and page numbers not yet assigned;\\
% citable using Digital Object Identifier -- {\bf\sf DOI})}
% \end{minipage}%
% \vspace*{-6mm}
}%

% headbox and logo supressed - ADS 010997
\def\@maketitle{\newpage
 \normalfont
% \if@early
%   \vskip-21mm  % distance top - headnote
%   \@earlyhead
%   \setlength{\logodepth}{0pt}% -MWL- 2005-11-06
% \else
%   \vskip-21mm  % distance top - headnote
% \fi%@early
\if@normhead
    \setbox\authrun=\vbox\bgroup
 \fi%@normhead
\leftskip=18mm  % -MWL- 2005-11-06
 {\large \boldmath
%   \hrule\@height\logodepth\@width\z@
%   \pretolerance=10000
  \noindent\ignorespaces
%   \vskip19mm%
  \vskip8mm% -MWL- 2005-11-06
%
{\fontsize{14.4}{17}\bfseries\selectfont\@title}\par}\relax% -MWL- 2005-11-06
\vskip 4.5mm\relax %  -MWL- 2005-11-06
 \bf
 \if!\@subtitle!\else
   {\normalsize\bf\boldmath  % size subtitle large -> normal
   \pretolerance=10000
   \rightskip=0pt plus 3cm
   \noindent\ignorespaces\@subtitle \par}\vskip 11.24pt
 \fi%!\@subtitle!
 % \lineskip .5em
\setlength{\lineskip}{2pt}% -MWL- 2005-11-21
 \setbox0=\vbox{\setcounter{auth}{1}\def\and{\stepcounter{auth} }%
                \hfuzz=2\textwidth\def\thanks##1{}\@author}%
 \value{inst}=\value{auth}%
 \setcounter{auth}{1}%
%  \rightskip=0pt plus 2cm
%  \leftskip=18mm  % ADS 010997 -MWL- 2005-11-06
 \noindent\ignorespaces{\normalsize\bfseries\selectfont{\@author}}%
\vskip10pt% -MWL- 2005-11-06
% \large - 290601
 \rightskip=0pt\relax
\small\rm
\mdseries\selectfont% -MWL-
\institutename
 \vskip5mm% 
\noindent\@date % -ADS 121001
 \if!\@dedic!\else
    \par
    \normalsize\it
    \addvspace\baselineskip
    \noindent\@dedic
 \fi
%  \vskip 15mm % -ADS 111001
\vskip 5mm % -MWL- 2005-11-06
\noindent
\@keywords
\noindent
% \textbf{\abstractname}% -MWL- 2005-11-06
{\@abstract}
{%
% \fontsize{7}{8\p@}\normalfont\upshape
\fontsize{6}{7\p@}\normalfont\upshape% -MWL- 2005-11-06
% \par\addvspace\baselineskip\noindent\copyright\copyrightholder\ %
\par\addvspace\baselineskip\hfill\noindent\copyright~\copyrightholder\ % -MWL- 2005-11-06
}%
%test 030703

\if@normhead
    \egroup % end of header box
    \@tempdima=\headerboxheight
    \advance\@tempdima by-\ht\authrun
%   \advance\@tempdima by-\pagetotal
    \ifdim\@tempdima>0pt
       \vrule width0pt height\@tempdima
    \fi
    \unvbox\authrun
    \global\@minipagetrue
    \global\everypar{\global\@minipagefalse\global\everypar{}}
 \else
    \typeout{\the\c@auth\space author names and}
    \typeout{\the\c@inst\space institutes processed}
    \global\@tempdima=\pagetotal
    \global\advance\@tempdima by22.47pt
 \fi
 \vskip22.47pt
}
%
\DeclareMathAlphabet{\mathsc}{OT1}{cmr}{m}{sc}
\def\testbx{bx}%
\DeclareRobustCommand{\ion}[2]{%
\relax\ifmmode
\ifx\testbx\f@series
{\mathbf{#1\,\mathsc{#2}}}\else
{\mathrm{#1\,\mathsc{#2}}}\fi
\else\textup{#1\,{\mdseries\textsc{#2}}}%
\fi}
%
\def\clearelargs{\def\1{}\def\2{}\def\3{}\def\4{}\count255=0}
\def\druck@lement#1{{}^{\2}_{\3}\mathrm{#1}{}^{\1}_{\4}{}\if@tempswa$\fi}
\DeclareRobustCommand{\element}{\relax\ifmmode\@tempswafalse
\else$\@tempswatrue\fi\clearelargs\def\?{\phantom{0}}\@lement}
\def\@lement#1{\if#1[\expandafter\f@@dargs\else\druck@lement{#1}\fi}
\def\f@@dargs#1]{\advance\count255by\@ne
\expandafter\def\csname\number\count255\endcsname{#1}\@lement}
%
%\def\vec#1{\ensuremath{\mathbf{#1}}}
\def\vec#1{\ensuremath{\mathchoice%
{\mbox{\boldmath$\displaystyle#1$}}
{\mbox{\boldmath$\textstyle#1$}}
{\mbox{\boldmath$\scriptstyle#1$}}
{\mbox{\boldmath$\scriptscriptstyle#1$}}}}
%
\def\tens#1{\ensuremath{\mathsf{#1}}}

%
% start: sectioning old AN-style - ADS 010997

\newcounter{kap}
\newcounter{sect}
\newcounter{subsect}
\setcounter{kap}{1}
%
\def\kap #1 {
\setcounter{sect}{1}
{\vspace{9mm}\noindent\bf\arabic{kap}. \hspace{12mm} {#1} 
\bigskip\par\noindent\stepcounter{kap}}}
%
\def\sect #1 {
\addtocounter{kap}{-1}
{\bigskip\noindent\small\bf\arabic{kap}.\arabic{sect}. \hspace{9mm} {#1} 
\medskip\par\noindent\setcounter{subsect}{1}\addtocounter{kap}{1}\stepcounter{sect}}}
%
\def\subsect #1 {
\addtocounter{kap}{-1}
\addtocounter{sect}{-1}
{\bigskip\noindent\normalsize\it\arabic{kap}.\arabic{sect}.\arabic{subsect}.\ {#1}  
\smallskip\par\noindent\addtocounter{kap}{1}\addtocounter{sect}{1}\stepcounter{subsect}}}
%
\def\app #1 {
{\vspace{9mm}\noindent\bf Appendix. \hspace{2mm} {#1} 
\bigskip\par\noindent\stepcounter{kap}}}
%
\def\acknowledgements{\par\addvspace{6pt}\small\rm
\trivlist\item[\hskip\labelsep{\em Acknowledgements.\/}]}
\def\endacknowledgements{\endtrivlist\addvspace{6pt}}

% end: sectioning AN-style - ADS 010997

\setcounter{secnumdepth}{3}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand\thesection      {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
%
% \def\sectcounterend{.}
\def\sectcounterend{}% -MWL- 2005-11-06
\def\@hangfrom#1{\setbox\@tempboxa\hbox{#1}%
      \hangindent \z@\noindent\box\@tempboxa}

\def\@seccntformat#1{\csname the#1\endcsname\sectcounterend
\hskip\betweenumberspace}

\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \raggedright
          \hyphenpenalty \@M%
          \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8\hskip\aftertext}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

%
% measures and setting of sections
%
 \newcommand\section{\@startsection {section}{1}{\z@}%
                                    {-3.5ex \@plus -1ex \@minus -.2ex}% ori
%                                   {+5.5ex \@plus -1ex \@minus -.2ex}% ads
                                    {2.3ex \@plus.2ex}%
%                                   {\normalfont\normalsize\bfseries}} %-ADS
%                                   {\normalfont\Large\bfseries}}% ori 091001
                                    {\normalfont\large\bfseries}}% -ADS 091001
 \newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                      {-3.25ex\@plus -1ex \@minus -.2ex}%
%                                     {+2.5ex\@plus -1ex \@minus -.2ex}%
                                      {1.5ex \@plus .2ex}%
%                                     {\normalfont\small\bfseries}}
%                                     {\normalfont\large\bfseries}} 
                                      {\normalfont\normalsize\bfseries}}% -ADS091001
 \newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                      {-3.25ex\@plus -1ex \@minus -.2ex}%
                                      {1.5ex \@plus .2ex}%
%                                     {\normalfont\small\bfseries}}
                                      {\normalfont\normalsize\bfseries}}
 \newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                     {3.25ex \@plus1ex \@minus.2ex}%
                                     {-1em}%
                                     {\normalfont\normalsize\bfseries}}
 \newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                        {3.25ex \@plus1ex \@minus .2ex}%
                                        {-1em}%
                                       {\normalfont\normalsize\bfseries}}

%\def\section{\@startsection{section}{1}{\z@}%
%    {-21dd plus-4pt minus-4pt}{10.5dd plus 4pt
%     minus4pt}{\normalsize\bf\boldmath}}
%% these smaller measures match approx. the AN style - ADS 010997 
%%    {-10dd plus-0pt minus-0pt}{5dd plus 1pt
%%     minus1pt}{\normalsize\bf\boldmath}}
%\def\subsection{\@startsection{subsection}{2}{\z@}%
%    {-21dd plus-4pt minus-4pt}{10.5dd plus 4pt
%     minus4pt}{\normalsize\it}}
%%    {-10dd plus0pt minus0pt}{5dd plus 1pt
%%     minus1pt}{\normalsize\it}} 
%\def\subsubsection{\@startsection{subsubsection}{3}{\z@}%
%    {-21dd plus-4pt minus-4pt}{10.5dd plus 4pt
%     minus4pt}{\normalsize}}
%%    {-10dd plus-0pt minus-0pt}{5dd plus 1pt
%%     minus1pt}{\normalsize}}
%\def\paragraph{\@startsection{subsubsection}{4}{\z@}%
%    {-21dd plus-4pt minus-4pt}{-1pt}{\normalsize\it}}
%%    {-10dd plus-0pt minus-0pt}{-1pt}{\normalsize\it}}

\setlength\leftmargini  {\parindent}
\leftmargin  \leftmargini
\setlength\leftmarginii {\parindent}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {.5em}
\setlength\leftmarginvi {.5em}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\normalfont\bfseries --}
\newcommand\labelitemii{\normalfont\bfseries --}
\newcommand\labelitemiii{$\m@th\bullet$}
\newcommand\labelitemiv{$\m@th\cdot$}

% redefinition of the "\newtheorem" command.
%
% Usage now:
%
%     \newtheorem{env_nam}{caption}[within]{cap_font}{body_font}
% or  \newtheorem{env_nam}[numbered_like]{caption}{cap_font}{body_font}
% or  \newtheorem*{env_nam}{caption}{cap_font}{body_font}
%
% New is "cap_font" and "body_font". It stands for
% fontdefinition of the caption and the text itself.
%
% "\newtheorem*" gives a theorem without number.
%
% A defined newthoerem environment is used as described
% by Lamport.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@thmcountersep{}
\def\@thmcounterend{.}

\def\newtheorem{\@ifstar{\@sthm}{\@Sthm}}

% definition of \newtheorem with number

\def\@Sthm#1{\@ifnextchar[{\@othm{#1}}{\@nthm{#1}}}

\def\@xnthm#1#2[#3]#4#5{\expandafter\@ifdefinable\csname #1\endcsname
   {\@definecounter{#1}\@addtoreset{#1}{#3}%
   \expandafter\xdef\csname the#1\endcsname{\expandafter\noexpand
     \csname the#3\endcsname \noexpand\@thmcountersep \@thmcounter{#1}}%
   \expandafter\xdef\csname #1name\endcsname{#2}%
   \global\@namedef{#1}{\@thm{#1}{\csname #1name\endcsname}{#4}{#5}}%
                              \global\@namedef{end#1}{\@endtheorem}}}

\def\@ynthm#1#2#3#4{\expandafter\@ifdefinable\csname #1\endcsname
   {\@definecounter{#1}%
   \expandafter\xdef\csname the#1\endcsname{\@thmcounter{#1}}%
   \expandafter\xdef\csname #1name\endcsname{#2}%
   \global\@namedef{#1}{\@thm{#1}{\csname #1name\endcsname}{#3}{#4}}%
                               \global\@namedef{end#1}{\@endtheorem}}}

\def\@othm#1[#2]#3#4#5{%
  \@ifundefined{c@#2}{\@latexerr{No theorem environment `#2'
  defined}\@eha}%
  {\expandafter\@ifdefinable\csname #1\endcsname
  {\global\@namedef{the#1}{\@nameuse{the#2}}%
  \expandafter\xdef\csname #1name\endcsname{#3}%
  \global\@namedef{#1}{\@thm{#2}{\csname #1name\endcsname}{#4}{#5}}%
  \global\@namedef{end#1}{\@endtheorem}}}}

\def\@thm#1#2#3#4{\refstepcounter
    {#1}\@ifnextchar[{\@ythm{#1}{#2}{#3}{#4}}{\@xthm{#1}{#2}{#3}{#4}}}

\def\@xthm#1#2#3#4{\@begintheorem{#2}{\csname the#1\endcsname}{#3}{#4}%
                    \ignorespaces}

\def\@ythm#1#2#3#4[#5]{\@opargbegintheorem{#2}{\csname
       the#1\endcsname}{#5}{#3}{#4}\ignorespaces}

\def\@begintheorem#1#2#3#4{\trivlist
                 \item[\hskip\labelsep{#3#1\ #2\@thmcounterend}]#4}

\def\@opargbegintheorem#1#2#3#4#5{\trivlist
      \item[\hskip\labelsep{#4#1\ #2\ (#3)\@thmcounterend}]#5}

% definition of \newtheorem* without number

\def\@sthm#1#2{\@Ynthm{#1}{#2}}

\def\@Ynthm#1#2#3#4{\expandafter\@ifdefinable\csname #1\endcsname
   {\global\@namedef{#1}{\@Thm{\csname #1name\endcsname}{#3}{#4}}%
    \expandafter\xdef\csname #1name\endcsname{#2}%
    \global\@namedef{end#1}{\@endtheorem}}}

\def\@Thm#1#2#3{\@ifnextchar[{\@Ythm{#1}{#2}{#3}}{\@Xthm{#1}{#2}{#3}}}

\def\@Xthm#1#2#3{\@Begintheorem{#1}{#2}{#3}\ignorespaces}

\def\@Ythm#1#2#3[#4]{\@Opargbegintheorem{#1}
       {#4}{#2}{#3}\ignorespaces}

\def\@Begintheorem#1#2#3{#3\trivlist
                           \item[\hskip\labelsep{#2#1\@thmcounterend}]}

\def\@Opargbegintheorem#1#2#3#4{#4\trivlist
      \item[\hskip\labelsep{#3#1\ (#2)\@thmcounterend}]}

% definition of divers theorem environments

\if@envcntsect
   \def\@thmcountersep{.}
   \newtheorem{theorem}{Theorem}[section]{\bf}{\it}
\else
   \newtheorem{theorem}{Theorem}{\bf}{\it}
   \if@envcntreset
      \@addtoreset{theorem}{section}
   \else
      \@addtoreset{theorem}{chapter}
   \fi
\fi
\newtheorem*{proof}{Proof}{\it}{\rm}
\newtheorem{corollary}[theorem]{Corollary}{\bf}{\it}
\newtheorem{definition}[theorem]{Definition}{\bf}{\rm}
\newtheorem{example}[theorem]{Example}{\it}{\rm}
\newtheorem{exercise}[theorem]{Exercise}{\it}{\rm}
\newtheorem{lemma}[theorem]{Lemma}{\bf}{\it}
\newtheorem{note}[theorem]{Note}{\it}{\rm}
\newtheorem{problem}[theorem]{Problem}{\it}{\rm}
\newtheorem{proposition}[theorem]{Proposition}{\bf}{\it}
\newtheorem{question}[theorem]{Question}{\it}{\rm}
\newtheorem{remark}[theorem]{Remark}{\it}{\rm}
\newtheorem{solution}[theorem]{Solution}{\it}{\rm}

\def\@takefromreset#1#2{%
    \def\@tempa{#1}%
    \let\@tempd\@elt
    \def\@elt##1{%
        \def\@tempb{##1}%
        \ifx\@tempa\@tempb\else
            \@addtoreset{##1}{#2}%
        \fi}%
    \expandafter\expandafter\let\expandafter\@tempc\csname cl@#2\endcsname
    \expandafter\def\csname cl@#2\endcsname{}%
    \@tempc
    \let\@elt\@tempd}

\def\theopargself{\def\@opargbegintheorem##1##2##3##4##5{\trivlist
      \item[\hskip\labelsep{##4##1\ ##2\ ##3}]##5}
                  \def\@Opargbegintheorem##1##2##3##4{##4\trivlist
      \item[\hskip\labelsep{##3##1\ ##2}]}
      }

\def\squareforqed{\hbox{\rlap{$\sqcap$}$\sqcup$}}
\def\qed{\ifmmode\else\unskip\quad\fi\squareforqed}

\def\acknowledgements{\par\addvspace{6pt}\small\rm
\trivlist\item[\hskip\labelsep{\em Acknowledgements.\/}]}
\def\endacknowledgements{\endtrivlist\addvspace{6pt}}
%
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendix{\par
  \def\sectcounterend{}%
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{figure}{0}%
  \setcounter{table}{0}%
%   \renewcommand\thesection{Appendix \@Alph\c@section:}%
\renewcommand\thesection{\@Alph\c@section}% -MWL- 2005-11-21
%   \renewcommand\thesubsection{\@Alph\c@section.\@arabic\c@subsection.}%
%   \renewcommand\thesubsubsection{\thesubsection\@arabic\c@subsubsection.}%
  \renewcommand\thesubsection{\@Alph\c@section.\@arabic\c@subsection}% -MWL- 2005-11-06
  \renewcommand\thesubsubsection{\thesubsection\@arabic\c@subsubsection}% -MWL- 2005-11-06
  \renewcommand\theequation{\@Alph\c@section\@arabic\c@equation}%
  \renewcommand\thefigure{\@Alph\c@section\@arabic\c@figure}%
  \renewcommand\thetable{\@Alph\c@section\@arabic\c@table}%
  \@addtoreset{equation}{section}%
  \@addtoreset{figure}{section}%
  \@addtoreset{table}{section}%
  \def\subfigures{\stepcounter{figure}\setcounter{auth}{\value{figure}}%
  \setcounter{figure}{0}%
  \def\thefigure{\@Alph\c@section\@arabic\c@auth\alph{figure}}%
  \def\resetsubfig{\setcounter{figure}{\value{auth}}}}}
%
\setlength\arraycolsep{2.5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand\theequation{\@arabic\c@equation}
\newcounter{figure}
\renewcommand\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\,\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\resetsubfig\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\resetsubfig\end@dblfloat}
\let\resetsubfig\relax
\def\subfigures{\stepcounter{figure}\setcounter{auth}{\value{figure}}%
\setcounter{figure}{0}\def\thefigure{\@arabic\c@auth\alph{figure}}%
\def\resetsubfig{\setcounter{figure}{\value{auth}}}}
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}

\def \@floatboxreset {%
        \reset@font
        \small
        \@setnobreak
        \@setminipage
}

\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\newcommand\leftlegendglue{}

\def\fig@type{figure}

\newdimen\figcapgap\figcapgap=3pt
\newdimen\tabcapgap\tabcapgap=5.5pt

\@ifundefined{floatlegendstyle}{\def\floatlegendstyle{\bf}}{}
% \def\floatcounterend{.}
\def\floatcounterend{\quad}% -MWL- 2005-11-06

\long\def\@caption#1[#2]#3{\par\addcontentsline{\csname
  ext@#1\endcsname}{#1}{\protect\numberline{\csname
  the#1\endcsname}{\ignorespaces #2}}\begingroup
    \@parboxrestore
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}

\def\capstrut{\vrule\@width\z@\@height\topskip}

\long\def\@makecaption#1#2{%
 \ifx\@captype\fig@type
   \vskip\figcapgap
   \setbox\@tempboxa\hbox{{\floatlegendstyle #1\floatcounterend}
   \capstrut #2}%
   \ifdim \wd\@tempboxa >\hsize
     {\floatlegendstyle #1\floatcounterend} \capstrut #2\par
   \else
     \hbox to\hsize{\leftlegendglue\unhbox\@tempboxa\hfil}%
   \fi
 \else
   {\floatlegendstyle #1\floatcounterend} \capstrut #2\par
   \vskip\tabcapgap
 \fi}
% Define `abstract' environment
\def\acknowledgement{\par\addvspace{17pt}\small\rm
\trivlist\item[\hskip\labelsep
{\it\ackname}]}
\def\endacknowledgement{\endtrivlist\addvspace{6pt}}
% Define `noteadd' environment
\def\noteadd{\par\addvspace{17pt}\small\rm
\trivlist\item[\hskip\labelsep
{\it\noteaddname}]}
\def\endnoteadd{\endtrivlist\addvspace{6pt}}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \setlength\@tempdima{3em}%
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi}
%%%
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
%%% -MWL- 2006-11-22 \section-Seitenzahlen im ToC _alle_ unfett setzen:
%       #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      #1\nobreak\hfil\nobreak\hb@xt@\@pnumwidth{\hss\textnormal{#2}}\par% -MWL- 2005-11-21
    \endgroup
  \fi}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \section*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename
      \@mkboth{%
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
% 
\newdimen\bibindent
\setlength\bibindent{\parindent}
%%%
%%% -MWL- 2006-01-13 auf Verlagswunsch wieder altes Bibliographie-Format
%%% 
\def\@biblabel#1{}
\def\@cite#1#2{{#1\if@tempswa , #2\fi}}
\newenvironment{thebibliography}[1]{\section*{\refname
        \@mkboth{\refname}{\refname}}\small
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
           \leftmargin\bibindent
           \setlength{\itemindent}{-\leftmargin}
           \setlength{\itemsep}{0ex} %070498 ADS in 
           \setlength{\parsep}{-0.5pt} %070498 ADS in
           \@openbib@code
           \usecounter{enumiv}%
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
% \newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\newcommand\newblock{\space}% -MWL- 2005-11-06
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
%                 \columnsep 35\p@
\setlength\columnsep{1cc}% new AN value -MWL- 2005-11-06
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \noindent
    \hb@xt@\bibindent{\hss\@makefnmark\enspace}#1}
%
\newcommand\listofobjects{\if@nyobjects
  \IfFileExists{\jobname.obj}%
               {\section*{\listobjectname}%
                \@starttoc{obj}}%
               {\begingroup
                   \makeatletter
                   \if@filesw
                      \newwrite\tf@obj
                      \immediate\openout\tf@obj\jobname.obj
                      \relax
                   \fi
                   \global\@nobreakfalse
                \endgroup}\fi
               }
%
\newcommand*\l@obj[2]{\noindent`#1' on page #2\par}
%
\DeclareRobustCommand{\object}[1]{#1\global\let\if@nyobjects\iftrue
\addcontentsline{obj}{obj}{#1}}
%
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listobjectname{List of Objects}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Fig.}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
% \newcommand\abstractname{Abstract.}
\let\abstractname\relax% -MWL- 2005-11-06
\newcommand\ackname{Acknowledgements.}
\newcommand\noteaddname{Note added in proof}
\newcommand\today{}
\edef\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
% \setlength\columnsep{4mm}
\setlength\columnsep{1cc}% new AN value -MWL- 2005-11-06
\setlength\columnseprule{0\p@}
\frenchspacing
\clubpenalty=10000
\widowpenalty=10000
\def\thisbottomragged{\def\@textbottom{\vskip\z@ plus.0001fil
\global\let\@textbottom\relax}}
\pagestyle{headings}
\pagenumbering{arabic}
\if@referee
  \setlength{\textwidth}{0.75\textwidth}
  \def\baselinestretch{1.5}
  \onecolumn
  \AtEndDocument{\listofobjects}%
\else
  \twocolumn
\fi
%\sloppy
\newcommand*{\doi}{}
\newcommand*{\DOI}[1]{\renewcommand*{\doi}{#1}}
\DOI{\textbf{\textit{please set DOI!}}}% -MWL- 2005-11-06
% copyrightline
\newcommand*{\yearofpublic}{}
\newcommand*{\yearofsubmission}{}
\newcommand*{\monthofpublic}{}
\newcommand*{\issue}{}
\newcommand*{\volume}{}
\newcommand*{\pages}{}
\newcommand*{\Yearpublication}[1]{\renewcommand*{\yearofpublic}{#1}}
\newcommand*{\Yearsubmission}[1]{\renewcommand*{\yearofsubmission}{#1}}
\newcommand*{\Month}[1]{\renewcommand*{\monthofpublic}{\two@digits{#1}}}
\newcommand*{\Volume}[1]{\renewcommand*{\volume}{#1}}
\newcommand*{\Issue}[1]{\renewcommand*{\issue}{#1}}
\newcommand{\fourdigits}[1]{%
\ifnum#1<10 000\else
\ifnum#1<100 00\else
\ifnum#1<1000 0\else
\ifnum#1<10000 \else
\fi\fi\fi\fi\number0#1}
%
\newcount\numa \newcount\numb \newcount\numc
\AtBeginDocument{
\numa=\yearofpublic
\numb=\numa 
\divide\numa by 100% --> \numa = century of publication
\numc=\numa 
\multiply\numc by 100
\advance\numb by-\numc% --> \numb = \yearofpublic mod 100
}%
%
\newcommand{\printyear}[1]{\two@digits{#1}}%
\newcommand*{\startpage}{\fourdigits{0}}
\newcommand*{\lastpage}{\fourdigits{0}}
%
\newcommand{\Pagespan}[2]{\setcounter{page}{#1}%
% \renewcommand*{\startpage}{\fourdigits{#1}}%
\def\startpage{#1}% -MWL- 2005-11-06
\if!#2!%
\def\lastpage{\pageref{ANlastpage}}%
\else
\def\lastpage{#2}%
\fi
% \renewcommand*{\pages}{#1--#2}%
\def\pages{\startpage\,--\,\lastpage}% -MWL- 2005-11-06
}
%
% \AtBeginDocument{\label{ANfirstpage}}
\AtEndDocument{\label{ANlastpage}}
%
% \Pagespan{0}{0}%        --> \startpage, \lastpage, \pages
\Pagespan{\thepage}{}% -MWL- 2005-11-21 --> \startpage, \lastpage, \pages
\Yearpublication{0000}% --> \yearofpublic
\Yearsubmission{0000}%  --> \yearofsubmission
\Month{00}%             --> \monthofpublic
\Volume{000}%           --> \volume
\Issue{00}%             --> \issue
\newcommand*{\ISSN}{0004-6337}
\newcommand*{\trailingtag}{\$~17.50+.50/0}
\newcommand*{\copyrightholder}{\yearofpublic\ WILEY-VCH Verlag GmbH\,\&\,Co.\,KGaA, Weinheim}
%
\flushbottom
% 
\def\squareforqed{\hbox{\rlap{$\sqcap$}$\sqcup$}}
\def\sq{\ifmmode\squareforqed\else{\unskip\nobreak\hfil
\penalty50\hskip1em\null\nobreak\hfil\squareforqed
\parfillskip=0pt\finalhyphendemerits=0\endgraf}\fi}

% AN commands -ADS 010997
\newcommand{\aba}{\renewcommand{\baselinestretch}{0,9}\noindent\small}
\newcommand{\abe}{\renewcommand{\baselinestretch}{1}\normalsize}
\def\refer {{\vspace{9mm}\hspace{18mm}{\bf References}\bigskip}}
\def\rf{\small\parindent=0.0cm\hangindent=10pt\hangafter=1\indent\par}
%
\def\aaa{A\&A~}
\def\aaas{A\&AS~}
\def\mnras{MNRAS~}
\def\aas{A\&AS~}
\def\aj{AJ~}
\def\apj{ApJ~}
\def\apjl{ApJ~}
\def\apjs{ApJS~}
\def\baas{BAAS~}
\def\pasp{PASP~}
\def\pasj{PASJ~}
\def\araa{ARA\&A~}
\def\an{AN~}
\def\apss{Ap\&SS~}
% 
\def\sun{\hbox{$\odot$}}
\def\la{\mathrel{\mathchoice%
{\vcenter{\offinterlineskip\halign{\hfil$\displaystyle##$\hfil\cr<\cr\sim\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\textstyle##$\hfil\cr<\cr\sim\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptstyle##$\hfil\cr<\cr\sim\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptscriptstyle##$\hfil\cr<\cr\sim\cr}}}}}
\def\ga{\mathrel{\mathchoice%
{\vcenter{\offinterlineskip\halign{\hfil$\displaystyle##$\hfil\cr>\cr\sim\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\textstyle##$\hfil\cr>\cr\sim\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptstyle##$\hfil\cr>\cr\sim\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptscriptstyle##$\hfil\cr>\cr\sim\cr}}}}}
\def\degr{\hbox{$^\circ$}}
\def\arcmin{\hbox{$^\prime$}}
\def\arcsec{\hbox{$^{\prime\prime}$}}
\def\utw{\smash{\rlap{\lower5pt\hbox{$\sim$}}}}
\def\udtw{\smash{\rlap{\lower6pt\hbox{$\approx$}}}}
\def\fd{\hbox{$.\!\!^{\rm d}$}}
\def\fh{\hbox{$.\!\!^{\rm h}$}}
\def\fm{\hbox{$.\!\!^{\rm m}$}}
\def\fs{\hbox{$.\!\!^{\rm s}$}}
\def\fdg{\hbox{$.\!\!^\circ$}}
\def\farcm{\hbox{$.\mkern-4mu^\prime$}}
\def\farcs{\hbox{$.\!\!^{\prime\prime}$}}
\def\fp{\hbox{$.\!\!^{\scriptscriptstyle\rm p}$}}
\def\cor{\mathrel{\mathchoice%
{\hbox{$\widehat=$}}
{\hbox{$\widehat=$}}
{\hbox{$\scriptstyle\hat=$}}
{\hbox{$\scriptscriptstyle\hat=$}}}}
\def\sol{\mathrel{\mathchoice%
{\vcenter{\offinterlineskip\halign{\hfil$\displaystyle##$\hfil\cr\sim\cr<\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\textstyle##$\hfil\cr\sim\cr<\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptstyle##$\hfil\cr\sim\cr<\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptscriptstyle##$\hfil\cr\sim\cr<\cr}}}}}
\def\sog{\mathrel{\mathchoice%
{\vcenter{\offinterlineskip\halign{\hfil$\displaystyle##$\hfil\cr\sim\cr>\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\textstyle##$\hfil\cr\sim\cr>\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptstyle##$\hfil\cr\sim\cr>\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptscriptstyle##$\hfil\cr\sim\cr>\cr}}}}}
\def\lse{\mathrel{\mathchoice%
{\vcenter{\offinterlineskip\halign{\hfil$\displaystyle##$\hfil\cr<\cr\simeq\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\textstyle##$\hfil\cr<\cr\simeq\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptstyle##$\hfil\cr<\cr\simeq\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptscriptstyle##$\hfil\cr<\cr\simeq\cr}}}}}
\def\gse{\mathrel{\mathchoice%
{\vcenter{\offinterlineskip\halign{\hfil$\displaystyle##$\hfil\cr>\cr\simeq\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\textstyle##$\hfil\cr>\cr\simeq\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptstyle##$\hfil\cr>\cr\simeq\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptscriptstyle##$\hfil\cr>\cr\simeq\cr}}}}}
\def\grole{\mathrel{\mathchoice%
{\vcenter{\offinterlineskip\halign{\hfil$\displaystyle##$\hfil\cr>\cr\noalign{\vskip-1.5pt}<\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\textstyle##$\hfil\cr>\cr\noalign{\vskip-1.5pt}<\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptstyle##$\hfil\cr>\cr\noalign{\vskip-1pt}<\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptscriptstyle##$\hfil\cr>\cr\noalign{\vskip-0.5pt}<\cr}}}}}
\def\leogr{\mathrel{\mathchoice%
{\vcenter{\offinterlineskip\halign{\hfil$\displaystyle##$\hfil\cr<\cr\noalign{\vskip-1.5pt}>\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\textstyle##$\hfil\cr<\cr\noalign{\vskip-1.5pt}>\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptstyle##$\hfil\cr<\cr\noalign{\vskip-1pt}>\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptscriptstyle##$\hfil\cr<\cr\noalign{\vskip-0.5pt}>\cr}}}}}
\def\loa{\mathrel{\mathchoice%
{\vcenter{\offinterlineskip\halign{\hfil$\displaystyle##$\hfil\cr<\cr\approx\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\textstyle##$\hfil\cr<\cr\approx\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptstyle##$\hfil\cr<\cr\approx\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptscriptstyle##$\hfil\cr<\cr\approx\cr}}}}}
\def\goa{\mathrel{\mathchoice%
{\vcenter{\offinterlineskip\halign{\hfil$\displaystyle##$\hfil\cr>\cr\approx\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\textstyle##$\hfil\cr>\cr\approx\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptstyle##$\hfil\cr>\cr\approx\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptscriptstyle##$\hfil\cr>\cr\approx\cr}}}}}
\def\diameter{{\ifmmode\mathchoice%
{\ooalign{\hfil\hbox{$\displaystyle/$}\hfil\crcr{\hbox{$\displaystyle\mathchar"20D$}}}}
{\ooalign{\hfil\hbox{$\textstyle/$}\hfil\crcr{\hbox{$\textstyle\mathchar"20D$}}}}
{\ooalign{\hfil\hbox{$\scriptstyle/$}\hfil\crcr{\hbox{$\scriptstyle\mathchar"20D$}}}}
{\ooalign{\hfil\hbox{$\scriptscriptstyle/$}\hfil\crcr{\hbox{$\scriptscriptstyle\mathchar"20D$}}}}
\else{\ooalign{\hfil/\hfil\crcr\mathhexbox20D}}%
\fi}}
\def\getsto{\mathrel{\mathchoice%
{\vcenter{\offinterlineskip\halign{\hfil$\displaystyle##$\hfil\cr\gets\cr\to\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\textstyle##$\hfil\cr\gets\cr\to\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptstyle##$\hfil\cr\gets\cr\to\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptscriptstyle##$\hfil\cr\gets\cr\to\cr}}}}}
\def\lid{\mathrel{\mathchoice%
{\vcenter{\offinterlineskip\halign{\hfil$\displaystyle##$\hfil\cr<\cr\noalign{\vskip1.2pt}=\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\textstyle##$\hfil\cr<\cr\noalign{\vskip1.2pt}=\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptstyle##$\hfil\cr<\cr\noalign{\vskip1pt}=\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptscriptstyle##$\hfil\cr<\cr\noalign{\vskip0.9pt}=\cr}}}}}
\def\gid{\mathrel{\mathchoice%
{\vcenter{\offinterlineskip\halign{\hfil$\displaystyle##$\hfil\cr>\cr\noalign{\vskip1.2pt}=\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\textstyle##$\hfil\cr>\cr\noalign{\vskip1.2pt}=\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptstyle##$\hfil\cr>\cr\noalign{\vskip1pt}=\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\scriptscriptstyle##$\hfil\cr>\cr\noalign{\vskip0.9pt}=\cr}}}}}
\def\bbbr{{\rm I\!R}} %reelle Zahlen
\def\bbbm{{\rm I\!M}}
\def\bbbn{{\rm I\!N}} %natuerliche Zahlen
\def\bbbf{{\rm I\!F}}
\def\bbbh{{\rm I\!H}}
\def\bbbk{{\rm I\!K}}
\def\bbbp{{\rm I\!P}}
\def\bbbone{{\mathchoice {\rm 1\mskip-4mu l} {\rm 1\mskip-4mu l}
{\rm 1\mskip-4.5mu l} {\rm 1\mskip-5mu l}}}
\def\bbbc{{\mathchoice%
{\setbox0=\hbox{$\displaystyle\rm C$}\hbox{\hbox to0pt{\kern0.4\wd0\vrule height0.9\ht0\hss}\box0}}
{\setbox0=\hbox{$\textstyle\rm C$}\hbox{\hbox to0pt{\kern0.4\wd0\vrule height0.9\ht0\hss}\box0}}
{\setbox0=\hbox{$\scriptstyle\rm C$}\hbox{\hbox to0pt{\kern0.4\wd0\vrule height0.9\ht0\hss}\box0}}
{\setbox0=\hbox{$\scriptscriptstyle\rm C$}\hbox{\hbox to0pt{\kern0.4\wd0\vrule height0.9\ht0\hss}\box0}}}}
\def\bbbq{{\mathchoice%
{\setbox0=\hbox{$\displaystyle\rm Q$}\hbox{\raise0.15\ht0\hbox to0pt{\kern0.4\wd0\vrule height0.8\ht0\hss}\box0}}
{\setbox0=\hbox{$\textstyle\rm Q$}\hbox{\raise 0.15\ht0\hbox to0pt{\kern0.4\wd0\vrule height0.8\ht0\hss}\box0}}
{\setbox0=\hbox{$\scriptstyle\rm Q$}\hbox{\raise 0.15\ht0\hbox to0pt{\kern0.4\wd0\vrule height0.7\ht0\hss}\box0}}
{\setbox0=\hbox{$\scriptscriptstyle\rm Q$}\hbox{\raise 0.15\ht0\hbox to0pt{\kern0.4\wd0\vrule height0.7\ht0\hss}\box0}}}}
\def\bbbt{{\mathchoice%
{\setbox0=\hbox{$\displaystyle\rm T$}\hbox{\hbox to0pt{\kern0.3\wd0\vrule height0.9\ht0\hss}\box0}}
{\setbox0=\hbox{$\textstyle\rm T$}\hbox{\hbox to0pt{\kern0.3\wd0\vrule height0.9\ht0\hss}\box0}}
{\setbox0=\hbox{$\scriptstyle\rm T$}\hbox{\hbox to0pt{\kern0.3\wd0\vrule height0.9\ht0\hss}\box0}}
{\setbox0=\hbox{$\scriptscriptstyle\rm T$}\hbox{\hbox to0pt{\kern0.3\wd0\vrule height0.9\ht0\hss}\box0}}}}
\def\bbbs{{\mathchoice%
{\setbox0=\hbox{$\displaystyle     \rm S$}\hbox{\raise0.5\ht0\hbox to0pt{\kern0.35\wd0\vrule height0.45\ht0\hss}\hbox to0pt{\kern0.55\wd0\vrule height0.5\ht0\hss}\box0}}
{\setbox0=\hbox{$\textstyle        \rm S$}\hbox{\raise0.5\ht0\hbox to0pt{\kern0.35\wd0\vrule height0.45\ht0\hss}\hbox to0pt{\kern0.55\wd0\vrule height0.5\ht0\hss}\box0}}
{\setbox0=\hbox{$\scriptstyle      \rm S$}\hbox{\raise0.5\ht0\hbox to0pt{\kern0.35\wd0\vrule height0.45\ht0\hss}\raise0.05\ht0\hbox to0pt{\kern0.5\wd0\vrule height0.45\ht0\hss}\box0}}
{\setbox0=\hbox{$\scriptscriptstyle\rm S$}\hbox{\raise0.5\ht0\hbox to0pt{\kern0.4\wd0\vrule height0.45\ht0\hss}\raise0.05\ht0\hbox to0pt{\kern0.55\wd0\vrule height0.45\ht0\hss}\box0}}}}
\def\bbbz{{\mathchoice%
{\hbox{$\sf\textstyle Z\kern-0.4em Z$}}
{\hbox{$\sf\textstyle Z\kern-0.4em Z$}}
{\hbox{$\sf\scriptstyle Z\kern-0.3em Z$}}
{\hbox{$\sf\scriptscriptstyle Z\kern-0.2em Z$}}}}
\def\ts{\thinspace}
\endinput
%%
%% End of file `an.cls'.


