From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Nov 2009 20:08:11 +0100
Subject: [Buildroot] [git commit master] ipkg: update source URL
Message-ID: <20091117190906.059D87778D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e428886e5754b63d7103ce421b1e5658c2eef195
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ftp.handhelds.org doesn't seem to work any more.

Signed-off-by: Michael S. Zick <minimod@morethan.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    2 +-
 package/ipkg/ipkg.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 584fa74..2bb1197 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 
 	Updated/fixed packages: autoconf, busybox, gcc, directfb, dnsmasq,
 	e2fsprogs, festival, gstreamer, gst-plugins-bad, gst-plugins-base,
-	gst-plugins-good, imagemagick, iptables, kernel-headers, kismet,
+	gst-plugins-good, imagemagick, ipkg, iptables, kernel-headers, kismet,
 	libelf, libevent, libglib2, libidn, liblockfile, libmad, libpcap,
 	libupnp, libuuid, lighttpd, ltrace, lua, lzma, mdadm, ncftp, ncurses,
 	netkittelnet, netsnmp, ntfs-3g, openntp, openssl, php, python,
diff --git a/package/ipkg/ipkg.mk b/package/ipkg/ipkg.mk
index 1e586ce..5f640f6 100644
--- a/package/ipkg/ipkg.mk
+++ b/package/ipkg/ipkg.mk
@@ -6,7 +6,7 @@
 
 IPKG_VERSION = 0.99.163
 IPKG_SOURCE = ipkg-$(IPKG_VERSION).tar.gz
-IPKG_SITE = http://ftp.handhelds.org/packages/ipkg
+IPKG_SITE = http://www.handhelds.org/download/packages/ipkg
 IPKG_AUTORECONF = NO
 IPKG_INSTALL_STAGING = YES
 IPKG_INSTALL_TARGET = YES
-- 
1.6.3.3
