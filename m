From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Oct 2011 09:41:23 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20111025074136.848E58F144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e55af699b5cb3d9286e19e19c8aaeb14bcdf0a38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   35 ++++++++++++++++++++---------------
 1 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/CHANGES b/CHANGES
index cac5053..9957d58 100644
--- a/CHANGES
+++ b/CHANGES
@@ -23,24 +23,29 @@
 	Linux: Kernel extensions infrastructure support, Xenomai +
 	RTAI support.
 
-	Updated/fixed packages: acpid, busybox, dbus, dbus-glib,
-	directfb, dnsmasq, drystone, e2fsprogs, ethtool, fakeroot,
-	fbdump, freetype, fuse, gamin, gmp, gnutls,
-	gst-plugins-{base,bad,good,ugly}, gstreamer, imagemagick,
-	ipsec-tools, ipset, iptables, iw, jpeg, kexec, leafpad, less,
-	libargtable2, libao, libconfuse, libcuefile, libcurl,
-	libevent, libglib2, libiconv, libreplaygain, libroxml,
+	Updated/fixed packages: acpid, bind, busybox, dash, dbus,
+	dbus-glib, directfb, dnsmasq, drystone, e2fsprogs, ethtool,
+	fakeroot, fbdump, file, freetype, fuse, gamin, gmp, gmpc,
+	gnutls, gob2, gst-plugins-{base,bad,good,ugly}, gstreamer,
+	hostapd, ifplugd, imagemagick, intltool, ipsec-tools, ipset,
+	iptables, iw, jpeg, kexec, leafpad, less, libargtable2, libao,
+	libconfuse, libcuefile, libcurl, libdaemon, libevent,
+	libglib2, libiconv, libmpd, libreplaygain, libroxml,
 	libsamplerate, libsndfile, libsoup, libsvgtiny, libtool,
-	lighttpd, linux-fusion, lite, lsof, lzo, lzop, mcookie,
-	mpg123, mpd, mpfr, musepack, mysql_client, ncurses, neon, netcat,
-	netsnmp, ntfs-3g, ntfsprogs, openssh, openssl, python, qt,
-	radvd, rsync, samba, sawman, sdl_sound, smartmontools, sqlite,
-	squid, sylpheed, taglib, tar, tcpreplay, tslib, usbutils,
-	util-linux, valgrind, whetstone, xdata_xcursor-themes, xterm
+	lighttpd, links, linux-fusion, lite, lrzsz, lsof, lzo, lzop,
+	makedevs, mcookie, mpg123, mpd, mpfr, musepack, mutt,
+	mysql_client, ncftp, ncurses, neon, netcat, netsnmp, ntfs-3g,
+	ntfsprogs, ntp, openntpd, openssh, openssl, orc, pciutils,
+	psmisc, python, qt, quagga, radvd, rpm, rsync, samba, sawman,
+	sdl_sound, smartmontools, sqlite, squid, stunnel, sudo,
+	sylpheed, sysstat, taglib, tar, tcpreplay, tslib, usbutils,
+	util-linux, valgrind, wget, whetstone, which, wpa-supplicant,
+	xdata_xcursor-themes, xmlstarlet, xterm
 
 	New packages: bluez-utils, cifs-utils, fftw, fluxbox, json-c,
-	libev, libftdi, libgeotiff, libplayer, ngrep, noip, openocd,
-	picocom, poco, portaudio, pv, rtai, xenomai.
+	libev, libftdi, libgeotiff, libplayer, ngrep, noip, opencv,
+	openocd, picocom, poco, portaudio, pulseaudio, pv, rtai, vala,
+	xenomai.
 
 	Issues resolved (http://bugs.uclibc.org):
 
