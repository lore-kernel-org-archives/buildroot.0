From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 13:41:20 +0200
Subject: [Buildroot] [PATCH/next v2 00/23] package/vlc: bump version to
 3.0.3
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180816134120.4b35381b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sun, 12 Aug 2018 22:29:12 +0200, Bernd Kuhls wrote:

> Bernd Kuhls (23):
>   package/vlc: needs speexdsp for optional speex support
>   package/vlc: sort VLC_CONF_OPTS
>   package/vlc: add optional dependency to x264
>   package/vlc: add optional dependency to x265
>   package/vlc: add optional dependency to ncurses
>   package/vlc: add optional dependency to samba4
>   package/vlc: add optional dependency to pulseaudio
>   package/vlc: add optional dependency to libvpx
>   package/vlc: add optional dependency to libidn
>   package/vlc: add optional dependency to libsamplerate
>   package/vlc: add optional dependency to libdvdread
>   package/vlc: add optional dependency to libdvdnav
>   package/vlc: bump version to 3.0.3
>   package/vlc: add optional dependency to gst1-plugins-base
>   package/vlc: add optional dependency to harfbuzz
>   package/vlc: add optional dependency to libarchive
>   package/vlc: add optional dependency to libnfs
>   package/vlc: add optional dependency to libsecret
>   package/vlc: add optional dependency to libsoxr
>   package/vlc: add optional dependency to libva
>   package/vlc: add optional dependency to mpg123
>   package/vlc: add optional dependency to wayland
>   package/vlc: add optional support for skins2

Thanks, entire series applied to next. As usual, you forgot to Git
format the patches in the 3.0.3 version bump. I still don't get what is
the problem with getting the VLC Git repository, applying the patches
in a branch based on the 3.0.3 tag, and then running "git format-patch
-N". It gives a nice clean series of patches, that you only have to
copy in package/vlc/. I fixed that up once again, but it would really,
really be nice if you could do that for the next contributions.

Another comment: there is a 3.0.4 tag, and there are quite a few fixes
between 3.0.3 and 3.0.4, including the Qt5 build fix. Perhaps you could
bump to 3.0.4 ?

Thanks a lot for maintaining this package!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
