import nimja,
       jester,
       terminaltables,
       os,
       strutils

proc renderIndex(): string =
  compileTemplateFile(getScriptDir() & "/templates/index.html.nimja")

proc renderProjects(): string =
  compileTemplateFile(getScriptDir() & "/templates/project.html.nimja")
  
proc renderTech(): string =
  compileTemplateFile(getScriptDir() & "/templates/tech.html.nimja")

proc renderAbout(): string =
  compileTemplateFile(getScriptDir() & "/templates/about.html.nimja")
  
proc fourOFour(): string =
  compileTemplateFile(getScriptDir() & "/templates/404.html.nimja")

var t = newUnicodeTable()
t.separateRows = false
t.setHeaders(@[newCell("Templates", pad=0), newCell("Status", pad=0)])
for file in walkDirRec(getCurrentDir() / "src" / "templates"):
  let split = splitFile file
  t.addRow(@[split.name & split.ext, "OK"])
t.separateRows = true

var t2 = newUnicodeTable()
t2.separateRows = false
t2.setHeaders(@[newCell("Public", pad=0), newCell("Status", pad=0)])
for file in walkDirRec(getCurrentDir() / "public"):
  let split = splitFile file
  t2.addRow(@[split.name & split.ext, "OK"])
t2.separateRows = true

printTable(t)
printTable(t2)

routes:
  get "/": 
    redirect uri("/~")
  get "/~":
    resp renderIndex()
  get "/projects":
    resp renderProjects()
  get "/about":
    resp renderAbout()
  get "/technologies":
    resp renderTech()
  get "/github":
    redirect uri("https://github.com/Infinitybeond1")
  get "/discord":
    redirect uri("https://discordapp.com/channels/@me/704106773660827690/")
  get "/blog":
    redirect uri("https://blog.infinitybeond1.tk/")
  error Http404:
    resp fourOFour()

