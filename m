From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Mar 2010 23:58:54 +0100
Subject: [Buildroot] [git commit master] freetype: bump to 2.3.12
Message-ID: <20100322225942.1A0C5776F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=abbf529f96c75e71c7eba364a1d3341b88a6520d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: William Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    6 +++---
 package/freetype/freetype.mk |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index effddab..79bd7f6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,9 +7,9 @@
 
 	New packages: librsync
 
-	Updated/fixed packages: busybox, dosfstools, e2fsprogs, iperf,
-	libglib2, libpng, mdadm, memstat, mtd-utils, pppd, setserial,
-	squashfs, wget
+	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
+	freetype, iperf, libglib2, libpng, mdadm, memstat, mtd-utils,
+	pppd, setserial, squashfs, wget
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index abc0afc..cffe811 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -3,7 +3,7 @@
 # freetype
 #
 #############################################################
-FREETYPE_VERSION = 2.3.9
+FREETYPE_VERSION = 2.3.12
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_LIBTOOL_PATCH = NO
-- 
1.6.3.3
