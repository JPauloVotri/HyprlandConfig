# Hyprland Config

## Dependências

### Breeze Cursors

Pacotes de cursores do mouse

```shell
yay -S breeze-cursors
```

### Hypr Shutdown

Encerra o Hyprland de maneira segura, sem matar os processos em execução.

```shell
yay -S hyprshutdown
```

### Hypr Idle

Bloqueia o sistema após um determinado período de inatividade.

```shell
yay -S hypridle
systemctl --user enable --now hypridle.service
```

### Fontes
```shell
yay -S redhat-fonts ttf-cascadia-code-nerd ttf-cascadia-mono-nerd \
       ttf-nerd-fonts-symbols ttf-ubuntu-mono-nerd ttf-ubuntu-nerd
```