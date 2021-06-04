[![make](https://github.com/yegor256/kdpcover/actions/workflows/make.yml/badge.svg)](https://github.com/yegor256/kdpcover/actions/workflows/make.yml)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/kdpcover/blob/master/LICENSE.txt)

This LaTeX class I use to format covers for [my books](https://www.yegor256.com/books.html), 
which I sell [on Amazon](https://www.amazon.com/Yegor-Bugayenko/e/B01AM1QMDK).

First, [install it](https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages)
from [CTAN](https://ctan.org/pkg/kdpcover) 
and then use in the preamble:

```tex
\documentclass{kdpcover}
\renewcommand*\theauthor{Jeff Lebowski}
\renewcommand*\thevolume{1}
\renewcommand*\thetitle{New Book About OOP}
\begin{document}
\ybPrintCover
\end{document}
```

If you want to contribute yourself, make a fork, then create a branch, 
then run `make` in the root directory.
It should compile everything without errors. If not, submit an issue and wait.
Otherwise, make your changes and then run `make` again. If the build is
still clean, submit a pull request.
