From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 19:01:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/libseccomp: bump version to 2.2.3
Message-ID: <1454176919-12144-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libseccomp/libseccomp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index a188298..69559f7 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = v2.2.0
+LIBSECCOMP_VERSION = v2.2.3
 LIBSECCOMP_SITE = $(call github,seccomp,libseccomp,$(LIBSECCOMP_VERSION))
 LIBSECCOMP_LICENSE = LGPLv2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
-- 
2.7.0.rc3
