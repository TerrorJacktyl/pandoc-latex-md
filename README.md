# Pandoc document template

The only requirements to build the final PDF are:

1. `bash` (so if you're using Windows, you should setup the [WSL2 bash](https://itsfoss.com/install-bash-on-windows/) or install something like [Cygwin](https://www.cygwin.com/)).
1. [Pandoc](https://pandoc.org/installing.html) installed and in your path
1. [Latex](https://www.latex-project.org/get/) (specifically `pdflatex` installed and in your path)
1. Make the `pandocMake` file executable with

```code
chmod +x pandocMake
```

To build the PDF, from the root directory (the one with this file) type:

```code
./pandocMake
```
