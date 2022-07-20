import nimja,
       jester,
       prelude

proc renderIndex(): string =
  compileTemplateFile(getScriptDir() & "/templates/index.html.nimja")

proc renderProjects(): string =
  compileTemplateFile(getScriptDir() & "/templates/project.html.nimja")
  
proc renderTech(): string =
  compileTemplateFile(getScriptDir() & "/templates/tech.html.nimja")

proc renderAbout(): string =
  compileTemplateFile(getScriptDir() & "/templates/about.html.nimja")

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
