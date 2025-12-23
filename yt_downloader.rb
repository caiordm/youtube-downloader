require 'ytdl'
require 'json'

if ARGV.empty?
  puts 'Rode assim: ruby yt_downloader "link da playlist/musica youtube aqui"'
  exit!
end

# 1. Extrair informações da playlist em formato JSON (rápido)
# --flat-playlist evita que o yt-dlp tente obter detalhes pesados de cada vídeo agora
playlist_or_music_url = ARGV[0]

if playlist_or_music_url.include?("playlist?list")

  puts playlist_or_music_url
  puts "Obtendo links da playlist..."
  json_data = `yt-dlp --flat-playlist --dump-single-json #{playlist_or_music_url}`
  playlist_info = JSON.parse(json_data)

  # 2. Guardar os URLs em um array
  video_urls = playlist_info['entries'].map do |video| {
      url: video['url'],
      title: video['title']
    }
  end
  puts "Encontradas #{video_urls.size} músicas. Iniciando downloads..."

  video_urls.each do |video|
    puts video[:title]
  end

  video_urls.each_with_index do |video, index|
    puts "#{index + 1}: Baixando #{video[:title]}"
    state = YoutubeDL.download(video[:url], extract_audio: true, audio_format: 'mp3', output: "baixados/%(title)s.%(ext)s", write_info_json: false, write_description: false, write_annotations: false, no_write_info_json: true)
      .on_progress do |state:, line:|
        puts "Progresso: #{state.progress}%"
      end
      .on_error do |state:, line:|
        puts "Erro no download: #{state.error}"
      end
      .on_complete do |state:, line:|
        puts "Download concluido: #{state.destination}"
      end
      .call
  end

else
  puts playlist_or_music_url
  puts "Iniciando download da musica"
  
  state = YoutubeDL.download(playlist_or_music_url, extract_audio: true, audio_format: 'mp3', output: "baixados/%(title)s.%(ext)s", write_info_json: false, write_description: false, write_annotations: false, no_write_info_json: true)
      .on_progress do |state:, line:|
        puts "Progresso: #{state.progress}%"
      end
      .on_error do |state:, line:|
        puts "Erro no download: #{state.error}"
      end
      .on_complete do |state:, line:|
        puts "Download concluido: #{state.destination}"
      end
      .call
end