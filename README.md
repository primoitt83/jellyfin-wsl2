# jellyfin-wsl2

## branch mesa=23.2.1
````
/usr/lib/jellyfin-ffmpeg/vainfo --display drm --device /dev/dri/renderD128
Trying display: drm
libva info: VA-API version 1.22.0
libva info: Trying to open /usr/lib/jellyfin-ffmpeg/lib/dri/d3d12_drv_video.so
libva info: Trying to open /usr/lib/x86_64-linux-gnu/dri/d3d12_drv_video.so
libva info: Found init function __vaDriverInit_1_14
libva info: va_openDriver() returns 0
vainfo: VA-API version: 1.22 (libva 2.22.0)
vainfo: Driver version: Mesa Gallium driver 23.2.1-1ubuntu3.1~22.04.3 for D3D12 (Intel(R) Iris(R) Xe Graphics)
vainfo: Supported profile and entrypoints
      VAProfileH264ConstrainedBaseline:	VAEntrypointVLD
      VAProfileH264ConstrainedBaseline:	VAEntrypointEncSlice
      VAProfileH264Main               :	VAEntrypointVLD
      VAProfileH264Main               :	VAEntrypointEncSlice
      VAProfileH264High               :	VAEntrypointVLD
      VAProfileH264High               :	VAEntrypointEncSlice
      VAProfileHEVCMain               :	VAEntrypointVLD
      VAProfileHEVCMain               :	VAEntrypointEncSlice
      VAProfileHEVCMain10             :	VAEntrypointVLD
      VAProfileHEVCMain10             :	VAEntrypointEncSlice
      VAProfileVP9Profile0            :	VAEntrypointVLD
      VAProfileVP9Profile2            :	VAEntrypointVLD
      VAProfileAV1Profile0            :	VAEntrypointVLD
      VAProfileNone                   :	VAEntrypointVideoProc
````

### test ffmpeg using vaapi

````
cd /tmp
./get-videos.sh
````

#### decoding h264
````
 /usr/lib/jellyfin-ffmpeg/ffmpeg -benchmark -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -c:v h264 -i BBB.mp4  -f null -
ffmpeg version 7.0.2-Jellyfin Copyright (c) 2000-2024 the FFmpeg developers
  built with gcc 12 (Debian 12.2.0-14)
  configuration: --prefix=/usr/lib/jellyfin-ffmpeg --target-os=linux --extra-version=Jellyfin --disable-doc --disable-ffplay --disable-ptx-compression --disable-static --disable-libxcb --disable-sdl2 --disable-xlib --enable-lto=auto --enable-gpl --enable-version3 --enable-shared --enable-gmp --enable-gnutls --enable-chromaprint --enable-opencl --enable-libdrm --enable-libxml2 --enable-libass --enable-libfreetype --enable-libfribidi --enable-libfontconfig --enable-libharfbuzz --enable-libbluray --enable-libmp3lame --enable-libopus --enable-libtheora --enable-libvorbis --enable-libopenmpt --enable-libdav1d --enable-libsvtav1 --enable-libwebp --enable-libvpx --enable-libx264 --enable-libx265 --enable-libzvbi --enable-libzimg --enable-libfdk-aac --arch=amd64 --enable-libshaderc --enable-libplacebo --enable-vulkan --enable-vaapi --enable-amf --enable-libvpl --enable-ffnvcodec --enable-cuda --enable-cuda-llvm --enable-cuvid --enable-nvdec --enable-nvenc
  libavutil      59.  8.100 / 59.  8.100
  libavcodec     61.  3.100 / 61.  3.100
  libavformat    61.  1.100 / 61.  1.100
  libavdevice    61.  1.100 / 61.  1.100
  libavfilter    10.  1.100 / 10.  1.100
  libswscale      8.  1.100 /  8.  1.100
  libswresample   5.  1.100 /  5.  1.100
  libpostproc    58.  1.100 / 58.  1.100
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'BBB.mp4':
  Metadata:
    major_brand     : mp42
    minor_version   : 0
    compatible_brands: isomavc1mp42
    creation_time   : 2010-01-10T08:29:06.000000Z
  Duration: 00:09:56.47, start: 0.000000, bitrate: 2119 kb/s
  Stream #0:0[0x1](und): Audio: aac (LC) (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 125 kb/s (default)
      Metadata:
        creation_time   : 2010-01-10T08:29:06.000000Z
        handler_name    : (C) 2007 Google Inc. v08.13.2007.
        vendor_id       : [0][0][0][0]
  Stream #0:1[0x2](und): Video: h264 (High) (avc1 / 0x31637661), yuv420p(progressive), 1280x720 [SAR 1:1 DAR 16:9], 1991 kb/s, 24 fps, 24 tbr, 24k tbn (default)
      Metadata:
        creation_time   : 2010-01-10T08:29:06.000000Z
        handler_name    : (C) 2007 Google Inc. v08.13.2007.
        vendor_id       : [0][0][0][0]
Stream mapping:
  Stream #0:1 -> #0:0 (h264 (native) -> wrapped_avframe (native))
  Stream #0:0 -> #0:1 (aac (native) -> pcm_s16le (native))
Press [q] to stop, [?] for help
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
Output #0, null, to 'pipe:':
  Metadata:
    major_brand     : mp42
    minor_version   : 0
    compatible_brands: isomavc1mp42
    encoder         : Lavf61.1.100
  Stream #0:0(und): Video: wrapped_avframe, nv12(progressive), 1280x720 [SAR 1:1 DAR 16:9], q=2-31, 200 kb/s, 24 fps, 24 tbn (default)
      Metadata:
        creation_time   : 2010-01-10T08:29:06.000000Z
        handler_name    : (C) 2007 Google Inc. v08.13.2007.
        vendor_id       : [0][0][0][0]
        encoder         : Lavc61.3.100 wrapped_avframe
  Stream #0:1(und): Audio: pcm_s16le, 44100 Hz, stereo, s16, 1411 kb/s (default)
      Metadata:
        creation_time   : 2010-01-10T08:29:06.000000Z
        handler_name    : (C) 2007 Google Inc. v08.13.2007.
        vendor_id       : [0][0][0][0]
        encoder         : Lavc61.3.100 pcm_s16le
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
[out#0/null @ 0x55b519521280] video:6151KiB audio:102752KiB subtitle:0KiB other streams:0KiB global headers:0KiB muxing overhead: unknown
frame=14315 fps=139 q=-0.0 Lsize=N/A time=00:09:56.45 bitrate=N/A speed=5.78x    
bench: utime=24.293s stime=30.843s rtime=103.162s
bench: maxrss=187668KiB
````

#### encoding h265
````
/usr/lib/jellyfin-ffmpeg/ffmpeg -benchmark -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -i Big_Buck_Bunny_1080_10s_30MB_h265.mp4 -vf 'format=nv12,hwupload' -c:v hevc_vaapi -b:v 1M -y output.mp4
ffmpeg version 7.0.2-Jellyfin Copyright (c) 2000-2024 the FFmpeg developers
  built with gcc 12 (Debian 12.2.0-14)
  configuration: --prefix=/usr/lib/jellyfin-ffmpeg --target-os=linux --extra-version=Jellyfin --disable-doc --disable-ffplay --disable-ptx-compression --disable-static --disable-libxcb --disable-sdl2 --disable-xlib --enable-lto=auto --enable-gpl --enable-version3 --enable-shared --enable-gmp --enable-gnutls --enable-chromaprint --enable-opencl --enable-libdrm --enable-libxml2 --enable-libass --enable-libfreetype --enable-libfribidi --enable-libfontconfig --enable-libharfbuzz --enable-libbluray --enable-libmp3lame --enable-libopus --enable-libtheora --enable-libvorbis --enable-libopenmpt --enable-libdav1d --enable-libsvtav1 --enable-libwebp --enable-libvpx --enable-libx264 --enable-libx265 --enable-libzvbi --enable-libzimg --enable-libfdk-aac --arch=amd64 --enable-libshaderc --enable-libplacebo --enable-vulkan --enable-vaapi --enable-amf --enable-libvpl --enable-ffnvcodec --enable-cuda --enable-cuda-llvm --enable-cuvid --enable-nvdec --enable-nvenc
  libavutil      59.  8.100 / 59.  8.100
  libavcodec     61.  3.100 / 61.  3.100
  libavformat    61.  1.100 / 61.  1.100
  libavdevice    61.  1.100 / 61.  1.100
  libavfilter    10.  1.100 / 10.  1.100
  libswscale      8.  1.100 /  8.  1.100
  libswresample   5.  1.100 /  5.  1.100
  libpostproc    58.  1.100 / 58.  1.100
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'Big_Buck_Bunny_1080_10s_30MB_h265.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2mp41
    title           : Big Buck Bunny, Sunflower version
    artist          : Blender Foundation 2008, Janus Bager Kristensen 2013
    composer        : Sacha Goedegebure
    encoder         : Lavf58.10.100
    comment         : Creative Commons Attribution 3.0 - http://bbb3d.renderfarming.net
    genre           : Animation
  Duration: 00:00:10.00, start: 0.000000, bitrate: 25169 kb/s
  Stream #0:0[0x1](und): Video: hevc (Main) (hev1 / 0x31766568), yuv420p(tv, progressive), 1920x1080 [SAR 1:1 DAR 16:9], 25163 kb/s, 30 fps, 30 tbr, 15360 tbn (default)
      Metadata:
        handler_name    : VideoHandler
        vendor_id       : [0][0][0][0]
Stream mapping:
  Stream #0:0 -> #0:0 (hevc (native) -> hevc (hevc_vaapi))
Press [q] to stop, [?] for help
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
[hevc_vaapi @ 0x56406ad498c0] Driver does not support some wanted packed headers (wanted 0xd, found 0x1).
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
Output #0, mp4, to 'output.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2mp41
    title           : Big Buck Bunny, Sunflower version
    artist          : Blender Foundation 2008, Janus Bager Kristensen 2013
    composer        : Sacha Goedegebure
    genre           : Animation
    comment         : Creative Commons Attribution 3.0 - http://bbb3d.renderfarming.net
    encoder         : Lavf61.1.100
  Stream #0:0(und): Video: hevc (Main) (hev1 / 0x31766568), vaapi(tv, progressive), 1920x1080 [SAR 1:1 DAR 16:9], q=2-31, 1000 kb/s, 30 fps, 15360 tbn (default)
      Metadata:
        handler_name    : VideoHandler
        vendor_id       : [0][0][0][0]
        encoder         : Lavc61.3.100 hevc_vaapi
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission deniedte=N/A speed=N/A    
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied
KMS: DRM_IOCTL_MODE_CREATE_DUMB failed: Permission denied.13 bitrate=   2.6kbits/s speed=0.133x    
[out#0/mp4 @ 0x56406ad14c80] video:1242KiB audio:0KiB subtitle:0KiB other streams:0KiB global headers:0KiB muxing overhead: 0.346226%
frame=  300 fps= 36 q=-0.0 Lsize=    1246KiB time=00:00:09.96 bitrate=1024.5kbits/s speed= 1.2x    
bench: utime=1.911s stime=1.721s rtime=8.275s
bench: maxrss=259756KiB
````


