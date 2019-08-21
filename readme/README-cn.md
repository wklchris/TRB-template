# 'trbart': 一个非官方的 TRB 投稿 LaTeX 模板

~ [English](https://github.com/wklchris/TRB-template/blob/master/README.md) | 中文

这是一个 **非官方** 的 Transportation Research Board (TRB) 论文 LaTeX 模板，根据 TRB 官方给出的要求（参考 [Info for Authors](http://onlinepubs.trb.org/onlinepubs/AM/InfoForAuthors.pdf) 与 [Criteria for Desk Rejections](http://onlinepubs.trb.org/onlinepubs/TRREM/CriteriaforDeskRejections2019.pdf) 页面）制作而成。本项目在 2019 年启动，并将会一直被维护直到作者不再想维护为止。

在使用本模板时，您需要明白，该模板的作者 *不会* 对因用户对该模板的错误使用或编辑导致的拒稿负责。请在递交至 TRB 前仔细检查您稿件的格式。

## 依赖项

- 本模板是为安装有本地 TeX 发行版（推荐使用 [TeX Live](https://www.tug.org/texlive/)）或使用类似 [Overleaf](https://www.overleaf.com/) 在线 LaTeX 平台的用户而撰写的；
- XeLaTeX 与 Times New Roman 字体是本模板的缺省设置（Overleaf 也支持 Times New Roman）；
- 对参考文献部分，本模板使用了宏包 `biblatex` 与后端 `biber`。本模板不需要 `BibTeX` 组件，也并不会用到它。

您可以完整地阅读 `trbart.cls` 文件来检查哪些宏包是为此模板所需的。完整安装了 TeX Live (>=2017) 的用户不需要安装任何额外的组件。最后指出，另一种检查依赖项的方式是尝试编译 `example.tex` 文档。

## 快速用户指南：如何使用

您可以按照下述步骤来使用本模板：

1. **文档类**：将 `trbart.cls` 文件下载到您 LaTeX 项目的主目录中，然后在您而主 LaTeX 文件中使用 `trbart` 作为文档类：
   ```
   \documentclass{trbart}
   ```
   您可以向它传递参数，例如字号：
   ```
   \documentclass[12pt]{trbart}
   ```
2. **标题页**：对于应显示在标题页中的标题（`\trbtitle`）、作者（`\authors`）与其他相关信息（`affils`, `\addresses` 与 `\emails`），请在 `trbart.cls` 文件中搜索对应命令以便能够更改。
3. **公式**：请尽可能地使用 `equation` 环境，以便所有公式都能被正常编号。例如，不使用 `align` 环境，而是使用嵌套在 `equation` 环境内的 `aligned` 环境。
4. **参考文献**：您需要使用一个名为 `refs.bib` 的文件来作为参考文献文件，且应使用 Biber 风格的键名。然后您可以在 LaTeX 文档中利用 `\autocite` 公式来引用文献。
   - Biber 风格与 BibTeX 风格的主要区别是： `@article` 文献类中的 `journal` 键被更改为了 `journaltitle` 键。
   - 我个人的建议是，您可以复制 BibTeX 风格的条目（学术引擎如 Google 学术常常会提供这种），然后将 `@article` 文献类下的所有 `jounral=` 都替换为 `journaltitle=`。
5. **编译**：本模板是在 XeLaTeX 下测试通过的，因此我也建议您使用 XeLaTeX 来编译该文档。您可能需要一个 `XeLaTeX -> Biber -> XeLaTeX -> XeLaTeX` 编译链来实现这一点。关于如何在编辑器中配置该编译链，这里有一篇不可错过的实用链接：[StackExchange - Configuring my editor to avoid undefined citations](https://tex.stackexchange.com/questions/154751/biblatex-with-biber-configuring-my-editor-to-avoid-undefined-citations)。


## 高级指南

如果您已经用 XeLaTeX-Biber 链来编译了 `example.tex` 文件，您会得到一个更详细介绍了该模板的 PDF 文件（英文）。或者，您也可以前往 [Release 页面](https://github.com/wklchris/TRB-template/releases) 来获取该 PDF （但这样得到的或许不是最新版）。

这个 PDF 是为了高级用户或者开发者准备的。即便您不是一个资深的 LaTeX 用户，您仍然可以快速地翻阅一下它——因为它提供了可能会帮助或启发您的一些用法示例。


## 参考文献

感谢所有帮助我完成此模板的指导，特别是：
- biblatex:
  - [An example of customization of biblatex](https://tex.stackexchange.com/questions/386735/how-to-customize-biblatex-style)
  - [How to suppress "in:"](https://tex.stackexchange.com/questions/10682/suppress-in-biblatex)
  - [Left margin alignment of biblatex bibliography list](https://tex.stackexchange.com/questions/47092/left-margin-alignment-of-biblatexs-bibliography-list)