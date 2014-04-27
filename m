From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Apr 2014 21:42:54 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_v6_0/8=5D_Add_new_libraries_for_XB?=
	=?utf-8?q?MC_Gotham?=
Message-ID: <1398627782-1939-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

attached you will find the updated patch series to prepare for the
upcoming XBMC Gotham release, where beta4 was released April 19th, 2014.

Changelog:
v6: - rebased and updated based on Thomas? review
v5: - rebased
    - updated libva (Thomas)
    - include only git-ready patches (X11 intel driver will follow in a seperate patch)
v4: - rebased
    - removed flac version bump (Gustavo)
    - removed libfs version bump https://github.com/OpenELEC/OpenELEC.tv/commit/b55859

Bernd Kuhls (8):
  mesa3d: Depend on xorg meta package instead of xserver_xorg-server
  libva: new package
  libva-intel-driver: new package
  ffmpeg: Add libva support
  libglu: new package
  libglew: new package
  sdl: Add new dependency libglu for opengl support
  xdriver_xf86-video-intel: Bump version to 2.99.911

-- 
1.7.10.4
