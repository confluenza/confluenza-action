# Contributing

> Working on your first Pull Request? You can learn how from this *free* series
> [How to Contribute to an Open Source Project on
> GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github)

## Debug scripts

You can debug the scripts by running the following command:
```bash
docker run -v $(PWD):/code -w /code --rm node:16 .github/bin/create-pages.sh
```
