From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 14:40:25 +0200
Subject: [Buildroot] [PATCH 13/32] package/x11r7/xapp_xcmsdb: bump version
	to 1.0.5, add hash
In-Reply-To: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429360844-12625-13-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash |    2 ++
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash

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
-- 
1.7.10.4
