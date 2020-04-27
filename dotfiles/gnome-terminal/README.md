# Backup
1. `dconf dump /org/gnome/terminal/legacy/profiles:/`
2. Get id `:1430663d-083b-4737-a7f5-8378cc8226d1`
3. Backup theme `dconf dump /org/gnome/terminal/legacy/profiles:/:1430663d-083b-4737-a7f5-8378cc8226d1/ > theme-profile.dconf`
4. Restore theme `dconf load /org/gnome/terminal/legacy/profiles:/:1430663d-083b-4737-a7f5-8378cc8226d1/ < theme-profile.dconf`
