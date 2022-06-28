# local testing
`foo_file` was encrypted with the password 'identity password', which reflects the vault identity in the `ansible.cfg`:

```
ANSIBLE_VAULT_PASSWORD='identity password' ansible-vault encrypt foo_file
```

You can verify this by decrypting it:

```
ANSIBLE_VAULT_PASSWORD='identity password' ansible-vault decrypt foo_file
```

It contains the single line "foo"

Run the container and verify that you can decrypt locally in the container
as well (if you don't want to use the container I made, you can build it
from the Dockerfile)

```
docker run -it --rm --name ansible_vault_test owsus/ansible-vanilla
```

Inside it, decrypt foo file successfully:

```
ANSIBLE_VAULT_PASSWORD='identity password' ansible-vault decrypt foo_file
```

# test in Bitbucket (or perhaps another CICD, e.g. Github Actions)
Set `ANSIBLE_VAULT_PASSWORD` equal to `'identity password'` in repository level pipeline variables.

Run the pipeline in Bitbucket pipelines, and it won't successfully decrypt `foo_file`
