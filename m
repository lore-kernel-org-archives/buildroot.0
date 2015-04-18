From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:25:55 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xcmsdb: bump version to
	1.0.5, add hash
Message-ID: <20150418162757.3DA857F8C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f55cfb4a2ac869eed6c49fa8d4f63c2881f142e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash |    2 ++
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
new file mode 100644
index 0000000..cc5bbcd
--- /dev/null
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002567.html
+sha256	e5585361bb8b6a05bb814a8d0e444ee93e0f00180881d3070aff4571e97f67c6	xcmsdb-1.0.5.tar.bz2
diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
index d08dfaa..3cccacc 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCMSDB_VERSION = 1.0.4
+XAPP_XCMSDB_VERSION = 1.0.5
 XAPP_XCMSDB_SOURCE = xcmsdb-$(XAPP_XCMSDB_VERSION).tar.bz2
 XAPP_XCMSDB_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCMSDB_LICENSE = MIT
