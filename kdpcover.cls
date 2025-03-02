%%
%% This is file `kdpcover.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% kdpcover.dtx  (with options: `class')
%% (The MIT License)
%% 
%% Copyright (c) 2021-2025 Yegor Bugayenko
%% 
%% Permission is hereby granted, free of charge, to any person obtaining a copy
%% of this software and associated documentation files (the 'Software'), to deal
%% in the Software without restriction, including without limitation the rights
%% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%% copies of the Software, and to permit persons to whom the Software is
%% furnished to do so, subject to the following conditions:
%% 
%% The above copyright notice and this permission notice shall be included in all
%% copies or substantial portions of the Software.
%% 
%% THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
%% SOFTWARE.



\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kdpcover}
[2025/03/02 07.14.03 Cover for Kindle Direct Publishing books]























\LoadClass{article}

\makeatletter
\newcount\kdp@pages
  \kdp@pages=100
\newlength\kdp@xsize
  \setlength\kdp@xsize{6in}
\newlength\kdp@ysize
  \setlength\kdp@ysize{9in}
\makeatother

\RequirePackage{iexec}

\RequirePackage{pgfopts}
\makeatletter
\pgfkeys{
  /kdp/.cd,
  barless/.store in = \kdp@barless,
  pdf/.code = {
    \IfFileExists{#1}
      {}
      {\PackageError{kdpcover}{The "#1" file is absent}{}}%
    \iexec[trace,quiet,stdout=kdpcover-pages-count.txt]
      {qpdf --show-npages --no-warn #1 | tr -d '[[:space:]]'}
    \openin1=kdpcover-pages-count.txt
    \read1 to \temp
    \closein1
    \kdp@pages=\temp
  },
  6x9/.code = {
    \setlength\kdp@xsize{6in}
    \setlength\kdp@ysize{9in}
  },
  7x10/.code = {
    \setlength\kdp@xsize{7in}
    \setlength\kdp@ysize{10in}
  },
  8x10/.code = {
    \setlength\kdp@xsize{8in}
    \setlength\kdp@ysize{10in}
  },
  pages/.code = {
    \kdp@pages=#1
  }
}
\ProcessPgfPackageOptions{/kdp}
\makeatother

\RequirePackage{anyfontsize}
\RequirePackage{tikz}
\RequirePackage[letterspace=-50]{microtype}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{calc}

\RequirePackage{setspace}
  \setstretch{1.2}

\makeatletter
\newlength\kdp@height
  \setlength\kdp@height{0.125in + \kdp@ysize + 0.125in}
\newlength\kdp@width
  \setlength\kdp@width{
    0.125in + \kdp@xsize
    + 0.125in + \kdp@xsize
    + 0.0025in * \kdp@pages}
\makeatother

\RequirePackage{geometry}
\makeatletter
\geometry{
  paperwidth=\kdp@width,
  paperheight=\kdp@height,
  left=0pt,
  right=0pt,
  top=0pt,
  bottom=0pt
}
\makeatother

\RequirePackage[absolute]{textpos}
\TPGrid{16}{16}

\makeatletter
\newcommand\putSpine[2][kdpcover-signature]{%
  \ifdefined\kdp@barless\else%
    \begin{textblock}{2.4}[0.5,0](8,0)%
      \begin{tikzpicture}%
        \node [rectangle, inner sep=0em, fill=black,
        minimum width=2.4\TPHorizModule,
        minimum height=16\TPVertModule] at (0,0) {};
      \end{tikzpicture}%
    \end{textblock}%
  \fi%
  \begin{textblock}{1}[0.5,0](8,2)%
    \begin{tikzpicture}%
      \node [color=white, inner sep=0cm, outer sep=0cm,
        rotate=270, minimum height=\TPHorizModule] at (0,0) {
        \Large #2%
      };
    \end{tikzpicture}%
  \end{textblock}%
  \begin{textblock}{2.4}[0.5,1](8,14)%
    \centerline{\includegraphics[width=0.32in]{#1}}%
  \end{textblock}%
}
\makeatother

\newcommand\putPicture[1]{%
  \begin{textblock}{4}(10,2)%
    \includegraphics[width=\textwidth]{#1}
  \end{textblock}%
}

\newcommand\putVolume[1]{%
  \begin{textblock}{2}[1,1](15,14)%
    \raggedleft%
    \includegraphics[height=0.4in]{kdpcover-vol-#1}%
  \end{textblock}%
}

\newcommand\putPrice[1]{%
  \begin{textblock}{4}[0,1](1,2)%
    \small #1%
  \end{textblock}%
}

\newcommand\putBack[1]{%
  \begin{textblock}{5}[0,0](1,3)%
    \small #1%
  \end{textblock}%
}

\newcommand\putTitle[1]{%
  \begin{textblock}{5}(10,9)%
    \fontsize{32}{32}\selectfont #1%
  \end{textblock}%
}

\newcommand\putAuthor[1]{%
  \begin{textblock}{4}(10,10)%
    \large by #1%
  \end{textblock}%
}

\newcommand\putTLDR[1]{%
  \begin{textblock}{5}(10,11)%
    TL;DR #1%
  \end{textblock}%
}

\newcommand\putVersion[1]{%
  \begin{textblock}{4}[0,1](10,14)%
    #1%
    \IfFileExists{.git}
      {\quad\iexec{git log -n 1 --pretty='format:\%ad' --date='format:\%e-\%b-\%Y'}}
      {}%
  \end{textblock}%
}

\newcommand\putCopyright[2]{%
  \begin{textblock}{4}[0,1](1,14)%
    \small (c)~%
    #1 #2%
  \end{textblock}%
}

\AtBeginDocument{%
  \ttfamily%
  \raggedright%
  \setlength\parindent{0pt}%
  \setlength\parskip{0pt}%
  \interfootnotelinepenalty=10000%
}
\endinput
%%
%% End of file `kdpcover.cls'.
