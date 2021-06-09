# Pandoc document template

Create professional documents with Markdown and minimal usage of Latex and Bibtex.

## Requirements

The only requirements for this are `bash` , [Pandoc](https://pandoc.org/installing.html) and [Latex](https://www.latex-project.org/get/)...

...but, Latex installations are known to cause expletives, so you can make life easier for yourself by letting Docker handle all the setup for you.

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop).
1. Make sure Docker Desktop is running (in your toolbar).
1. If you are on an ARM device (like an M1 Mac or a Raspberry Pi), open the `.env` file (it's invisible) and change the `ARCHITECTURE` line to `ARCHTITECTURE=arm64`. Otherwise, ignore this step.
1. To build your PDF, open a terminal in this directory and type the following command. The first time you run this, you'll need to give it five minutes and make a cup of tea. In subsequent runs, it should only take a few seconds.

```BASH
docker compose up
```

## Building your PDF

Run:

```BASH
docker compose up
```

### Grammarly integration and keyboard shortcuts

You can make life even easier for yourself by using [VSCode](https://code.visualstudio.com/). This will allow you to:

1. Build the PDF with a keyboard shortcut (<kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>P</kbd> on Windows/Linux, <kbd>Cmd</kbd><kbd>Alt</kbd><kbd>P</kbd> on MacOS).
1. Use Grammarly to review your work (requires a sign in).

To enable the build shortcut, open VSCode's keyboard shortcuts ( `keybindings.json` ) and paste in:

```json
// Place your key bindings in this file to override the defaults
[
  // You might have other custom shortcuts here

  // For pandoc-markdown projects (https://github.com/JayZ2398/pandoc-latex-md)
  {
    "key": "cmd+alt+p",
    "command": "workbench.action.tasks.runTask",
    "args": "pandoc make"
  },
  {
    "key": "ctrl+alt+p",
    "command": "workbench.action.tasks.runTask",
    "args": "pandoc make"
  }
]
```

To install Grammarly, follow the `Recommended extensions` popup prompt, or open the Extensions tab and install the [Grammarly (unofficial)](https://marketplace.visualstudio.com/items?itemName=znck.grammarly) extension.

## Customization

This workflow for writing professional documents supports:

* Custom Latex preambles (in [`preamble.sty`](./src/preamble.sty))
* BibTex referencing (in [`references.bib`](./src/references.bib))
* Pandoc customization (in [`meta.yaml`](./src/meta.yaml))

By default, the final PDF document processes the two files in `src/sections` , which are `intro.md` and `argument.md` in that order. If we wanted to add some more markdown we'd written in `src/conclusion.md` we would add two lines to [`pandocMake script](./pandocMake) as follows:

```BASH
# ...

# markdown input content
INTRO=$SECTIONS/intro.md
ARGUMENT=$SECTIONS/argument.md
CONCLUSION=$SECTIONS/conclusion.md # add this line here!

# ...

pandoc \
  $(: metadata includes title, styling, etc) \
  # ... irrelevant stuff
  $(: order the following lines in the desired section order) \
  $INTRO \
  $ARGUMENT \
  $CONCLUSION \                    # and add this line here!
  $(: bibliography) \
  # ... more irrelevant stuff
```

If you need to further modify the `pandocMake` script, I assume you know what you're doing. 😊
