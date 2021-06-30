# Confluenza Action

This action will help you with publishing markdown files in an easy way.
It uses [the Confluenza Solo Template](https://github.com/confluenza/solo-template) to create browsable documentation from plain md(x) files.

## Usage

### Content

#### `CONFLUENZA.md`
Add a `CONFLUENZA.md` in your project with the menu structure and tags.

See [confluenza documentation](https://confluenza.online/developers/making-confluenza-yours#frontmatter-and-confluenzayml)

#### Page content
Add a folder `pages` with markdown (`.md` or `.mdx`) files.
Add a frontmatter to a file with information about:
- `path` : url path
- `title` : title of section
- `tag` : tag, which will be used to group items in the side bar menu

See [confluenza documentation](https://confluenza.online/developers/making-confluenza-yours#frontmatter-and-confluenzayml)

#### `gatsby-config.js`
Add a `gatsby-config.js` file.
This file contains:
- the `title` of the site
- the `prefixPath` (if necessary, see [confluenza documentation](https://solo.confluenza.online/developers/deploying-to-github-pages))
- the `editBaseUrl`

See [gatsby-config.js](./gatsby-config.js) for an example.

> Temporary solution: This will be removed when #2 is implemented.

### GitHub Workflow

```
  - name: Check out code 🛎️
    uses: actions/checkout@v2
  - name: Use Node.js
    uses: actions/setup-node@v2.1.5
    with:
      node-version: 14.x
  - name: Create confluenza pages 📦 
    uses: philips-labs/confluenza-action@main
  - name: Deploy 🚀
    uses: JamesIves/github-pages-deploy-action@4.1.4
    with:
      branch: gh-pages
      folder: public
      CLEAN: true
 ```

## License
MIT
