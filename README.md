# TRB Template

This is a **third-party** LaTeX template for Transportation Research Board (TRB) submission, which was developed based on [TRB's official requirements](http://onlinepubs.trb.org/onlinepubs/AM/InfoForAuthors.pdf) in 2019 and may be updated in the future. 

On using this template, you should be aware that **you might need to alter this template to totally fit TRB's requirements.** It is recommended to compile your project over TeX Live due to its excellent packages support.

## How to Use

Download the class file (`trbart.cls`) into the main directory of your LaTeX project, then use `trbarticle` as the document class in your main LaTeX file:

```
\documentclass{trbart}
```

For packages usage, please:
- If the package has been loaded in the cls file, edit commands in the `trbart.cls` accordingly.
- If the package hasn't been loaded before, just load it via `\usepackage{...}` in the main LaTeX file.
 