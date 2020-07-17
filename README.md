# 'trbart': An unofficial TRB LaTeX Template

~ English | [中文](./readme/README-cn.md)

This is a **unofficial** LaTeX template for Transportation Research Board (TRB) submission, which was developed based on TRB's official requirements (see [Info for Authors](http://onlinepubs.trb.org/onlinepubs/AM/InfoForAuthors.pdf) and [Criteria for Desk Rejections](http://onlinepubs.trb.org/onlinepubs/TRREM/CriteriaforDeskRejections2019.pdf)). This project was established in 2019 and will be maintained until the author doesn't want to maintain. 

On using this template, you should be aware that the author of this template is NOT responsible for rejections of inappropriate formated docs due to users' misusage/mismodification of this template. Please double check your final format before your submission to TRB.

1. ['trbart': An unofficial TRB LaTeX Template](#trbart-an-unofficial-trb-latex-template)
   1. [Dependencies](#dependencies)
   2. [Quick User Guide: How to Use](#quick-user-guide-how-to-use)
      1. [Clone basic files](#clone-basic-files)
      2. [List of commands](#list-of-commands)
   3. [Advanced guide](#advanced-guide)
   4. [References](#references)

## Dependencies

- This template is for LaTeX users who have installed a TeX Distribution ([TeX Live](https://www.tug.org/texlive/) is recommended), or use an online LaTeX platform like [Overleaf](https://www.overleaf.com/);
- XeLaTeX with Times New Roman font is the default setting (Overleaf also supports Times New Roman);
- For the bibliography part, `biblatex` package is loaded. And you can choose either `bibtex` (default) or `biber` backend.

You can read the `trbart.cls` file thoroughly to check the packages required by this template. Users with TeX Live (>=2017) fully installed don't need to install anything more. Last, an alternative way to check the dependencies is to try to compile the `example.tex` file. 

## Quick User Guide: How to Use

It's recommended to read through this quick guide before trying out the template.

### Clone basic files

To start with this template, you may follow these steps:
1. Create a folder for your LaTeX project. If you are using Overleaf, create a new project.
2. Download (or copy the content of) the document class file `trbart.cls` and the blank template `blank.tex` (see it [here](./blank.tex)). Create a new bib file called `refs.bib`.
3. Rename the `blank.tex` to whatever you like. Start writing!
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
| **Preamble** |||
| `\trbtitle` | The title of the doc | `\trbtitle{Capitalized Title}` |
| `\trbauthor` | A comma-seperated list of authors | `\trbauthor{Tom Joe,Mo Lee}` |
| `\trbaffil` | A comma-seperated list of affiliations | `\trbaffil{Univ A,Univ B}` |
| `\trbaddress` | A comma-seperated list of addresses | `\trbaddress{{City, State},{C, S}}` |
| `\trbemail` | A comma-seperated list of emails | `\trbemail{a@eg.com,b@eg.net}` |
| `\trbwordcount` | Total word (excluding tables) of the doc | `\trbwordcount{5000}` |
| `\trbtablecount` | Total number of tables of the doc | `\trbtablecount{3}` |
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
