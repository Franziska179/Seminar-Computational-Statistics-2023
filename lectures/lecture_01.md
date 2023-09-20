# Organisation

## Prüfungsleistung
Die zu erbringende Prüfungsleistung besteht aus einem Programmierprojekt das in einem Vortrag von ca. 20 Minuten vorgestellt werden soll. Dafür soll ein Julia-Paket erstellt werden; die Präsentation kann zum Beispiel mit einem Jupyter Notebook erfolgen.

Mögliche Themen sind beispielsweise:
- Matrixmultiplikation oder anderes Beschleunigungsthema (gerne auch in Verbindung mit Erklärungen/Überlegungen zu Hardware) mittels (zum Beispiel) Threading, GPU, SIMD, smarte Algorithmik
- Design Patterns bzw. dazu gehörige Beispielprobleme (anhand des Buches *Hands-On Design Patterns and Best Practices with Julia*)
- Web crawler oder ein anders Webprojekt (evtl. in Verbindung mit Datenbanken oder GUI, siehe Julia Programming Projects)
- Ein Deep Neuronal Network schreiben (falls zu einfach: Convolutional Neural Network etc.; am besten auch mit autodiff; Parallelisierung auch wieder interessant; trainiere am besten auf MNIST)
- Für die Nerds: Eine Anwendung zu expliziter SIMD-Programmierung in Julia und/oder LLVM Interface

Eventuell müssen Programmieraufgaben abgegeben werden und sinnvoll bearbeitet sein.

# Bücher und Materialien

- [Julia Programming Projects](https://learning.oreilly.com/library/view/julia-programming-projects/9781788292740/)
- [Hands-On Design Patterns and Best Practices with Julia](https://learning.oreilly.com/library/view/hands-on-design-patterns/9781838648817/)

# Git

Für ordentliche Softwareentwicklung verwendet man quasi immer das Versionsverwaltungsystem Git. Am einfachsten geht Paketentwicklung wohl über GitHub.

[Einführung](https://www.geeksforgeeks.org/top-12-most-used-git-commands-for-developers/) für Anfänger.

Erste Aufgabe: SSH/HTTPS einrichten; vorliegendes Repository clonen und aktivieren.

# Module

1. Modules are separate namespaces, each introducing a new global scope. This is useful, because it
   allows the same name to be used for different functions or global variables without conflict, as long as they are in separate modules.

2. Modules have facilities for detailed namespace management: each defines a set of names it
   `export`s, and can import names from other modules with `using` and `import`.

3. Modules can be precompiled for faster loading, and may contain code for runtime initialization.

There are three important standard modules:

- Core contains all functionality "built into" the language.
- Base contains basic functionality that is useful in almost all cases.
- Main is the top-level module and the current module, when Julia is started.

## using

Possibly the most common way of loading a module is `using ModuleName`. This loads the code associated with `ModuleName`, and brings

1. the module name

2. and the elements of the export list into the surrounding global namespace.

Technically, the statement `using ModuleName` means that a module called `ModuleName` will be
available for resolving names as needed. When a global variable is encountered that has no
definition in the current module, the system will search for it among variables exported by `ModuleName`
and use it if it is found there. This means that all uses of that global within the current
module will resolve to the definition of that variable in `ModuleName`.

To load a module from a package, the statement using ModuleName can be used. To load a module from a locally defined module, a dot needs to be added before the module name like using .ModuleName.

Nice to know: Large modules can take several seconds to load because executing all of the statements in a module often involves compiling a large amount of code. Julia creates precompiled caches of the module to reduce this time.

## import

brings *only* the module name into scope. Users would need to use `NiceStuff.DOG`, `NiceStuff.Dog`, and `NiceStuff.nice` to access its contents. Usually, `import ModuleName` is used in contexts when the user wants to keep the namespace clean.
As we will see in the next section `import .NiceStuff` is equivalent to `using .NiceStuff: NiceStuff`.

# Pakete

Die offizielle (Kurz-)Anleitung findet sich [hier](https://julialang.org/contribute/developing_package/). Siehe auch [Doku](https://pkgdocs.julialang.org/v1/) zu Pkg.jl, [dieses](https://bjack205.github.io/JuliaTemplateRepo.jl/dev/index.html) Übersichtsrepository und [diesen](https://scientificcoder.com/automate-your-code-quality-in-julia) Artikel.

## CI, CodeCov, CompatHelper, JuliaRegistrator, TagBot

- CI: Allgemein Continuous Integration (vor allem automatisiertes Testen); wir benutzen für alles GitHub Actions
- CodeCov: Gibt an, wieviel Prozent des Pakets wir mit Tests abgedeckt haben
- CompatHelper is a Julia package that helps you keep your `[compat]` entries up-to-date. Whenever one of your package's dependencies releases a new breaking version, CompatHelper opens a pull request on your repository that modifies your `[compat]` entry to reflect the newly released version.
- JuliaRegistrator: Wird verwendet, um Paket offiziell zu registrieren
- TagBot: Erstellt automatisch Tag und Release für offizielles Paket
- Alternativen zu GitHub Actions wären TravisCI, Jenkins usw.

## Docstrings

## Documenter.jl

unklar :)

## Modifikation von bestehenden Paketen

https://kshyatt.github.io/post/firstjuliapr/

# Code formatting

https://github.com/domluna/JuliaFormatter.jl

Templates wie `style = "sciml"` sind ganz nett.

# Hausaufgabe:

Macht eine pull request auf mein Beispielrepo.