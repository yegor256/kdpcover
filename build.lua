-- (The MIT License)
--
-- Copyright (c) 2021-2024 Yegor Bugayenko
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the 'Software'), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

module = "kdpcover"
ctanupload = true
typesetopts = "-interaction=batchmode -shell-escape -halt-on-error"
checkopts = "-interaction=batchmode -shell-escape -halt-on-error"
docfiles = {"yb-book-logo.pdf", "cactus.pdf"}
tagfiles = {"build.lua", "kdpcover.dtx"}
cleanfiles = {"*.glo", "*.fls", "*.idx", "*.out", "*.fdb_latexmk", "*.aux", "*.sty", "*.zip", "kdpcover.pdf"}

uploadconfig = {
  pkg = "kdpcover",
  version = "0.0.0",
  author = "Yegor Bugayenko",
  uploader = "Yegor Bugayenko",
  email = "yegor256@gmail.com",
  note = "Bug fixes",
  announcement = "",
  ctanPath = "/macros/latex/contrib/kdpcover",
  bugtracker = "https://github.com/yegor256/kdpcover/issues",
  home = "",
  description = "The problem this class solves is the necessity to change the size of the cover PDF according to the number of pages in the book — the bigger the book, the larger the spine of the book must be. The provided class makes the necessary calculations on-the-fly, using the qpdf tool. Obviously, you need to have it installed. Also, you must run pdflatex with the --shell-escape option, in order to allow LaTeX to run qpdf.",
  development = "",
  license = "mit",
  summary = "Covers for books published by Kindle Direct Publishing",
  repository = "https://github.com/yegor256/kdpcover",
  support = "",
  topic = {"covers", "class", "std-conform", "doc-templ"}
}

function update_tag(file, content, tagname, tagdate)
  return string.gsub(
    string.gsub(content, "0%.0%.0", tagname),
    "0000/00/00", os.date("%Y/%m/%d")
  )
end
