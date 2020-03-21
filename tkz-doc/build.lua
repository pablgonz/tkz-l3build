-- Build script for tkz-doc

module = "tkz-doc"
tkzdocv = "1.4c"
tkzdocd = "2020/03/20"
tkzexamplev = "v1.1c"
tkzexampled = "2011/06/04"

-- Setting variables for .zip file (CTAN)
textfiles  = {"README.md"}
ctanreadme = "README.md"
ctanpkg    = module
ctanzip    = ctanpkg.."-"..tkzdocv
packtdszip = false
flatten    = false
cleanfiles = {}

-- Setting variables for package files
sourcefiledir = "latex"
textfiledir   = "doc"
sourcefiles  = {"*.*"}
installfiles = {"*.*"}

-- Setting file locations for local instalation (TDS)
tdslocations = {
  "doc/latex/tkz-doc/README",
  "tex/latex/tkz-doc/tkz-doc.cfg",
  "tex/latex/tkz-doc/tkz-doc.cls",
  "tex/latex/tkz-doc/couverture.tex",
  "tex/latex/tkz-doc/tkzexample.sty",
}

-- Update package date and version
tagfiles = {"tkz-doc.cfg", "tkz-doc.cls", "couverture.tex", "tkzexample.sty", "README.md"}

function update_tag(file, content, tagname, tagdate)
  if string.match(file, "%.cfg$") then
    content = string.gsub(content,
                          "\\fileversion{.-}",
                          "\\fileversion{"..tkzdocv.."}")
    content = string.gsub(content,
                          "\\filedate{.-}",
                          "\\filedate{"..tkzdocd.."}")
    content = string.gsub(content,
                          "\\typeout{%d%d%d%d%/%d%d%/%d%d %d+.%d+%a* %s*(.-)}",
                          "\\typeout{"..tkzdocd.." "..tkzdocv.." %1}")
  end
  if string.match(file, "%.tex$") then
    content = string.gsub(content,
                          "\\fileversion{.-}",
                          "\\fileversion{"..tkzdocv.."}")
    content = string.gsub(content,
                          "\\filedate{.-}",
                          "\\filedate{"..tkzdocd.."}")
    content = string.gsub(content,
                          "\\typeout{%d%d%d%d%/%d%d%/%d%d %d+.%d+%a* %s*(.-)}",
                          "\\typeout{"..tkzdocd.." "..tkzdocv.." %1}")
  end
  if string.match(file, "%.cls$") then
    content = string.gsub(content,
                          "\\newcommand*{\\PackageVersion}{.-}",
                          "\\newcommand*{\\PackageVersion}{"..tkzdocv.."}")
    content = string.gsub(content,
                          "\\newcommand*{\\filedate}{.-}",
                          "\\newcommand*{\\filedate}{"..tkzdocd.."}")
  end
  if string.match(file, "%.sty$") then
    content = string.gsub(content,
                          "\\ProvidesPackage{(.-)}%[%d%d%d%d%/%d%d%/%d%d v?%d+.%d*%s?%a* %s*(.-)%]",
                          "\\ProvidesPackage{%1}["..tkzexampled.." "..tkzexamplev.." %2]")
  end
  if string.match(file, "README.md$") then
    content = string.gsub(content,
                          "Release %d+.%d+%a* %d%d%d%d%/%d%d%/%d%d",
                          "Release "..tkzdocv.." "..tkzdocd)
  end
  return content
end
