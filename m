From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Jul 2010 00:17:09 +0200
Subject: [Buildroot] [git commit master 1/1] flex: bump patch version
Message-ID: <20100718221729.6A27C80800@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8c1a4f3132adce123e2750577d9f082e258e5f41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 9 is no more available on Debian FTP.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    2 +-
 package/flex/flex.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 99900ad..5964ada 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,7 +16,7 @@
 
 	Updated/fixed packages: alsa-lib, berkeleydb, bash, blackbox,
 	busybox, bzip2, cdrkit, cmake, dash, dhcp, dialog, diffutils,
-	distcc, dmalloc, dnsmasq, dropbear, e2fsprogs, fbv, file,
+	distcc, dmalloc, dnsmasq, dropbear, e2fsprogs, fbv, file, flex,
 	fontconfig, gawk, gstreamer, gzip, intltool, ipsec-tools,
 	iptables, libart, libcgi, libfuse, libgpg-error, libidn,
 	liblockfile, libpng, links, linux-fusion, lmbench, lrzsz,
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 43e7d57..ad35548 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 FLEX_VERSION:=2.5.35
-FLEX_PATCH_VERSION:=9
+FLEX_PATCH_VERSION:=9.1
 FLEX_SOURCE:=flex_$(FLEX_VERSION).orig.tar.gz
 FLEX_PATCH:=flex_$(FLEX_VERSION)-$(FLEX_PATCH_VERSION).diff.gz
 FLEX_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/flex
-- 
1.7.1
