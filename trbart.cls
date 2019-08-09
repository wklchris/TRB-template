\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{trbart}[2019/08/09]

% --- Updated before 99th (Jan 2020) TRB meeting ---
% Requirements not controled by commands:
% * Single spaced
% * Abstract <= 250 words
% * Figures <= 6

% Doc class: fontsize>=10pt.
\LoadClass[oneside, 12pt]{article}
\DeclareOption{twosides}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Layout: 8.5x11 inch, normal margin.
\RequirePackage{geometry}
  \geometry{
    paperwidth=8.5in, paperheight=11in,
    hmargin=1in, vmargin=1in
  }

% Font: Times Roman.
%% For XeLaTeX users: install Times New Roman on your machine.
\RequirePackage{fontspec}
  \setmainfont{Times New Roman}
%% For pdfLaTeX users: use a Times font supported by mathptmx
% \usepackage{mathptmx}

% World count: 7500 max minus 250 for each table.

% Line numbers restart each page
\usepackage[pagewise,mathlines]{lineno}
  \renewcommand\linenumberfont{\normalfont\small}


% --- Other format implied by the sample ---
% Indent
\RequirePackage{indentfirst}
  \setlength{\parindent}{0.5in}

% Section title format
\RequirePackage[pagestyles]{titlesec}
  \titleformat{\section}{\bfseries}{}{0pt}{\uppercase}
  \titlespacing*{\section}{0pt}{\baselineskip}{0pt}
  \titleformat{\subsection}{\bfseries}{}{0pt}{}
  \titlespacing*{\subsection}{0pt}{\baselineskip}{0pt}
  \titleformat{\subsubsection}{\itshape}{}{0pt}{}
  \titlespacing*{\subsubsection}{0pt}{\baselineskip}{0pt}

% Tables
\RequirePackage{caption}
  \captionsetup{
    format=hang,
    labelsep=space,
    font=bf,
    indention=0in
  }
  \renewcommand\tablename{TABLE}
  \renewcommand\figurename{FIGURE}
\RequirePackage{booktabs, multirow}
\RequirePackage{tabularx}
  \newcolumntype{E}{>{\raggedleft\arraybackslash}X}
\RequirePackage{makecell}
  \renewcommand\theadfont{\bfseries}
  \renewcommand\theadalign{cc}
  \renewcommand\theadgape{}

% Figures
\RequirePackage{graphicx}
  \graphicspath{{./code/}, {./pics/}}

% Preprint
% \RequirePackage[blocks]{authblk}
%   \renewcommand\Authfont{\raggedright\bfseries}
%   \setlength{\affilsep}{0pt}

% Definition:
%   - title
%   - authors, affiliations and emails
\newcommand\email[1]{\href{mailto:#1}{#1}}
\newcommand{\trbtitle}{%
  TRB Template: an Introduction of `trbart' Documentclass
}
\newcommand{\NumberAuthors}{3}

\RequirePackage{arrayjobx}
  \newarray\authors
  \readarray{authors}{wklchris&Author Null&Author Null}
  \newarray\affils
  \readarray{affils}{Univ. Example&Univ. Null&Research Center Null}
  \newarray\addresses
  \readarray{addresses}{City, State Zipcode&City, State Zipcode&City, State Zipcode}
  \newarray\emails
  \readarray{emails}{\email{wklchris@hotmail.com}&No Email&No Email}

%% Redefinition of \maketitle
\RequirePackage{xparse, multido}
\NewDocumentCommand{\emptyline}{ O{1} }{%
  \linebreak%
  \multido{\i=1+1}{#1}{\mbox{}\linebreak}
}

\renewcommand{\maketitle}{
  \thispagestyle{empty}
  \begin{flushleft}
    \textbf{\trbtitle}\emptyline[2]
    %% Insert Authors
    \multido{\iAuthor=1+1}{\NumberAuthors}{%
      \textbf{\authors(\iAuthor)}\\
      \affils(\iAuthor)\\
      \addresses(\iAuthor)\\
      \emails(\iAuthor)\emptyline
    }
    %% Word Counts & Submission date
    Word count: 7000 words + 2 tables (250 words per table) = 7500 words
    \emptyline[2]
    \textit{Submitted August 1, 2000}
  \end{flushleft}
  \newpage
}


% Bibliography
\RequirePackage[english]{babel}
\RequirePackage{csquotes}
\RequirePackage[
  citestyle=numeric-comp,
  bibstyle=numeric,
  sorting=none,  % Sorted in citation order
  autocite=inline
]{biblatex}

%% Type: article
%% Remove quotation marks
\DeclareFieldFormat[article]{title}{#1\isdot}
%% Remove 'in:'
\renewbibmacro{in:}{%
  \ifentrytype{article}{}{\printtext{\bibstring{in}\intitlepunct}}}

\addbibresource{refs.bib}

\newcommand\printtrbrefs{
  \newpage\nolinenumbers%
  \printbibliography[title=REFERENCES]
}

% --- User Customization ---
\RequirePackage[fleqn]{amsmath}
  \setlength{\mathindent}{0pt}
  \allowdisplaybreaks%
  %% User definitions
  \newcommand\ud{\mathop{}\negthinspace\mathrm{d}}
  \newcommand\pfrac[2]{\frac{\partial #1}{\partial #2}}
  %% Line number of equation: compatiblity for 'fleqn' of amsmath
  \makeatletter
  \let\oldequation\equation
  \let\oldendequation\endequation
  \renewenvironment{equation}
    {\linenomathWithnumbers\oldequation}
    {\oldendequation\endlinenomath}
  \makeatother

\RequirePackage{mathtools}
  \DeclarePairedDelimiter\ceil{\lceil}{\rceil}
  \DeclarePairedDelimiter\floor{\lfloor}{\rfloor}

% Highlights
\RequirePackage{xcolor}
  \newcommand\tbd[1]{\textcolor{red}{(#1)}}

% Lists
\usepackage[inline]{enumitem}
    \renewcommand{\theenumi}{\arabic{enumi}}
    \renewcommand{\labelenumi}{\theenumi.}
    \setlist[enumerate]{label=(\arabic*),leftmargin=*,itemsep=5pt,parsep=0pt,topsep=1ex,partopsep=0pt,listparindent=0.8\parindent}
    \setlist[itemize]{itemsep=5pt,parsep=0pt,topsep=1ex,partopsep=0pt,listparindent=0.8\parindent}
    \setlist[itemize, 2]{label={$\star$}}
    \setlist[description]{font=\bfseries\ttfamily~,itemsep=5pt,parsep=0pt,topsep=1ex,partopsep=0pt}

% Cross references & URLs
% \usepackage[hyphens]{url}  % allow URL line breaks
\usepackage[hidelinks]{hyperref}
  \hypersetup{
    %pdfpagemode=UseNone,
    bookmarksopen = true, bookmarksnumbered = true,
    pdftitle=template,
    pdfauthor=wklchris,
    pdfstartview=FitH,
    breaklinks=true
  }
  % Redefine autoref with bold font
  \makeatletter
  \let\originautoref\autoref
  \def\autoref#1{\textbf{\originautoref{#1}}}
  \makeatother