From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue,  2 Feb 2016 23:52:36 -0200
Subject: [Buildroot]  [PATCH 2/2] yad: bump to version 0.33.1
In-Reply-To: <1454464356-12637-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1454464356-12637-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1454464356-12637-2-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
This patch is completely unrelated to the build fix [PATCH 1/2].
But both patches change the same package, so I didn't see any harm in
sending it as a patch series.
---
 package/yad/yad.hash | 5 +++--
 package/yad/yad.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/yad/yad.hash b/package/yad/yad.hash
index 4e88ab0..1839282 100644
--- a/package/yad/yad.hash
+++ b/package/yad/yad.hash
@@ -1,2 +1,3 @@
-# Locally computed
-sha256 c91d6a9eb36abdb502d2d8ada0ec29c266b94a6628f723adeca436bee0b6c55c yad-0.31.2.tar.xz
+# From http://sourceforge.net/projects/yad-dialog/files/
+md5	4e24888712be1e95fd3cea815f19c6cb	yad-0.33.1.tar.xz
+sha1	b39977128678ca67bf4649929510f729c9cf1e67	yad-0.33.1.tar.xz
diff --git a/package/yad/yad.mk b/package/yad/yad.mk
index 9d7ab37..9c07d91 100644
--- a/package/yad/yad.mk
+++ b/package/yad/yad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YAD_VERSION = 0.31.2
+YAD_VERSION = 0.33.1
 YAD_SOURCE = yad-$(YAD_VERSION).tar.xz
 YAD_SITE = http://sourceforge.net/projects/yad-dialog/files
 YAD_LICENSE = GPLv3
-- 
1.9.1
