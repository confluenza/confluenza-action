# Confluenza Action

This action will help you with publishing markdown files in an easy way.
It uses [the Confluenza Solo Template](https://github.com/confluenza/solo-template) to create browsable documentation from plain md(x) files.

## Usage

### Content

#### `CONFLUENZA.yml`
Add a `CONFLUENZA.yml` in your project with the menu structure and tags.

See [confluenza documentation](https://confluenza.online/developers/making-confluenza-yours#frontmatter-and-confluenzayml)

> This is a mandatory field.

#### Page content
Add a folder `src\pages` with markdown (`.md` or `.mdx`) files.
Add a frontmatter to a file with information about:
- `path` : url path
- `title` : title of section
- `tag` : tag, which will be used to group items in the side bar menu

See [confluenza documentation](https://confluenza.online/developers/making-confluenza-yours#frontmatter-and-confluenzayml)

> This is mandatory content.

#### `gatsby-config.js`
Add a `gatsby-config.js` file.
This file contains:
- the `title` of the site
- the `prefixPath` (if necessary, see [confluenza documentation](https://solo.confluenza.online/developers/deploying-to-github-pages))
- the `editBaseUrl`

See [gatsby-config.js](./gatsby-config.js) for an example.

> This is a mandatory field.

> Temporary solution: This will be removed when #2 is implemented.

#### `README.md`
Add the `README.md` file.
In a lot of cases, you want to use the basic README.md file in your published documentation.
If the README.md exists, it will copy it.

> This is an optional field.

#### `CONTRIBUTING.md`
Add the `CONTRIBUTING.md` file.
In a lot of cases, you want to use the CONTRIBUTING.md file in your published documentation.
If it exists, it will be copied.

> This is an optional field.

### GitHub Workflow

```
  - name: Check out code 🛎️
    uses: actions/checkout@v2
  - name: Use Node.js
    uses: actions/setup-node@v2.1.5
    with:
      node-version: 14.x
  - name: Create confluenza pages 📦 
    uses: confluenza/confluenza-action@main
  - name: Deploy 🚀
    uses: JamesIves/github-pages-deploy-action@4.1.4
    with:
      branch: gh-pages
      folder: public
      CLEAN: true
 ```

## License
MIT
