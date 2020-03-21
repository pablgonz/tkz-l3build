# tkz-l3build

More fun with l3build :)

## How to use 

Run:
```
$l3build  <target> [options]
```

At the moment the possible `<targets>` are:

- `tag` : Update the version and date
- `doc` : Generate the documentation
- `install` : Install the package locally, you can use it in conjunction with `--full `--dry-run`
- `uninstall`: Uninstall the package locally
- `clean` : Clean the directory tree.
- `ctan` : Generate the compressed package (`.zip`)
