Various configs

#### Restore on empty system
```bash
git clone --bare git@github.com:sivakov512/root-files.git $HOME/.root-files.git
git --git-dir=$HOME/.root-files.git/ --work-tree=/ checkout
```

#### Post restore
```bash
root-files config --local status.showUntrackedFiles no
```

---
Based on ["Manage Dotfiles With a Bare Git Repository"](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)
