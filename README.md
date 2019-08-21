# 'trbart': An unofficial TRB LaTeX Template

~ English | [中文](https://github.com/wklchris/TRB-template/blob/master/readme/README-cn.md)

This is a **unofficial** LaTeX template for Transportation Research Board (TRB) submission, which was developed based on TRB's official requirements (see [Info for Authors](http://onlinepubs.trb.org/onlinepubs/AM/InfoForAuthors.pdf) and [Criteria for Desk Rejections](http://onlinepubs.trb.org/onlinepubs/TRREM/CriteriaforDeskRejections2019.pdf)). This project was established in 2019 and will be maintained until the author doesn't want to maintain. 

On using this template, you should be aware that the author of this template is NOT responsible for rejections of inappropriate formated docs due to users' misusage/mismodification of this template. Please double check your final format before your submission to TRB.

## Dependencies

- This template is for LaTeX users who have installed a TeX Distribution ([TeX Live](https://www.tug.org/texlive/) is recommended), or use an online LaTeX platform like [Overleaf](https://www.overleaf.com/);
- XeLaTeX with Times New Roman font is the default setting (Overleaf also supports Times New Roman);
- For the bibliography part, `biblatex` package with `biber` backend is applied. There is no `BibTeX` requirement and nor is it used here.

You can read the `trbart.cls` file thoroughly to check the packages required by this template. Users with TeX Live (>=2017) fully installed don't need to install anything more. Last, an alternative way to check the dependencies is to try to compile the `example.tex` file. 

## Quick User Guide: How to Use

As a quick guide, you may follow these steps to use this template:

1. **Documentclass**: Download the class file (`trbart.cls`) into the main directory of your LaTeX project, then use `trbart` as the document class in your main LaTeX file:
    ```
    \documentclass{trbart}
    ```
    You can pass some options to it. For example, the fontsize:
    ```
    \documentclass[12pt]{trbart}
    ```
2. **Titlepage**: For titles (`\trbtitle`), authors (`\authors`) and related informations (`affils`, `\addresses`, and `\emails`) that should be shown on the titlepage, please search inside the `trbart.cls` file so that you can edit these accordingly. 
3. **Equations**: If you can, always use `equation` environment so that equations can be correctly numbered. For example, use `equation`-nested `aligned` environment instead of `align` environment. 
4. **References**: For citations, you should use a `refs.bib` file with Biber-style keys. Then in the LaTeX file, you can use `\autocite` command to cite everything.
   - The main differenc between Biber-style and BibTeX-style is that the `journal` key is replaced by `journaltitle` key in the `@article` reference class.  
   - As my personal suggestion, you can copy the BibTeX-style citation (research searching engines like Google Scholar often provide this), then replace every `jounral=` (if it's under an `@article` class) with `journaltitle=`.
5. **Compile**: This template is tested under XeLaTeX, so I also advise you to compile your final doc with XeLaTeX. You may need a `XeLaTeX -> Biber -> XeLaTeX -> XeLaTeX` compile chain. To configure your editor with such compile chain, here is a helpful link that you can't miss: [StackExchange - Configuring my editor to avoid undefined citations](https://tex.stackexchange.com/questions/154751/biblatex-with-biber-configuring-my-editor-to-avoid-undefined-citations). 

## Advanced guide

If you have compiled the `example.tex` by XeLaTeX-Biber compile chain, you will get a PDF that introduces this template with more details (in English). Or you can switch to [Releases page of this repo](https://github.com/wklchris/TRB-template/releases) to get the PDF (but possibly not in the latest version).

That PDF is designed for advanced users or developers. Even if you are not an experienced LaTeX user,you can still flip through it since it provides some examples that might help or inspire you.


## References

Thanks to all guides that helped me on developing this template, especially:
- biblatex:
  - [An example of customization of biblatex](https://tex.stackexchange.com/questions/386735/how-to-customize-biblatex-style)
  - [How to suppress "in:"](https://tex.stackexchange.com/questions/10682/suppress-in-biblatex)
  - [Left margin alignment of biblatex bibliography list](https://tex.stackexchange.com/questions/47092/left-margin-alignment-of-biblatexs-bibliography-list)
