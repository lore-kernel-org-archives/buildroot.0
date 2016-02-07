From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 23:33:03 +0100
Subject: [Buildroot] [git commit] yad: bump to version 0.33.1
Message-ID: <20160207223325.CA5DC80826@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33d5f4f9f337d545160a634a41378ed6bbeb92e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
index 24d331c..a7f5ba2 100644
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
