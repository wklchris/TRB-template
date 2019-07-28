\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{trbart}[2019/07/27]

% --- Updated before 99th (Jan 2020) TRB meeting ---
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
