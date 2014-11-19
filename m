From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 19 Nov 2014 17:31:20 +0000
Subject: [Buildroot] [PATCH] lvm2: bump version to 2.02.112
Message-ID: <1416418280-28409-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 2.02.112
- Update hash value

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lvm2/lvm2.hash |    2 +-
 package/lvm2/lvm2.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 10f2905..3f03df5 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/md5.sum
-md5	02487ab2a9e02d1ee76fe217183df28a	LVM2.2.02.111.tgz
+md5  1f4033b750f68b68e9bd66d3661a2c3f  LVM2.2.02.112.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 76c2f82..bef22fb 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.111
+LVM2_VERSION = 2.02.112
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-- 
1.7.1
