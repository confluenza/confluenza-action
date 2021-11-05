module.exports = {
  siteMetadata: {
    title: 'Confluenza Solo Action',
    editBaseUrl: 'https://github.com/confluenza/confluenza-action/blob/master'
  },
  pathPrefix: '/confluenza-action',
  plugins: [
    {
      resolve: '@confluenza/gatsby-theme-confluenza',
      options: {
        mdx: true,
        ignore: []
      }
    },
    'gatsby-plugin-emotion',
    'gatsby-plugin-catch-links',
    'gatsby-plugin-root-import'
  ]
}
