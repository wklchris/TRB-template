\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{trbart}[2021/07/29]

% Repo: https://github.com/wklchris/TRB-template
% License: See the LICENSE file in the repository.

% For TRB's requirement, see: http://onlinepubs.trb.org/onlinepubs/AM/InfoForAuthors.pdf

% Requirements not controled by commands:
% * Single spaced
% * Abstract <= 250 words
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
   family=trbart,
   prefix=trbart@
}
\DeclareBoolOption[true]{numericbib}
\DeclareComplementaryOption{authoryearbib}{numericbib}
\DeclareBoolOption[true]{autowordcount}
\DeclareComplementaryOption{manualwordcount}{autowordcount}

% Doc class: fontsize>=10pt.
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
%% Use \ProcessOptions\relax if no 'kvoptions' pkg
\ProcessKeyvalOptions*
\LoadClass[10pt]{article}

% Layout: 8.5x11 inch, normal margin.
\RequirePackage{geometry}
  \geometry{
    paperwidth=8.5in, paperheight=11in,
    hmargin=1in, vmargin=1in,
    headheight=16pt  % Personal recommend, but can be customized
  }

% Font: Times Roman.
%% Please install Times New Roman on your machine.
\RequirePackage{fontspec}
  \setmainfont{Times New Roman}

% World count: 7500 max minus 250 for each table.

% Line numbers restart each page
\RequirePackage[pagewise,mathlines]{lineno}
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

% Page heads: Put author surnames and page number in page heads
\RequirePackage{fancyhdr}
\newcommand{\trbheader}[1]{%
    \fancyhf{}  % clear all fields
    \pagestyle{fancy}
        \lhead{\textit{#1}}
        \rhead{\thepage}
}
%% Remove separate line around head & foot
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Auto Count: avaliable when 'autowordcount' doc opotion is given
\iftrbart@autowordcount
  %% Count tables
  \RequirePackage{totcount} 
    \regtotcounter[auxfile=table.count]{table} 
  %% Count words: write to texcount.count file
  %% Overleaf uses (1,0,...,0) weights for the '-sum' arg. These weights are for:
  %%   text words, header words, caption words, #headers,
  %%   #floats, #inlined formulae, #displayed formulae
              #floats, #inlined formulae, #displayed formulae)
  \newtotcounter[auxfile=text.count]{word}
  \immediate\write18{texcount -1 -sum="1,0,0,0,0,0,0" -merge main.tex > texcount.count}
\fi

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

% Preprint: titlepage & abstract
% Definition:
%   - title
%   - authors, affiliations and emails
\newcommand\email[1]{\href{mailto:#1}{#1}}
\RequirePackage{expl3}
\ExplSyntaxOn%
%% Define the artitle title
\str_gclear:N \g_title_str
\NewDocumentCommand{\trbtitle}{m}{
  \str_gset:Nn \g_title_str {#1}
}

%% Define manual count command \trb[word,table]count.
%%   The total words will be computed automatically.
\clist_map_inline:nn {word,table} {
  \int_new:c {g_#1_int}
  \cs_gset:cpn {trb#1count} ##1 {
    \int_set:cn {g_#1_int} {##1}
  }
}
%% Auto count is enabled with the 'autowordcount' doc option
\iftrbart@autowordcount
  %% Auto table count by totcount package
  \int_set:cn {g_table_int} {\totvalue{table}}
  %% Auto word count by texcount command
  %%   Load the file into a token list then save it as int
  \tl_new:c {l_texcount_tl}
  \ior_new:N \l_texcount_stream
  \ior_open:Nn \l_texcount_stream {texcount.count}
  \ior_get:NN \l_texcount_stream \l_texcount_tl
  \ior_close:N \l_texcount_stream
  \int_set:cn {g_word_int} {\l_texcount_tl}
\fi

%% Define a list of \trb* functions
\clist_map_inline:nn {author,affil,address,email,orcid} {
  \clist_gclear_new:c {g_#1_clist}
  \cs_gset:cpn {trb#1} ##1 {
    \clist_gset:cn {g_#1_clist} {##1}
  }
}

%% Redefinition of \maketitle
\DeclareDocumentCommand{\maketitle}{}{
  \thispagestyle{empty}
  \int_new:N \l_author_num_int
  \int_set:Nn \l_author_num_int {
    \clist_count:N \g_author_clist
  }
  \int_set:Nn \l_tmpa_int { 1 }
  \begin{flushleft}
  \textbf{\str_use:N \g_title_str}\linebreak\mbox{}\linebreak
  \int_do_while:nn { \l_tmpa_int <= \l_author_num_int } {
    \textbf{\clist_item:Nn \g_author_clist {\l_tmpa_int}}\linebreak
    \clist_item:Nn \g_affil_clist {\l_tmpa_int}\linebreak
    \clist_item:Nn \g_address_clist {\l_tmpa_int}\linebreak
    \email{\clist_item:Nn \g_email_clist {\l_tmpa_int}}\linebreak
    ORCID:~\clist_item:Nn \g_orcid_clist {\l_tmpa_int}
    \linebreak\mbox{}\linebreak
    \int_incr:N \l_tmpa_int
  }
  %% Word Counts & Submission date
  Word~count:~{\int_use:N \g_word_int}~words~+~{\int_use:N \g_table_int}~tables~(250~words~per~table)~=~{\int_eval:n {\g_word_int + \g_table_int*250}}~words
  \end{flushleft}
  \newpage
}
\ExplSyntaxOff%
%% Abstract-related definitions
\newcommand\trbkeywords[1]{\noindent\textbf{Keywords}:~#1\newpage}

% Bibliography
%%   TRB draft must use numeric style.
\RequirePackage[english]{babel}
\RequirePackage{csquotes}
\iftrbart@numericbib
  \input{trb-numeric}
\else
  \input{trb-authoryear}
\fi
\addbibresource{refs.bib}

%% Remove quotation marks (in 'title')
\DeclareFieldFormat[article,inproceedings]{title}{#1\isdot}
%% Remove 'in:' for articles and inproceedings
\renewbibmacro{in:}{%
  \ifboolexpr{%
     test {\ifentrytype{article}}%
     or
     test {\ifentrytype{inproceedings}}%
  }{}{\printtext{\bibstring{in}\intitlepunct}}%
}
%% Remove brackets around label numbers in the biblio list
\DeclareFieldFormat{labelnumberwidth}{#1\adddot} 
%% Define a simple command to print bibliography
\newcommand\printtrbrefs{
  \clearpage%
  \noindent\printbibliography[title=REFERENCES]%
  \nolinenumbers
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

\RequirePackage{mathrsfs}
\RequirePackage{amssymb}
\ExplSyntaxOn
\clist_gclear_new:N \g_capalph_clist
\clist_gset:Nn \g_capalph_clist {
  A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z
}
\NewDocumentCommand{\defmathfonts}{m m o}{
  \clist_clear_new:N \l_mfloop_clist
  \IfNoValueTF{#3}{
    \clist_set_eq:NN \l_mfloop_clist \g_capalph_clist
  }{ \clist_set:Nn \l_mfloop_clist {#3} }
  \clist_map_inline:Nn \l_mfloop_clist {
    \cs_new_protected_nopar:cpn {#2} {#1{##1}}
  }
}
\ExplSyntaxOff
\defmathfonts{\mathbb}{mb#1}[C,N,Q,R,Z,E]
\defmathfonts{\mathscr}{mr#1}
\defmathfonts{\boldsymbol}{b#1}
\defmathfonts{\boldsymbol}{b#1}[i,j,k,u,v,x,y,z]


\RequirePackage{mathtools}
  \DeclarePairedDelimiter\ceil{\lceil}{\rceil}
  \DeclarePairedDelimiter\floor{\lfloor}{\rfloor}

% Highlights
\RequirePackage{xcolor}
    \newcommand\tbd[1]{\textcolor{blue}{(#1)}}
    \newcommand\tbdone[1]{\textcolor{blue}{\checkmark~(#1)}}

% Lists
\RequirePackage[inline]{enumitem}
    \renewcommand{\theenumi}{\arabic{enumi}}
    \renewcommand{\labelenumi}{\theenumi.}
    \setlist[enumerate]{label=(\arabic*),leftmargin=*,itemsep=5pt,parsep=0pt,topsep=1ex,partopsep=0pt,listparindent=0.8\parindent}
    \setlist[itemize]{itemsep=5pt,parsep=0pt,topsep=1ex,partopsep=0pt,listparindent=0.8\parindent}
    \setlist[itemize, 2]{label={$\star$}}
    \setlist[description]{font=\bfseries\ttfamily~,itemsep=5pt,parsep=0pt,topsep=1ex,partopsep=0pt}
%% Inline enumarate list
\newlist{enuminline}{enumerate*}{1}
\setlist*[enuminline,1]{
    label=(\arabic*),
    before=\unskip{: },
    itemjoin={{; }}, itemjoin*={{, and }}
}

% Cross references & URLs
% \RequirePackage[hyphens]{url}  % allow URL line breaks
\RequirePackage[hidelinks]{hyperref}
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