From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 18 Mar 2016 12:16:06 +0000
Subject: [Buildroot] [PATCH] lvm2: bump version to 2.02.146
Message-ID: <1458303366-28917-1-git-send-email-Vincent.Riera@imgtec.com>
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
index 8390596..12a5e3b 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 7689a7a26af6ba8fa5a46a96f3bf757c149806f813740b2df004692a63f05cfc522321d67984d34a1c34d55eb1dab5513b2a6bc48c46a7daec873607ea3ada39  LVM2.2.02.144.tgz
+sha512 d9f4033db8cf010f46615fa6ece739724f50e10a8564d1e8f1766f71c6fd58f2d3bff3415def8c7bed7319a86980120a3a8665885e3ab6acfe4ac3a8011f749c  LVM2.2.02.146.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 74e0e4f..5ea27b3 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.144
+LVM2_VERSION = 2.02.146
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-- 
2.7.3
