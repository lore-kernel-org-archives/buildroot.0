From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Mar 2016 11:16:47 +0200
Subject: [Buildroot] [PATCH v2 02/18] package/libdcadec: bump version to
	v0.2.0
In-Reply-To: <1459070223-5901-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459070223-5901-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459070223-5901-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version bump is needed by ffmpeg 3.0:
http://git.videolan.org/?p=ffmpeg.git;a=blobdiff;f=configure;h=a30d831c97575858c760694f191b4efe71360301;hp=8cbd5e574979e1a9492754aa41fcff233ee8da33;hb=27ce53b52d0d5f2c1d59da13491b74fe73cde964;hpb=26a84e2dae4007628d30cae746822486076767ee

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdcadec/libdcadec.hash | 2 ++
 package/libdcadec/libdcadec.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/libdcadec/libdcadec.hash

diff --git a/package/libdcadec/libdcadec.hash b/package/libdcadec/libdcadec.hash
new file mode 100644
index 0000000..dda58d1
--- /dev/null
+++ b/package/libdcadec/libdcadec.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	ed9d207fde3e8d576f3af8b0d1235b3371e315175757173689104efcaebf0d44	libdcadec-v0.2.0.tar.gz
diff --git a/package/libdcadec/libdcadec.mk b/package/libdcadec/libdcadec.mk
index 2b391fc..48e4a12 100644
--- a/package/libdcadec/libdcadec.mk
+++ b/package/libdcadec/libdcadec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDCADEC_VERSION = 2a9186e34ce557d3af1a20f5b558d1e6687708b9
+LIBDCADEC_VERSION = v0.2.0
 LIBDCADEC_SITE = $(call github,foo86,dcadec,$(LIBDCADEC_VERSION))
 LIBDCADEC_LICENSE = LGPLv2.1+
 LIBDCADEC_LICENSE_FILES = COPYING.LGPLv2.1
-- 
2.8.0.rc3
