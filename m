From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 23:54:08 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20121117225527.CD67B9A081@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ab9a3fb790b3c734c08d4819201e9d76fe670e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index d1a4888..9c3be6b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,7 +10,7 @@
 	barebox 2012.08/09/10/11, linker overlap issue fix for
 	at91bootstrap, mxs-bootlets updated for new Barebox versions.
 
-	Toolchains: binutils 2.23.1, gcc 4.72, default to gcc 4.6.x,
+	Toolchains: binutils 2.23.1, gcc 4.7.2, default to gcc 4.6.x,
 	Codebench arm/sh/x86 2012.03/09, Linaro 2012.08/09/10.
 	Libtirpc support for modern glibc variants. Toolchain on
 	target has been deprecated.
@@ -31,17 +31,17 @@
 	_LICENSE / _REDISTRIBUTE splitup, per-package hooks.
 
 	Updated/fixed packages: acpid, alsa-lib, alsa-utils,
-	alsamixergui, autoconf, automake, bash, bind, binutils, bison,
-	blackbox, bluez-utils, busybox, cairo, can-utils, cifs-utils,
-	cjson, cmake, collectd, connman, conntrack-tools, coreutils,
-	cups, cvs, dbus, dhcp, directfb, dmalloc, dnsmasq, dropbear,
-	e2fsprogs, ethtool, fbdump, feh, fftw, file, flashrom,
-	fluxbox, gdb, gdisk, gdk-pixbuf, genext2fs, gettext, gnutls,
-	gpsd, gqview, grep, gst-plugins-{bad,good}, hdparm, hiawatha,
-	hostapd, input-tools, iproute2, ipset, iptables, iw, json-c,
-	kexec, kmod, lcdproc, leafpad, less, libcurl, libdrm,
-	libdvdnav, libdvdread, libffi, libfuse, libglib2, libhid,
-	liblockfile, libmad, libmbus, libmnl,
+	alsamixergui, attr, autoconf, automake, bash, bind, binutils,
+	bison, blackbox, bluez-utils, busybox, cairo, can-utils,
+	cifs-utils, cjson, cmake, collectd, connman, conntrack-tools,
+	coreutils, cups, cvs, dbus, dhcp, directfb, dmalloc, dnsmasq,
+	dropbear, e2fsprogs, ethtool, fbdump, feh, fftw, file,
+	flashrom, fluxbox, gdb, gdisk, gdk-pixbuf, genext2fs, gettext,
+	gnutls, gpsd, gqview, grep, gsl, gst-plugins-{bad,good},
+	hdparm, hiawatha, hostapd, input-tools, iproute2, ipset,
+	iptables, iw, json-c, kexec, kmod, lcdproc, leafpad, less,
+	libcurl, libdrm, libdvdnav, libdvdread, libffi, libfuse,
+	libglib2, libhid, liblockfile, libmad, libmbus, libmnl,
 	libnetfilter_{acct,conntrack,cthelper,cttimeout,queue},
 	libnfc, libnfc-llcp, libnfnetlink, libnl, libnspr, libnss,
 	libpcap, libplayer, libtool, libtorrent, liburcu, libv4l,
