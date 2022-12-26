# recaption
A Ruby gem to keep captioning as metadata in image files

Recaption's main purpose is raising awareness as to how easy it is to keep captioning metadata around. Many services around the Internet, particularly social media, allow to provide captions for uploaded images, but then fail to stick this metadata in the image files themselves.

This causes reuploads of image files, which happen very often, to lose such captions even after someone made the effort to write them in the first place. When you've successfully guided you users to write captions, why waste their work by providing uncaptioned copies? Also, if you receive an image that already has captioning metadata, why not use it?

Extending the lifecycle of this metadata would help build a more accessible Internet.

Currently `Recaption` is a very thin wrapper around [MiniExifTool](https://github.com/janfri/mini_exiftool) with convenience methods to read and write caption metadata. It's extremely simple to use.

```ruby
# return the picture's caption
Recaption.read!('myfile.png')
# write the caption to the image file's metadata
Recaption.write!('myfile.png', 'Caption...')
# remove the caption from the image file's metadata
Recaption.clear!('myfile.png')
```

## Credits

The [The Edges of Dubai](https://www.flickr.com/photos/stuckincustoms/23426912396) picture by [Trey Ratcliff](https://stuckincustoms.com/) found in `assets/dubai.jpg` and used as a test image in this project is licensed under an [Attribution-NonCommercial-ShareAlike 2.0 Generic (CC BY-NC-SA 2.0)](https://creativecommons.org/licenses/by-nc-sa/2.0/) license:

![The Edges Of Dubai, by Trey Ratcliff. A picture of the nocturnal landscape of Dubai. It depicts bright skyscrappers lighting up the night sky.](assets/dubai.jpg)
