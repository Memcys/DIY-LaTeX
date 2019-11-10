# LaTeX引用参考文献

2019.11.09    

参考书籍：《lshort-zh-cn》、刘海洋《LaTeX入门》、包太雷《Inote2》、《ltxprimer》

## 1. 引言

利用LaTeX引用参考文献较原始的方法是用 thebibliography环境和`\bibitem`命令来定义参考文献条目，但功能简陋，用户需要自己调整显示格式。**现在更常用BibTeX工具引用参考文献，这也是本文介绍的重点。**最后会简要介绍 thebibliography环境，因为有小部分期刊要求使用该格式。

在引用前需要先获取文献数据库，里面包括所要引用文献的类型、标题、作者、年代等信息。获取文献数据库的方式主要有：

+ 从数据库网站下载，如arXiv、Google Scholar、Web of Science、ADS、INSPIRE...
+ 利用文献管理软件导出，常用的文献管理软件包括Endnote、JabRef、Zotero、Mendeley、Citavi...



## 2. BibTeX

使用BibTeX引用参考文献主要涉及到BibTeX的文献数据库和引用样式。BibTeX数据库是以  **.bib** 结尾的文件，里面包含若干文献条目；LaTeX内置一些默认的引用样式，某些期刊会使用自己的样式文件，通常以 **.bst**结尾。普通用户一般不需要改动样式文件，只须维护数据库。

### 2.1  BibTeX数据库

一个典型的.bib文件如下： 

```
@ARTICLE{2020Chmsp.241l4968X,
       author = {{Xun}, Xiaogang and {Cheng}, Jie and {Wang}, Jing and {Li}, Yangping and {Li}, Xu and {Li}, Moli and {Lou}, Jiarun and {Kong}, Yifan and {Bao}, Zhenmin and {Hu}, Xiaoli},
        title = "{Solute carriers in scallop genome: Gene expansion and expression regulation after exposure to toxic dinoflagellate}",
      journal = {Chemosphere},
         year = "2020",
        month = "Feb",
       volume = {241},
        pages = {124968},
          doi = {10.1016/j.chemosphere.2019.124968},
       adsurl = {https://ui.adsabs.harvard.edu/abs/2020Chmsp.241l4968X},
      adsnote = {Provided by the SAO/NASA Astrophysics Data System}
}

@ARTICLE{2020NIMPA.95062907S,
       author = {{Song}, Y.~P. and {Jing}, H.~T. and {Tang}, J.~Y. and {He}, M. and {Bao}, Y.},

       ......
```

+ 第一行的`@` 表示另起一个新的条目 ，`ARTICLE` 表示该文献的类别，其它常见的 BibTeX文献类别包括book、incollection等。对每一种文献类型，一个条目里都有许多不同信息，有些是必需的，有些是可选的，详情见附录。必需信息如果缺失，BibTeX在处理时会发出警告，并以问号排版缺失的部分。如果遇到未定义的信息，BibTeX会忽略它。
+ `2020Chmsp.241l4968X` 是该文献的引用id。引用id仅仅用于BiBTeX引用文献时区分不同的条目，与文献本身无关，可以自己改为其它的id。

### 2.2 BibTex样式

参考文献的写法在不同文献里千差万别，包括作者、标题、年份等各项的顺序和字体样式、文献在列表中的排序规则等。基本的BibTeX文献格式包括plain、unsrt、alpha、abbrv，区别如下：

+ **plain**参考文献列表按作者姓氏排序，序号为阿拉伯数字；
+ **unsrt** 参考文献列表按正文中引用顺序排序，序号为阿拉伯数字；
+ **alpha** 参考文献列表按作者姓氏排序，序号为作者姓氏加年份；
+ **abbrv** 类似 plain 样式，作者名字、月份、期刊名等用缩写。

### 2.3  BibTeX使用方法

首先应**将.bib文件与.tex源文件放在同一文件夹下**，然后在**源代码中添加必要的命令**，一般的引用方式如下：

```latex
\documentclass{article}
\bibliographystyle{plain} %设定参考文献的格式
\begin{document}
\section{Some words}
Some excellent books, for example, \cite{id1} %这里的id即为所要引用的文献条目的id
and \cite{id2} \ldots
\bibliography{<bibname>} %指定使用的文献库，其中<bibname>为.bib文件名，此处不加.bib扩展名
\end{document}
```

之后就可以**编译**了。假设源文件名为demo.tex，旧的编译方式为(可以略去扩展名)：

```bash
xelatex demo   %生成没有文献列表的pdf文件，同时将引用信息写入.aux辅助文件
bibtex demo    %使用bibtex处理.aux文件，将信息写入.bbl文件
xelatex demo   %读入.bbl文件，将交叉引写入.aux文件中
xelatex demo   %生成有正确文献列表和引用的pdf文件
```

<img src="LaTeX引用参考文献.assets\image-20191110123713793.png" alt="image-20191110123713793" style="zoom:45%;" />

*上面的编译过程只是简要介绍，更详细过程可参考刘海洋《LaTeX入门》(2013年版) 的193~194页、212~215页。*

有多个子文档时，每个子文档中可以用`\bibliographystyle`设置不同的样式，编译时由**xelatex**编译主文档，**bibtex**编译子文档：

```bash
xelatex master(.tex)
bibtex chapter1(.tex)
bibtex chapter2(.tex)
...
xelatex master(.tex)
xelatex master(.tex)
```

#### 用latexmk完成所用工作：

为了简化目录、交叉引用、参考文献等编译过程的自动化操作，LaTeX发行版提供了`latexmk`命令，以实现一次性完成所有的编译过程，如：

```bash
latexmk -xelatex demo.tex
```
BibTeX 程序在生成参考文献列表的时候，通常只列出用了`\cite` 命令引用的部分。如果需要列出未被引用的文献，则需要 `\nocite{id}`  命令；而 `\nocite{*}`  则让所有未被引用的文献都列出。其它补充说明如下：

+ `\cite`可以带一个可选参数，如`\cite[\S~4.3]{id}`可能会得到 ”$[136, \S 4.3]$”。

+ `\bibliography{<bibname>}`可以同时从多个文献库中提取文献，只要将用到的所有文献数据库文件用逗号分开即可，如：`\bibliography{springer，ieee}` 

+ .bib文件的内容有可能在进入LaTeX编译前就被BibTeX程序改变大小写，因此在不希望改变大小写的地方，需要使用分组的方式

+ 可以在 .bib数据库中定义一种特殊的string类型，在其他文献中使用它来替代重复的部分。基本的文献格式中也预定义了这样一些宏。例如：

  ```
  @String{j-CJ="The Computer Journal"}
  @Article{Knuth97}
    title=      "Literate Programmming",
    month=      may # "-2",
    ...
  ```

  上面的 .bib文件定义了期刊名称的缩写 "j-CJ"，并使用了五月的缩写 may，其中 # 用来连接字符串与宏。


### 2.4  natbib 宏包

参考文献在正文中的引用通常有两种模式：作者-年份、数字。LaTeX 提供的`\cite`命令仅支持数字模式，而natlib 宏包的一个重要特性就是支持两种模式，作者-年份模式的命令如下：

+ `\citep{id}` 生成形如$(Axford\ et\ al., 2013)$ 的引用
+ `\citet{id}` 生成形如$Axford\ et\ al (2013)$ 的引用

正确地排版人名——年份引用依赖于特定的BIbTeX样式，natbib提供了与LaTeX预定义样式相对应的几个样式，包括 plainnat、abbrvnat 和 unsrtnat。学术论文模板是否支持 natbib，需要参考其帮助文档。

natbib提供了`\setcitestyle`命令来单独设置正文中的输出格式，比如：

<img src="LaTeX引用参考文献.assets\image-20191109170717524.png" alt="image-20191109170717524" style="zoom:55%;" />

`\setcitestyle`命令主要参数包括：

<img src="LaTeX引用参考文献.assets\image-20191109204938631.png" alt="image-20191109204938631" style="zoom: 55%;" />

natbib 宏包还提供了很多其它特性，现列举常用的如下：

+ 数字引用，并且将引用的序号压缩，例如 `\usepackage[numbers,sort&compress]{natbib}`  调用 natbib 宏包时指定以上选项后，连续引用多篇文献时，会生成形如 $(3-7)$ 的引用而不是 $(3,4,5,6,7)$。

+ 每一种引用命令都可以带一个$*$号，表示当文献作者有两人以上时，不缩略显示。例如：`\citet*{id}`

+ 标准的`\cite`只能带一个可选参数，而在natlib中引用命令(通常是`\citep`或数字模式引用的`\cite`) 则可以进一步带两个可选参数，分别表示引用前后增加的说明文字，例如：
     <img src="LaTeX引用参考文献.assets\image-20191110162126303.png" alt="image-20191110162126303" style="zoom:50%;" />

+ `\citettext`把任何文字看作括号中的引用，可以用该命令组合复杂的应用格式。例如：
      <img src="LaTeX引用参考文献.assets\image-20191110162306573.png" alt="image-20191110162306573" style="zoom:50%;" />

+ `\citealt`和`\citealp`分别是`\citet`和`\citep`不带括号的版本。

+ 部分引用：

<img src="LaTeX引用参考文献.assets\image-20191109215051277.png" alt="image-20191109215051277" style="zoom:75%;" />

有关natbib更多的说明和例子可以参考宏包的说明文档、刘海洋《LaTeX入门》或者《ltxprimer》的相应章节。



## 3. thebibliography环境

一个thebibliography环境通常如下：

```latex
\begin{thebibliography}{9}   %参数9为文献条目编号的宽度；如果有几十个条目，可以将该参数改为99
\bibitem{Riess}              %Riess为引用id
  A.~G.~Riess {\it et al.} [Supernova Search Team],
  \emph{Observational evidence from supernovae for an accelerating universe and a cosmological constant},
  Astron J  {\bf 116}, 1009 (1998)
  doi:10.1086/300499
  [astro-ph/9805201].
  CITATION = doi:10.1086/300499;
  11428 citations counted in INSPIRE as of 15 May 2019
\bibitem{Zhao}
 
  ... 
  
\end{thebibliography}
```

该环境一般也放在文档的末尾，`\end{document}`之前。在正文中用`\cite{id}`引用文献条目。编译一遍即可。

   

## 附录

不同文献类型的信息比较：
<img src="LaTeX引用参考文献.assets\image-20191109163041670.png" alt="image-20191109163041670" style="zoom:52%;" /> 
<img src="LaTeX引用参考文献.assets\image-20191109163218756.png" alt="image-20191109163218756" style="zoom:52%;" />