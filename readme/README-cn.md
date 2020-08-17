# 'trbart': 一个非官方的 TRB 投稿 LaTeX 模板

~ [English](../README.md) | 中文

这是一个 **非官方** 的 Transportation Research Board (TRB) 论文 LaTeX 模板，根据 TRB 官方给出的要求（参考 [Info for Authors](http://onlinepubs.trb.org/onlinepubs/AM/InfoForAuthors.pdf) 与 [Criteria for Desk Rejections](http://onlinepubs.trb.org/onlinepubs/TRREM/CriteriaforDeskRejections2019.pdf) 页面）制作而成。本项目在 2019 年启动，并将会一直被维护直到作者不再想维护为止。

在使用本模板时，您需要明白，该模板的作者 *不会* 对因用户对该模板的错误使用或编辑导致的拒稿负责。请在递交至 TRB 前仔细检查您稿件的格式。

1. ['trbart': 一个非官方的 TRB 投稿 LaTeX 模板](#trbart-一个非官方的-trb-投稿-latex-模板)
   1. [依赖项](#依赖项)
   2. [快速用户指南：如何使用](#快速用户指南如何使用)
      1. [在线使用该模板: Overleaf](#在线使用该模板-overleaf)
      2. [本地使用该模板：复制基础文件](#本地使用该模板复制基础文件)
      3. [命令列表](#命令列表)
   3. [高级指南](#高级指南)
   4. [参考文献](#参考文献)

## 依赖项

- 本模板是为安装有本地 TeX 发行版（推荐使用 [TeX Live](https://www.tug.org/texlive/)）或使用类似 [Overleaf](https://www.overleaf.com/) 在线 LaTeX 平台的用户而撰写的；
- XeLaTeX 与 Times New Roman 字体是本模板的缺省设置（Overleaf 也支持 Times New Roman）；
- 对参考文献部分，本模板使用了宏包 `biblatex`。你可以选择使用 Bibtex 后端（默认）或者 Biber 后端。

您可以完整地阅读 `trbart.cls` 文件来检查哪些宏包是为此模板所需的。完整安装了 TeX Live (>=2017) 的用户不需要安装任何额外的组件。最后指出，另一种检查依赖项的方式是尝试编译 `example.tex` 文档。

## 快速用户指南：如何使用

在开始试用模板前，建议阅读“快速用户指南”（本节）的全部内容。您可以选择在 Overleaf 上使用，或者在本地使用。

### 在线使用该模板: Overleaf

> 请注意：在 Overleaf 上的版本可能不是最新的。如有重要更新，我将每年更新一次 Overleaf 模板。
> 
> 目前它对应本仓库的 ad4abe9 提交（2020 年 7 月 21 日）。

该模板已经被上传至 Overleaf，链接于：

[An unofficial template for TRB meeting - Overleaf, Online LaTeX Editor](https://www.overleaf.com/latex/templates/trbart-an-unofficial-template-for-trb-meeting/hdpwdxtppqvt)


### 本地使用该模板：复制基础文件

如果您已在本地安装了 LaTeX 套件，您可以在本地使用该模板。请依照以下步骤开始使用本模板：
1. 为你的 LaTeX 项目创建一个文件夹。如果你使用 Overleaf，创建一个新项目。
2. 准备以下文件：
   - 下载文档类文件 `trbart.cls`.
   - 下载空白模板文件 `blank.tex`. 
   - 下载引用与文献格式文件 `trb-authoryear.tex` 与 `trb-numeric.tex`.
   - 新建一个 `refs.bib` 文件来存放参考文献。
3. 将 `blank.tex` 重命名为你喜爱的名称。开始写作吧！
4. 在编译 pdf 之前，确认你配置了 `XeLaTeX` 作为编译器 (对于Overleaf 用户，菜单中有一个选择编译器的下拉选项)。
5. （高级功能） 虽然默认的文献后端是 `BibTeX`，你也可以切换成 `Biber`。 
   <details><summary>点击以展开/折叠关于 BibTeX/Biber 文献后端的更多信息</summary>

   你可以通过更改 `trbart.cls` 文件中以下行来切换为 Biber 后端:
   ```tex
   \RequirePackage[..., backend=biber]{biblatex}
   ```
   - I如果你选择 Biber 后端，请将 `refs.bib` 文件中所有 `@article` 类型下的 `title=` 键都重命名为 `journaltitle=`。
   - 如果你在转向 Biber 的过程中出现了配置问题，这里有一个实用链接：[StackExchange - Configuring my editor to avoid undefined citations](https://tex.stackexchange.com/questions/154751/biblatex-with-biber-configuring-my-editor-to-avoid-undefined-citations).
   </details>

### 命令列表

这里列出了一个该模板提供的命令列表。只有与原生 LaTeX 用法不同的命令才在此处列出。

| 命令 | 描述 | 用例 |
| :--- | :--- | :--- |
| **文档选项** |||
| `authoryearbib` | 使用自定义的 authoryear 引用格式 | `\documentclass[authoryearbib]{trbart}` |
| `numericbib` | （默认，**TRB送审稿件要求**）使用自定义的 numeric 引用格式 | `\documentclass[numericbib]{trbart}` |
| `<article options>` | 原 `article` 文档类可接受的选项 | `\documentclass[12pt]{article}` |
| **导言区** |||
| `\trbtitle` | 文档标题 | `\trbtitle{Capitalized Title}` |
| `\trbauthor` | 逗号分隔的作者列表 | `\trbauthor{Tom Joe,Mo Lee}` |
| `\trbaffil` | 逗号分隔的机构列表 | `\trbaffil{Univ A,Univ B}` |
| `\trbaddress` | 逗号分隔的地址列表 | `\trbaddress{{City, State},{C, S}}` |
| `\trbemail` | 逗号分隔的邮件列表 | `\trbemail{a@eg.com,b@eg.net}` |
| `\trbwordcount` | 除表格外的全文字数 | `\trbwordcount{5000}` |
| `\trbtablecount` | 全文表格数量 | `\trbtablecount{3}` |
| **摘要** |||
| `\trbkeywords` | 逗号分隔的关键字 | `\trbkeywords{Traffic Flow,Transp}` |
| **数学环境**<sup>†</sup> |||
| `\mc[A-Z]` | 一组代数简便命令 | `\mcA`（即 `\mathscr{A}`） |
| `\mb[C,N,Q,R,Z,E]` | 一组数集简便命令 | `\mbN`（即 `\mathbb{N}`） |
| `\b[A-Z]` | 一组矩阵符号简便命令 | `\bA`（即 `\boldsymbol{A}`） |
| `\b[i,j,k,u,v,x,y,z]` | 一组向量符号简便命令 | `\bx`（即 `\boldsymbol{x}`） |
| **参考文献** |||
| `\printtrbrefs`| 输出参考文献列表 | `\printtrbrefs` |
| **杂项** |||
| `\tbd` | 一个简易的注释命令 | `\tbd{Comment here}` | 

<sup>†</sup> *在本模板下的数学环境中，**强烈推荐使用 {equation} 环境**。因为针对行号功能，该环境被特殊处理过。例如，请在可以使用 {align} 环境的场合，改用 {equation}-{aligned} 这种嵌套环境。*


## 高级指南

如果您已经用 XeLaTeX-Biber/BibTeX 链来编译了 `example.tex` 文件，您会得到一个更详细介绍了该模板的 PDF 文件（英文）。或者，您也可以前往 [Release 页面](https://github.com/wklchris/TRB-template/releases) 来获取该 PDF （但这样得到的或许不是最新版）。

这个 PDF 是为了高级用户或者开发者准备的。即便您不是一个资深的 LaTeX 用户，您仍然可以快速地翻阅一下它——因为它提供了可能会帮助或启发您的一些用法示例。


## 参考文献

感谢所有帮助我完成此模板的指导，特别是：
- biblatex:
  - [An example of customization of biblatex](https://tex.stackexchange.com/questions/386735/how-to-customize-biblatex-style)
  - [How to suppress "in:"](https://tex.stackexchange.com/questions/10682/suppress-in-biblatex)
  - [Left margin alignment of biblatex bibliography list](https://tex.stackexchange.com/questions/47092/left-margin-alignment-of-biblatexs-bibliography-list)
  - [Replace square with round brackets in both citations and bibliography](https://tex.stackexchange.com/a/341043/116054)