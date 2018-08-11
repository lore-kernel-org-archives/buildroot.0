From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Aug 2018 23:05:10 +0200
Subject: [Buildroot] [PATCH/next 00/12] package/vlc: add optional
 dependencies
Message-ID: <20180811210522.15600-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the version bump to ffmpeg 4.0.2 also affects vlc which needs to be
bumped to version 3.0.3. While working on these patches some optional
dependencies of vlc were found which are not yet taken care of.

This patch series was split from the version bump series and only
handles those optional dependencies which are part of vlc 2.2.8 and
3.0.3.

Regards, Bernd

Bernd Kuhls (12):
  package/vlc: needs speexdsp for optional speex support
  package/vlc: sort VLC_CONF_OPTS
  package/vlc: add optional dependency to x264
  package/vlc: add optional dependency to x265
  package/vlc: add optional dependency to ncurses
  package/vlc: add optional dependency to samba4
  package/vlc: add optional dependency to pulseaudio
  package/vlc: add optional dependency to libvpx
  package/vlc: add optional dependency to libidn
  package/vlc: add optional dependency to libsamplerate
  package/vlc: add optional dependency to libdvdread
  package/vlc: add optional dependency to libdvdnav

 package/vlc/vlc.mk | 107 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 85 insertions(+), 22 deletions(-)

-- 
2.18.0
