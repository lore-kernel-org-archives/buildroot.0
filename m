From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 5 Mar 2015 23:05:21 +0000
Subject: [Buildroot] [PATCH] lvm2: bump version to 2.02.117
Message-ID: <1425596721-20962-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 2.02.117
- Update the hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lvm2/lvm2.hash |    2 +-
 package/lvm2/lvm2.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index adffcdb..e7f7b2d 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/md5.sum
-md5  f71aa8e64030f3d2a3fdabcc36e45094  LVM2.2.02.113.tgz
+md5  ab5889dae7924b44ed2444161058a419  LVM2.2.02.117.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 48a3116..6e324eb 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.113
+LVM2_VERSION = 2.02.117
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-- 
1.7.1
