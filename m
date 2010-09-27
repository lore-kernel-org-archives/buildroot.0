From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Sep 2010 15:33:05 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2010.11/no-install-strip
Message-ID: <cover.1285594377.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit fa0d2d142ce827736881ba52ba1bfa0c6bce9122:
  Peter Korsgaard (1):
        thttpd: don't use parallel make

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2010.11/no-install-strip

Thomas Petazzoni (2):
      autotargets: don't use install-strip
      packages: remove unneeded _INSTALL_TARGET_OPT definitions

 package/Makefile.autotools.in                      |    4 ----
 package/argus/argus.mk                             |    1 -
 package/at/at.mk                                   |    2 --
 package/autoconf/autoconf.mk                       |    4 ----
 package/automake/automake.mk                       |    4 ----
 package/beecrypt/beecrypt.mk                       |    2 --
 package/bind/bind.mk                               |    1 -
 package/bmon/bmon.mk                               |    1 -
 package/bootutils/bootutils.mk                     |    2 --
 package/bridge-utils/bridge.mk                     |    1 -
 package/dbus/dbus.mk                               |    7 -------
 package/expat/expat.mk                             |    1 -
 package/freetype/freetype.mk                       |    1 -
 package/gamin/gamin.mk                             |    2 --
 package/gperf/gperf.mk                             |    3 ---
 package/gtk2-themes/gtk2_themes.mk                 |    1 -
 package/gtkperf/gtkperf.mk                         |    1 -
 package/gvfs/gvfs.mk                               |    1 -
 package/haserl/haserl.mk                           |    3 ---
 package/java/classpath/classpath.mk                |    2 --
 package/java/jamvm/jamvm.mk                        |    1 -
 package/jpeg/jpeg.mk                               |    1 -
 package/kexec/kexec.mk                             |    2 --
 package/libcgi/libcgi.mk                           |    1 -
 package/libiconv/libiconv.mk                       |    2 --
 package/libnl/libnl.mk                             |    1 -
 package/libtool/libtool.mk                         |    4 ----
 package/m4/m4.mk                                   |    4 ----
 package/multimedia/alsa-lib/alsa-lib.mk            |    2 --
 package/multimedia/ffmpeg/ffmpeg.mk                |    3 ---
 package/neon/neon.mk                               |    1 -
 package/netsnmp/netsnmp.mk                         |    1 -
 package/ng-spice-rework/ng-spice-rework.mk         |    1 -
 package/openntpd/openntpd.mk                       |    1 -
 package/openssh/openssh.mk                         |    2 --
 package/patch/patch.mk                             |    1 -
 package/pkg-config/pkg-config.mk                   |    4 ----
 package/rdesktop/rdesktop.mk                       |    2 --
 package/ruby/ruby.mk                               |    1 -
 package/sawman/sawman.mk                           |    5 -----
 package/setserial/setserial.mk                     |    1 -
 package/sqlite/sqlite.mk                           |    1 -
 package/sylpheed/sylpheed.mk                       |    1 -
 package/tcpdump/tcpdump.mk                         |    2 --
 package/udpcast/udpcast.mk                         |    1 -
 package/vtun/vtun.mk                               |    1 -
 package/wpa_supplicant/wpa_supplicant.mk           |    1 -
 package/x11r7/mesa3d/mesa3d.mk                     |    1 -
 .../xdriver_xf86-input-acecad.mk                   |    1 -
 .../xdriver_xf86-input-aiptek.mk                   |    1 -
 .../xdriver_xf86-input-evdev.mk                    |    1 -
 .../xdriver_xf86-input-joystick.mk                 |    1 -
 .../xdriver_xf86-input-keyboard.mk                 |    1 -
 .../xdriver_xf86-input-mouse.mk                    |    1 -
 .../xdriver_xf86-input-synaptics.mk                |    1 -
 .../xdriver_xf86-input-vmmouse.mk                  |    1 -
 .../xdriver_xf86-input-void.mk                     |    1 -
 .../xdriver_xf86-video-apm.mk                      |    1 -
 .../xdriver_xf86-video-ark.mk                      |    1 -
 .../xdriver_xf86-video-ast.mk                      |    1 -
 .../xdriver_xf86-video-ati.mk                      |    1 -
 .../xdriver_xf86-video-chips.mk                    |    1 -
 .../xdriver_xf86-video-cirrus.mk                   |    1 -
 .../xdriver_xf86-video-dummy.mk                    |    1 -
 .../xdriver_xf86-video-fbdev.mk                    |    1 -
 .../xdriver_xf86-video-geode.mk                    |    1 -
 .../xdriver_xf86-video-glide.mk                    |    1 -
 .../xdriver_xf86-video-glint.mk                    |    1 -
 .../xdriver_xf86-video-i128.mk                     |    1 -
 .../xdriver_xf86-video-i740.mk                     |    1 -
 .../xdriver_xf86-video-intel.mk                    |    1 -
 .../xdriver_xf86-video-mach64.mk                   |    1 -
 .../xdriver_xf86-video-mga.mk                      |    1 -
 .../xdriver_xf86-video-neomagic.mk                 |    1 -
 .../xdriver_xf86-video-newport.mk                  |    1 -
 .../xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk |    1 -
 .../xdriver_xf86-video-openchrome.mk               |    1 -
 .../xdriver_xf86-video-r128.mk                     |    1 -
 .../xdriver_xf86-video-rendition.mk                |    1 -
 .../xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk |    1 -
 .../xdriver_xf86-video-s3virge.mk                  |    1 -
 .../xdriver_xf86-video-savage.mk                   |    1 -
 .../xdriver_xf86-video-siliconmotion.mk            |    1 -
 .../xdriver_xf86-video-sis.mk                      |    1 -
 .../xdriver_xf86-video-sisusb.mk                   |    1 -
 .../xdriver_xf86-video-suncg14.mk                  |    1 -
 .../xdriver_xf86-video-suncg3.mk                   |    1 -
 .../xdriver_xf86-video-suncg6.mk                   |    1 -
 .../xdriver_xf86-video-sunffb.mk                   |    1 -
 .../xdriver_xf86-video-sunleo.mk                   |    1 -
 .../xdriver_xf86-video-suntcx.mk                   |    1 -
 .../xdriver_xf86-video-tdfx.mk                     |    1 -
 .../xdriver_xf86-video-tga.mk                      |    1 -
 .../xdriver_xf86-video-trident.mk                  |    1 -
 .../xdriver_xf86-video-tseng.mk                    |    1 -
 .../xdriver_xf86-video-v4l.mk                      |    1 -
 .../xdriver_xf86-video-vesa.mk                     |    1 -
 .../xdriver_xf86-video-vmware.mk                   |    1 -
 .../xdriver_xf86-video-voodoo.mk                   |    1 -
 .../xdriver_xf86-video-wsfb.mk                     |    1 -
 .../xdriver_xf86-video-xgi.mk                      |    1 -
 .../xdriver_xf86-video-xgixp.mk                    |    1 -
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    1 -
 package/xstroke/xstroke.mk                         |    1 -
 package/xvkbd/xvkbd.mk                             |    2 --
 105 files changed, 0 insertions(+), 151 deletions(-)

Thanks,
-- 
Thomas Petazzoni
