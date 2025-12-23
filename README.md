🎵 YouTube Audio Downloader
Um script em Ruby simples e eficiente para extrair e baixar o áudio de vídeos ou playlists completas do YouTube utilizando o poder do yt-dlp.
✨ Funcionalidades

- Download de Áudio: Extrai automaticamente o áudio na melhor qualidade disponível.
- Suporte a Playlists: Detecta automaticamente se o link é de um vídeo individual ou de uma playlist, processando todos os itens.
- Organização Automática: Salva todos os arquivos na pasta dedicada baixados/.

Pré-requisitos

Antes de começar, você precisará ter instalado em sua máquina:

    Ruby 3+: Site oficial do Ruby
    yt-dlp (Sucessor otimizado do youtube-dl):
    bash

    pip install yt-dlp

    Use o código com cuidado.

    Ou, se preferir o clássico: pip install youtube-dl

Instalação e Configuração

    Instale a Gem necessária:
    bash

    gem install ytdl

    Use o código com cuidado.

Prepare o ambiente:
No diretório do projeto, crie a pasta onde os arquivos serão armazenados:
bash

mkdir baixados

📋 Como usar
Para iniciar o download, execute o script passando o link do vídeo ou da playlist entre aspas:
bash

ruby yt_downloader.rb "url do video ou da playlist"
