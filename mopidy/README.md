# Mopidy addon for Home Assistant OS

This addon for Home Assistant OS adds audio playing capability to the host.
Mopidy is built with these extensions:

- Mopidy-Mobile
- Mopidy-Local
- Mopidy-MPD
- MopidyCLI

The local media can be stored on /media (which allow an access through the Home Assistant NAS storage capability added in 2023.6).

Mopidy listen on `6680` for http connection, and `6600` for mpd ones.

## Configuration
### local_scan (bool)
If it is set to true, a local scan is performed on startup.

### options (list of dict)

The base configuration contains only:
````
[core]
cache_dir = /data/mopidy/cache
data_dir = /media/Musica/mopidy

[http]
hostname = 0.0.0.0

[mpd]
hostname = 0.0.0.0

[local]
enabled = true
media_dir = /media
````

To add other options, or overwrite existing ones, you need to add them as elements in this list. Each item must be a dict with a "name" and a "value" element.
They will be added on the mopidy call as -o name=value
For exemple, to overwrite the media configuration to use share,
````
{"name": "local/media_dir", "value": "/share/media"}
````
will become
````
-o local/media_dir=/share/media
````
