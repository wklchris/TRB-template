# TRB Template

This is a **third-party** LaTeX template for Transportation Research Board (TRB) submission, which was developed based on TRB's official requirements (see [Info for Authors](http://onlinepubs.trb.org/onlinepubs/AM/InfoForAuthors.pdf) and [Criteria for Desk Rejections](http://onlinepubs.trb.org/onlinepubs/TRREM/CriteriaforDeskRejections2019.pdf)) in 2019 and may be updated in the future. 

On using this template, you should be aware that **you might need to alter this template to totally fit TRB's requirements**. 

## Dependencies

- A TeX Distribution installed ([TeX Live](https://www.tug.org/texlive/) is recommended), or using an online LaTeX platform like [Overleaf](https://www.overleaf.com/);
- XeLaTeX with Times New Roman font is the default setting (Overleaf also supports Times New Roman). If you prefer pdfLaTeX, please follow the comments in the class file (`trbart.cls`) to use `mathptmx` package and comment lines related to `fontspec`.

## How to Use

Download the class file (`trbart.cls`) into the main directory of your LaTeX project, then use `trbart` as the document class in your main LaTeX file:

```
\documentclass{trbart}
```

For packages usage, please:
- If the package has been loaded in the cls file, edit commands in the `trbart.cls` accordingly.
- If the package hasn't been loaded before, just load it via `\usepackage{...}` in the main LaTeX file.
 