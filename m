From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 9 May 2016 10:04:40 +0100
Subject: [Buildroot] [PATCH 1/2] lvm2: bump version to 2.02.153
Message-ID: <1462784681-63929-1-git-send-email-Vincent.Riera@imgtec.com>
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
index a4febba..2aa7d78 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 44ebf79ee90f371835d9525db09e98e439ca5a6fcec4bfe4cb790df4c11e32e6dc4abea6a60e2f4f5a5e85c635354f10cc4d5ad04bbbf21653a357ca581defac  LVM2.2.02.152.tgz
+sha512 1c1c3f95ab76e23629ee54b87d36536f887d8a30976413206491a3a13101b717948b3ab4a7778cb1e74f258f429871076f0b9d098785835c4885eb61def793ca  LVM2.2.02.153.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 80fecd3..d45a108 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.152
+LVM2_VERSION = 2.02.153
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-- 
2.7.3
