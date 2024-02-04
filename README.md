# shell-scripting
This repository all belongs to shell scripting

output will be like this:
```
Organization: Organization-399, Repository: shell-scripting, Pull Request Title: Update
Organization: Organization-399, Repository: shell-scripting, Pull Request Title: README.md
```

The above output is just a single PR but, its splitting at space and iterating so, i have decided to use IFS=$'\n' this will iterate over lines instead of spaces.

So, i have added a new script that handle this just for reference.

```
Organization: Organization-399, Repository: shell-scripting, Pull Request Title: Update README.md
Organization: Organization-399, Repository: terraform_repo, Pull Request Title: Added sample line
```

We can keep env variable as GH_HOST = "api.github.com"

This was tested on the ubuntu docker container which is running on the ubuntu machine.
