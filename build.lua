module = "kdpcover"
ctanupload = true
typesetopts = "-interaction=batchmode -shell-escape -halt-on-error"
checkopts = "-interaction=batchmode -shell-escape -halt-on-error"
docfiles = {"yb-book-logo.pdf"}
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
    "0000%-00%-00", os.date("%d.%m.%Y")
  )
end
