module.exports = {
  siteMetadata: {
    title: 'Confluenza Solo Action',
    editBaseUrl: 'https://github.com/philips-labs/confluenza-action/blob/master'
  },
  pathPrefix: '/confluenza-action',
  plugins: [
    {
      resolve: '@confluenza/gatsby-theme-confluenza',
      options: {
        mdx: true
      }
    },
    'gatsby-plugin-emotion',
    'gatsby-plugin-catch-links',
    'gatsby-plugin-root-import'
  ]
}
