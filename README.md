dotfiles
========

My custom dotfiles.

After cloning for the first time make sure to run

    git submodule init && git submodule update

To update vim plugins run the following command:

    git submodule foreach git pull origin master

To add new vim plugins run the following commands:

    cd vim/bundles
    git submodule add http://github.com/plugin/repo.git
    git add .
    git commit -m 'installed new vim plugin as a submodule'

