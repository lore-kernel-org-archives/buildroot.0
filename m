From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 8 Dec 2009 09:53:37 +0100
Subject: [Buildroot] [git commit master] libfuse: bump version number to
	2.8.1
Message-ID: <20091208090656.E9011774A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e2e455aa7e4af036d94e33ab6dc087110a553e1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Mack <daniel@caiaq.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    2 +-
 package/fuse/libfuse.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index a020fc9..fcacd5b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,7 @@
 	New packages: tcpreplay, hostapd
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
-	directfb, iw, libpcap, lighttpd, mesa, pcre, usbutils
+	directfb, iw, libfuse, libpcap, lighttpd, mesa, pcre, usbutils
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/fuse/libfuse.mk b/package/fuse/libfuse.mk
index 05bc389..b45f9ee 100644
--- a/package/fuse/libfuse.mk
+++ b/package/fuse/libfuse.mk
@@ -3,7 +3,7 @@
 # libfuse
 #
 #############################################################
-LIBFUSE_VERSION:=2.7.3
+LIBFUSE_VERSION:=2.8.1
 LIBFUSE_SOURCE:=fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/
 LIBFUSE_DIR:=$(BUILD_DIR)/fuse-$(LIBFUSE_VERSION)
-- 
1.6.3.3
