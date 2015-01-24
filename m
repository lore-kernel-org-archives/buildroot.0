From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 24 Jan 2015 16:49:05 +0100
Subject: [Buildroot] [PATCH 2/2] package/libdrm: bump version to 2.4.59,
	add hash
In-Reply-To: <1422114545-19053-1-git-send-email-bernd.kuhls@t-online.de>
References: <1422114545-19053-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1422114545-19053-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash |    2 ++
 package/libdrm/libdrm.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/libdrm/libdrm.hash

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
new file mode 100644
index 0000000..c893e76
--- /dev/null
+++ b/package/libdrm/libdrm.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/dri-devel/2015-January/075921.html
+sha256	68d26e1fd85582f4243d66864f9b43ca4ee93662825de32b5506fc8e181ea41b	libdrm-2.4.59.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 28a801f..737a33b 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.58
+LIBDRM_VERSION = 2.4.59
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
1.7.10.4
