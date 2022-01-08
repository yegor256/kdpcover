% (The MIT License)
%
% Copyright (c) 2021-2022 Yegor Bugayenko
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the 'Software'), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kdpcover}[00.00.0000 0.0.0 Cover for Kindle Direct Publishing books]
\LoadClass{article}

\makeatletter
\newcommand*\kdp@pages{100}
\newlength\kdp@xsize
\setlength\kdp@xsize{6in}
\newlength\kdp@ysize
\setlength\kdp@ysize{9in}
\makeatother

\RequirePackage{iexec}

\RequirePackage{xkeyval}

\makeatletter
\DeclareOptionX{6x9}{\setlength\kdp@xsize{6in}\setlength\kdp@ysize{9in}}
\DeclareOptionX{7x10}{\setlength\kdp@xsize{7in}\setlength\kdp@ysize{10in}}
\DeclareOptionX{8x10}{\setlength\kdp@xsize{8in}\setlength\kdp@ysize{10in}}
\DeclareOptionX{pages}{\renewcommand*\kdp@pages{#1}}
\DeclareOptionX{pdf}{%
  \iexec[trace,quiet,stdout=kdpcover-pages-count.txt]{qpdf --show-npages #1 | tr -d '[[:space:]]' | \{ cat; echo \%; \}}%
  \newread\kdp@pagescount%
  \openin\kdp@pagescount=kdpcover-pages-count.txt
  \read\kdp@pagescount to \kdp@pages%
}
\ProcessOptionsX\relax\makeatother

\RequirePackage{anyfontsize}
\RequirePackage{tikz}
\RequirePackage[letterspace=-50]{microtype}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{calc}

\RequirePackage{setspace}
  \setstretch{1.2}

% The height of the page is 9 inches plus 0.125 "bleed" on top and
% on the bottom.
% Check this doc: https://kdp.amazon.com/en_US/help/topic/G201953020
\makeatletter\newlength\kdp@height\makeatother%
\makeatletter\setlength\kdp@height{0.125in + \kdp@ysize + 0.125in}\makeatother%
% The width is 6 inches plus 0.125 "bleed" on each side. The width of the
% "spine" depends on the amount of pages in the book.
\makeatletter\newlength\kdp@width\makeatother
\makeatletter\setlength\kdp@width{0.125in + \kdp@xsize + 0.0025in * \kdp@pages + \kdp@xsize + 0.125in}\makeatother
\RequirePackage{geometry}
  \makeatletter
  \geometry{paperwidth=\kdp@width,paperheight=\kdp@height,left=0pt,right=0pt,top=0pt,bottom=0pt}
  \makeatother
\RequirePackage[absolute]{textpos}
  \TPGrid{16}{16}

\newcommand\putSpine[2][kdpcover-signature]{%
  \begin{textblock}{2.4}[0.5,0](8,0)%
    \begin{tikzpicture}%
      \node [rectangle, inner sep=0em, fill=black, minimum width=2.4\TPHorizModule, minimum height=16\TPVertModule] at (0,0) {};
    \end{tikzpicture}%
  \end{textblock}%
  \begin{textblock}{1}[0.5,0](8,2)%
    \begin{tikzpicture}%
      \node [color=white, inner sep=0cm, outer sep=0cm, rotate=270, minimum height=\TPHorizModule] at (0,0) {
        \Large #2
      };%
    \end{tikzpicture}%
  \end{textblock}%
  \begin{textblock}{2.4}[0.5,1](8,14)%
    \centerline{\includegraphics[width=0.32in]{#1}}%
  \end{textblock}%
}

\newcommand\putPicture[1]{%
  \begin{textblock}{4}(10,2)%
    \includegraphics[width=\textwidth]{#1}
  \end{textblock}%
}

\newcommand\putVolume[1]{%
  \begin{textblock}{2}[1,1](15,14)%
    \raggedleft
    \includegraphics[height=0.4in]{kdpcover-vol-#1}
  \end{textblock}%
}

\newcommand\putPrice[1]{%
  \begin{textblock}{4}[0,1](1,2)%
    \small #1
  \end{textblock}%
}

\newcommand\putBack[1]{%
  \begin{textblock}{5}[0,0](1,3)%
    \small #1
  \end{textblock}%
}

\newcommand\putTitle[1]{%
  \begin{textblock}{5}(10,9)%
    \fontsize{32}{32}\selectfont #1
  \end{textblock}%
}

\newcommand\putAuthor[1]{%
  \begin{textblock}{4}(10,10)%
    \large by #1
  \end{textblock}%
}

\newcommand\putTLDR[1]{%
  \begin{textblock}{5}(10,11)%
    TL;DR #1
  \end{textblock}%
}

\newcommand\putVersion[1]{%
  \begin{textblock}{4}[0,1](10,14)%
    #1
    \quad
    \iexec{git log -n 1 --pretty='format:\%ad' --date='format:\%e-\%b-\%Y'}
  \end{textblock}%
}

\newcommand\putCopyright[2]{%
  \begin{textblock}{4}[0,1](1,14)%
    \small (c)
    #1 #2
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
