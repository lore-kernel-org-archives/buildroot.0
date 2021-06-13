From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Jun 2021 10:42:59 +0200
Subject: [Buildroot] [git commit] Update for 2021.02.3
Message-ID: <20210613081540.ECE3D812BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=339810921beb1899e93caedd0f0b6a27e1aa760b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5293208a57ce78f9fc958704d7df52f28532cde6)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/CHANGES b/CHANGES
index c7ae5fbfc3..91487cc058 100644
--- a/CHANGES
+++ b/CHANGES
@@ -144,6 +144,51 @@
 	#13751: libopenssl (static): huge drop in performance in newer ..
 	#13771: package htop has undeclared dependency on host python
 
+2021.02.3, released June 12th, 2021
+
+	Important / security related fixes.
+
+	CPE meta data has been added for a large number of packages
+
+	Updated/fixed packages: acpid, apache, apcupsd, assimp, bird,
+	bitcoin, blktrace, boost, capnproto, chrony, dc3dd, dhcp,
+	directfb, dmalloc, docker-engine, ebtables, efibootmgr,
+	enlightenment, enscript, environment-setup, exempi, expat,
+	findutils, flatcc, fluidsynth, frr, gdb, go, gptfdisk, grpc,
+	gst1-plugins-bad, gst1-rtsp-server, gstreamer1, gupnp,
+	hostapd, hwloc, i2c-tools, iftop, imagemagick, imx-gpu-viv,
+	intel-mediadriver, intel-microcode, jquery-validation,
+	keepalived, kodi, less, libcamera, libcurl, libcutl, libesmtp,
+	libeXosip2, libffi, libfuse, libfuse3, libgeos, libgtk2,
+	libgtk3, libical, libidn, libidn2, libkcapi, libldns, libmms,
+	libmodbus, libmspack, libnids, libopenh264, liboping, libraw,
+	librelp, libsamplerate, libtirpc, libusb, libuv, libxcb,
+	libxml2, libxslt, live555, llvm, lmbench, localedef,
+	lttng-tools, lvm2, lz4, mesa3d, mimic, mini-snmpd, minidlna,
+	minissdpd, minizip, mono-gtksharp3, mpg123, mpv, msmtp, musl,
+	mutt, nasm, nbd, netperf, netsurf, nginx, odb, opencv3,
+	openssh, opentyrian, oprofile, p7zip, paho-mqtt-c, perl,
+	php-imagick, pifmrds, picocom, pigz, pngquant, poco,
+	postgresql, prosody, proxychains-ng, pulseaudio, putty, pwgen,
+	python-autobahn, python-bluezero, python-engineio,
+	python-keyring, python-pillow, python-requests, python-tqdm,
+	qemu, qpdf, qt5base, redis, refpolicy, rt-tests, runc,
+	shellinabox, squid, strace, supervisor, synergy, taglib,
+	tclap, terminology, thermald, tini, tinyproxy, tinyxml2,
+	tpm2-tss, uclibc, udisks, uhd, unscd, vlc, waylandpp,
+	webkitgtk, weston, wireshark, wpa_supplicant, wpewebkit,
+	xlib_libdmx, xlib_libFS, xlib_libICE, xlib_libX11,
+	xlib_libXcursor, xlib_libXdmcp, xlib_libXext, xlib_libXfixes,
+	xlib_libXfont2, xlib_libXinerama, xlib_libXpm, xlib_libXres,
+	xlib_libXt, xlib_libXtst, xlib_libXxf86dga, xlib_libXxf86vm,
+	xterm
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13781: isc dhcp-server package don't create file /usr/bin/dhcpd
+	#13801: toolchainfile.cmake CMAKE_BUILD_TYPE
+	#13806: Building host-localedef fails on fedora 34/gcc 11
+
 2021.02.2, released May 12th, 2021
 
 	Important / security related fixes.
