[![make](https://github.com/yegor256/kdpcover/actions/workflows/latexmk.yml/badge.svg)](https://github.com/yegor256/kdpcover/actions/workflows/latexmk.yml)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/kdpcover/blob/master/LICENSE.txt)

This LaTeX class I use to format covers for [my books](https://www.yegor256.com/books.html), 
which I sell [on Amazon](https://www.amazon.com/Yegor-Bugayenko/e/B01AM1QMDK).
The problem this class solves is [the necessity](https://kdp.amazon.com/en_US/help/topic/G201953020) 
to change the size of the cover PDF respectfully 
to the number of pages in the book — the bigger
the book, the larger must be the cover. The provided class makes necessary
calculations on-fly, using the [`qpdf`](http://qpdf.sourceforge.net/) tool. Obviously,
you need to have it installed. Also, you must
run `pdflatex` with the `--shell-escape` option, in order to allow LaTeX to run `qpdf`.

First, [install it](https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages)
from [CTAN](https://ctan.org/pkg/kdpcover) 
and then use in the preamble:

```tex
\documentclass[pdf=my-book.pdf]{kdpcover}
\begin{document}
% Here you print the cover as you wish, but I recommend
% you to use the commands available in the class, such as:
\putSpine{my book, vol. 1}
\putAuthor{Yegor Bugayenko}
\end{document}
```

The full example and all commands are available in the 
[`kdpcover.tex`](https://github.com/yegor256/kdpcover/blob/master/kdpcover.tex) file.

If you want to contribute yourself, make a fork, then create a branch, 
then run `make` in the root directory.
It should compile everything without errors. If not, submit an issue and wait.
Otherwise, make your changes and then run `make` again. If the build is
still clean, submit a pull request.
