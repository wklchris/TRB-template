# 'trbart': An unofficial TRB LaTeX Template

~ English | [中文](./readme/README-cn.md)

This is a **unofficial** LaTeX template for Transportation Research Board (TRB) submission, which was developed based on TRB's official requirements (see [Info for Authors](http://onlinepubs.trb.org/onlinepubs/AM/InfoForAuthors.pdf) and [Criteria for Desk Rejections](http://onlinepubs.trb.org/onlinepubs/TRREM/CriteriaforDeskRejections2019.pdf)). This project was established in 2019 and will be maintained until the author doesn't want to maintain. 

On using this template, you should be aware that the author of this template is NOT responsible for rejections of inappropriate formated docs due to users' misusage/mismodification of this template. Please double check your final format before your submission to TRB.

Key features:

- **Fully automated** word \& table counts.
- Ready-to-use default format. None parameter adjustment is necessary.
- A list of shorcuts math commands.

1. ['trbart': An unofficial TRB LaTeX Template](#trbart-an-unofficial-trb-latex-template)
   1. [Dependencies](#dependencies)
   2. [Quick User Guide: How to Use](#quick-user-guide-how-to-use)
      1. [Use the template online: Overleaf](#use-the-template-online-overleaf)
      2. [Use the template locally: Clone basic files](#use-the-template-locally-clone-basic-files)
      3. [List of commands](#list-of-commands)
   3. [Advanced guide](#advanced-guide)
   4. [References](#references)

## Dependencies

- This template is for LaTeX users who have installed a TeX Distribution ([TeX Live](https://www.tug.org/texlive/) is recommended), or use an online LaTeX platform like [Overleaf](https://www.overleaf.com/);
- XeLaTeX with Times New Roman font is the default setting (Overleaf also supports Times New Roman);
- For the bibliography part, `biblatex` package is loaded. And you can choose either `bibtex` (default) or `biber` backend.

You can read the `trbart.cls` file thoroughly to check the packages required by this template. Users with TeX Live (>=2017) fully installed don't need to install anything more. Last, an alternative way to check the dependencies is to try to compile the `example.tex` file. 

## Quick User Guide: How to Use

It's recommended to read through this quick guide before trying out the template. You can use this template either on Overleaf or locally.

### Use the template online: Overleaf

> Notice: The Overleaf version may not be the latest one. I plan to update it to Overleaf annually (if there is any critical change).
>
> Currently it is a clone of commit ad4abe9 of this repo (on July 21, 2020). 

This template has been uploaded to Overleaf, serving at:

[An unofficial template for TRB meeting - Overleaf, Online LaTeX Editor](https://www.overleaf.com/latex/templates/trbart-an-unofficial-template-for-trb-meeting/hdpwdxtppqvt)

### Use the template locally: Clone basic files

You can use this template locally if you have LaTeX distribution installed on your machine. To start with this template, you may follow these steps:
1. Create a folder for your LaTeX project. If you are using Overleaf, create a new project.
2. Prepare following files:
   - Download the document class file `trbart.cls`.
   - Download the blank template `blank.tex`. 
   - Download the citation and bibliography style file `trb-authoryear.tex` and `trb-numeric.tex`.
   - Create a new bib file called `refs.bib` for your bibliography entries.
3. Rename the `blank.tex` to whatever you like. Then start writing!
4. Make sure you are using the `XeLaTeX` compiler (In Overleaf, there is a dropdown menu for compliers) before building the pdf.
5. (Advanced option) Though the default backend is Bibtex, you can switch it to Biber. 
   <details><summary>Click to show/hide details of the BibTeX/Biber reference backend</summary>

   You can switch it to Biber by editing the following line in the `trbart.cls`:
   ```tex
   \RequirePackage[..., backend=biber]{biblatex}
   ```
   - If you've switched to Biber, please replace all `title=` keys of `@article` references type in your `refs.bib` to renamed keys `journaltitle=`.
   - If you have configuration troubles switching to Biber backend, here is a useful link: [StackExchange - Configuring my editor to avoid undefined citations](https://tex.stackexchange.com/questions/154751/biblatex-with-biber-configuring-my-editor-to-avoid-undefined-citations).
   </details>

### List of commands

Here is the list of commands provided by this template. Only commands of different usage with the original LaTeX writing are listed.

| Commands | Description | Example |
| :--- | :--- | :--- |
| **Doc Options** |||
| `authoryearbib` | Use a customized authoryear style for bib | `\documentclass[authoryearbib]{trbart}` |
| `numericbib` | (Default, **Required in TRB draft**) Use the customized numeric style for bib | `\documentclass[numericbib]{trbart}` |
| `autowordcount` | (Default) Automatically count the words and number of tables | `\documentclass[autowordcount]{trbart}` |
| `manualwordcount` | Turn off auto count and manually input words \& tables count | `\documentclass[manualwordcount]{trbart}` |
| `<article options>` | Options that works for the traditional `article` doc class | `\documentclass[12pt]{article}` |
| **Preamble** |||
| `\trbtitle` | The title of the doc | `\trbtitle{Capitalized Title}` |
| `\trbauthor` | A comma-seperated list of authors | `\trbauthor{Tom Joe,Mo Lee}` |
| `\trbheader` | The text displayed on the page head. Usually authors' last names. | `\trbheader{Joe and Lee}` |
| `\trbaffil` | A comma-separated list of affiliations | `\trbaffil{Univ A,Univ B}` |
| `\trbaddress` | A comma-separated list of addresses | `\trbaddress{{City, State},{C, S}}` |
| `\trbemail` | A comma-separated list of emails | `\trbemail{a@eg.com,b@eg.net}` |
| `\trborcid` | (Optional) A comma-separated list of ORCIDs | `\trborcid{xxx-xxxx,yyyy-yyyy}` |
| `\trbwordcount` | (Not used by default) Total word (excluding tables) of the doc | `\trbwordcount{5000}` |
| `\trbtablecount` | (Not used by default) Total number of tables of the doc | `\trbtablecount{3}` |
| **Abstract** |||
| `\trbkeywords` | A comma-seperated list of keywords | `\trbkeywords{Traffic Flow,Transp}` |
| **Math**<sup>†</sup> |||
| `\mc[A-Z]` | A list of shortcuts for algebra usage | `\mcA` (i.e. `\mathscr{A}`) |
| `\mb[C,N,Q,R,Z,E]` | A list of shortcuts of number sets | `\mbN` (i.e. `\mathbb{N}`) |
| `\b[A-Z]` | A list of shortcuts of matrix symbols | `\bA` (i.e. `\boldsymbol{A}`) |
| `\b[i,j,k,u,v,x,y,z]` | A list of shortcuts for vector symbols | `\bx` (i.e. `\boldsymbol{x}`) |
| **References** |||
| `\printtrbrefs`| Print the references list | `\printtrbrefs` |
| **Misc** |||
| `\tbd` | A handy command for comments | `\tbd{Comment here}` | 
| `\tbdone` | Comments with a checkmark before it, implying that it has been accepted | `\tbdone{Comment}` |

<sup>†</sup> *In math environments under this template, it is **highly recommended to use {equation} environment** since it has been adjusted for better line numbering. For example, instead of using an {align} environment, use an {equation}-{aligned} nested environment.*

## Advanced guide

If you have compiled the `example.tex` by XeLaTeX-Biber/BibTeX compile chain, you will get a PDF that introduces this template with more details (in English). Or you can switch to [Releases page of this repo](https://github.com/wklchris/TRB-template/releases) to get the PDF (but possibly not in the latest version).

That PDF is designed for advanced users or developers. Even if you are not an experienced LaTeX user,you can still flip through it since it provides some examples that might help or inspire you.


## References

Thanks to all guides that helped me on developing this template, especially:
- biblatex:
  - [An example of customization of biblatex](https://tex.stackexchange.com/questions/386735/how-to-customize-biblatex-style)
  - [How to suppress "in:"](https://tex.stackexchange.com/questions/10682/suppress-in-biblatex)
  - [Left margin alignment of biblatex bibliography list](https://tex.stackexchange.com/questions/47092/left-margin-alignment-of-biblatexs-bibliography-list)
  - [Replace square with round brackets in both citations and bibliography](https://tex.stackexchange.com/a/341043/116054)
