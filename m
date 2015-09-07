From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Sep 2015 11:35:30 +0100
Subject: [Buildroot] [PATCH] lvm2: bump to version 2.02.130
Message-ID: <1441622130-31214-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release announcement:

https://www.redhat.com/archives/lvm-devel/2015-September/msg00048.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lvm2/lvm2.hash |    4 +++-
 package/lvm2/lvm2.mk   |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index eda465d..6aae05a 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,4 @@
 # From ftp://sources.redhat.com/pub/lvm2/md5.sum
-md5  2d24ba982c8a85e8c837210f087a6a51  LVM2.2.02.125.tgz
+md5 e7ae07e413120713549cc6dd2a558c75  LVM2.2.02.130.tgz
+# Locally calculated
+sha256 1d9af1ce498453639bb353d593980eca5c7ca9cc7734ace61454191f7c669d29  LVM2.2.02.130.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 0930a10..73a27ad 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.125
+LVM2_VERSION = 2.02.130
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-- 
1.7.1
