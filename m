From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 22 Nov 2009 21:51:46 +0100
Subject: [Buildroot] [git commit master] Bump iw package to 0.9.17
Message-ID: <20091122210624.8AD40777EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bd49a62d8ab7616f087620c3f8aa16d4b328a36c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #731

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |    9 +++++----
 package/iw/iw.mk |    2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index c46b129..2255f1d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -12,10 +12,10 @@
 
 	Updated/fixed packages: autoconf, busybox, gcc, directfb, dnsmasq,
 	e2fsprogs, festival, gstreamer, gst-plugins-bad, gst-plugins-base,
-	gst-plugins-good, imagemagick, ipkg, iptables, kernel-headers, kismet,
-	libelf, libevent, libglib2, libidn, liblockfile, libmad, libpcap,
-	libupnp, libuuid, lighttpd, ltrace, lua, lzma, mdadm, ncftp, ncurses,
-	netkittelnet, netsnmp, ntfs-3g, openntp, openssl, php, python,
+	gst-plugins-good, imagemagick, ipkg, iptables, iw, kernel-headers,
+	kismet, libelf, libevent, libglib2, libidn, liblockfile, libmad,
+	libpcap, libupnp, libuuid, lighttpd, ltrace, lua, lzma, mdadm, ncftp,
+	ncurses, netkittelnet, netsnmp, ntfs-3g, openntp, openssl, php, python,
 	quagga, radvd, rsync, samba, sawman, shared-mime-info, speech-tools,
 	sqlite, squashfs, synergy, syslinux, tcpdump, u-boot, util-linux,
 	valgrind, vsftpd, wipe
@@ -49,6 +49,7 @@
 	#713: Migrate openntpd package to Makefile.autotools.in
 	#715: Bump libidn package to 1.15 and other fixes
 	#717: Bump dnsmasq to 2.51 and introduce new IDN option
+	#731: Bump iw package to 0.9.17
 
 2009.08, Released August 31th, 2009:
 
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index dab6eee..9028ba1 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IW_VERSION = 0.9.15
+IW_VERSION = 0.9.17
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
 IW_DEPENDENCIES = libnl
-- 
1.6.3.3
