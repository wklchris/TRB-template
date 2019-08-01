\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{trbart}[2019/07/27]

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
  \titleformat{\section}{\bfseries\large}{}{0pt}{\uppercase}
  \titleformat{\subsection}{\bfseries}{}{0pt}{}
  \titleformat{\subsubsection}{\itshape}{}{0pt}{}

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
\RequirePackage[blocks]{authblk}
  \renewcommand\Authfont{\raggedright\bfseries}
  \setlength{\affilsep}{0pt}
  \newcommand\email[1]{\href{mailto:#1}{#1}}

% --- User Customization ---
\RequirePackage{amsmath}
  \allowdisplaybreaks%
\RequirePackage{mathtools}
  \DeclarePairedDelimiter\ceil{\lceil}{\rceil}
  \DeclarePairedDelimiter\floor{\lfloor}{\rfloor}

% Highlights
\RequirePackage{xcolor}
  \newcommand\tbd[1]{\textcolor{red}{(#1)}}

% --- Others ---
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