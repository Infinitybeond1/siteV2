import nimja,
       jester,
       prelude

proc renderIndex(): string =
  compileTemplateFile(getScriptDir() & "/templates/index.html.nimja")

routes:
  get "/": 
    redirect uri("/~")
  get "/~":
    resp renderIndex()
