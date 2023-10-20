# Game 1: Godot's "Dodge the Creeps (3D)"

Followed this tutorial.

## Exporting to Itch.io

Had to setup export config and download required export tools from within Godot editor.

Setup butler

- https://itch.io/t/2872417/how-to-upload-your-game-or-project-to-itchio-with-butler
- https://itch.io/docs/butler/installing.html
  - Used Darwin (Mac) URL here: https://broth.itch.ovh/butler

Within Godot, make sure to rename the exported file to `index.html`

Within Itch configuration

- must set viewport dimensions
- must enabled "SharedArrayBuffer support — (Experimental) This may break parts of the page or your project. Only enable if you know you need it. Learn more" flag to avoid
  > Error
  > The following features required to run Godot projects on the Web are missing:
  > Cross Origin Isolation - Check web server configuration (send correct headers)
  > SharedArrayBuffer - Check web server configuration (send correct headers)
