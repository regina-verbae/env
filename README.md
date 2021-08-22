# env
Mary's configs and helper scripts

## vim

1. Install Vundle

```shell
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

2. Install colors

```shell
mkdir ~/.vim/colors
ln -nsf ~/github/env/home/.vim/colors/mary.vim ~/.vim/colors/mary.vim
```

3. Install vimrc

```shell
ln -nsf github/env/home/.vimrc ~/.vimrc
ln -nsf github/env/home/.gvimrc ~/.gvimrc
```

## bash

1. Install .profile

```shell
ln -nsf github/env/home/.profile ~/.profile
```

## git

1. Install config

```shell
ln -nsf github/env/home/.gitconfig ~/.gitconfig
```

## perl

1. Install plenv

```shell
git clone https://github.com/tokuhirom/plenv.git ~/.plenv
```

2. Restart shell for .profile effects

```shell
exec $SHELL -l
```

3. Install perl-build

```shell
git clone https://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/
```

4. Install desired perl

```shell
plenv install $version
```

5. Rebuild shims

```shell
plenv rehash
```

6. Install cpanm

```shell
plenv install-cpanm
plenv rehash
```

## Dist::Zilla

1. Install default minter

```shell
mkdir -p ~/.dzil/profiles
ln -nsf ../../github/env/home/.dzil/profiles/default ~/.dzil/profiles/default
```

2. Write config file

```shell
vim ~/.dzil/config.ini
```

```ini
[%User]
name = Mary Ehlers
email = <email>

[%Rights]
license_class = Apache_2_0
copyright_holder = Mary Ehlers

[%PAUSE]
username = EHLERS
password =
```
