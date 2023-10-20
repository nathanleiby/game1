# Game 1: Godot's "Dodge the Creeps (3D)"

Followed this tutorial.

## Exporting to Itch.io

Had to setup export config and download required export tools from within Godot editor.

Setup butler

- https://itch.io/t/2872417/how-to-upload-your-game-or-project-to-itchio-with-butler
- https://itch.io/docs/butler/installing.html
  - Used Darwin (Mac) URL here: https://broth.itch.ovh/butler

Within Godot, make sure to rename the exported file to `index.html`
I suggest exporting to `./export/html/index.html` and adding `./export/html` to your gitignore.

Within Itch configuration

- must set viewport dimensions
- must enablee "SharedArrayBuffer support — (Experimental) This may break parts of the page or your project. Only enable if you know you need it. Learn more" checkbox ([more info](https://itch.io/t/2025776/experimental-sharedarraybuffer-support)), otherwise, you'll get this error:
  > Error
  > The following features required to run Godot projects on the Web are missing:
  > Cross Origin Isolation - Check web server configuration (send correct headers)
  > SharedArrayBuffer - Check web server configuration (send correct headers)

Use butler to push to itch.io:

```
butler push export/html nathanleiby/game1:html
```

(nit: I used `export/web` naming.. will try to change to `html` in future)
