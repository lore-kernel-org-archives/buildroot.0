From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 8 Jul 2015 10:51:51 +0200
Subject: [Buildroot] [PATCH] lvm2: bump to version 2.02.125
Message-ID: <1436345511-7449-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 982cfc7..eda465d 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/md5.sum
-md5  da8d81a6a2ea235025795d9e001a6ae3  LVM2.2.02.124.tgz
+md5  2d24ba982c8a85e8c837210f087a6a51  LVM2.2.02.125.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index c112b97..0930a10 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.124
+LVM2_VERSION = 2.02.125
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-- 
2.3.6
