From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Sun,  1 Jun 2014 19:37:27 +0200
Subject: [Buildroot] [PATCH 1/2] busybox: add fbset to default configs
Message-ID: <1401644248-27612-1-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some drivers (like ti-gfx) need fbset and we can't select it when we
use BusyBox because it is provided by BusyBox and as a package.

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
---
 package/busybox/busybox-1.19.x.config | 6 +++---
 package/busybox/busybox-1.20.x.config | 6 +++---
 package/busybox/busybox-1.21.x.config | 6 +++---
 package/busybox/busybox-1.22.x.config | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/busybox/busybox-1.19.x.config b/package/busybox/busybox-1.19.x.config
index bf5e8df..08e14c7 100644
--- a/package/busybox/busybox-1.19.x.config
+++ b/package/busybox/busybox-1.19.x.config
@@ -525,9 +525,9 @@ CONFIG_BLKID=y
 # CONFIG_FEATURE_BLKID_TYPE is not set
 CONFIG_DMESG=y
 CONFIG_FEATURE_DMESG_PRETTY=y
-# CONFIG_FBSET is not set
-# CONFIG_FEATURE_FBSET_FANCY is not set
-# CONFIG_FEATURE_FBSET_READMODE is not set
+CONFIG_FBSET=y
+CONFIG_FEATURE_FBSET_FANCY=y
+CONFIG_FEATURE_FBSET_READMODE=y
 CONFIG_FDFLUSH=y
 CONFIG_FDFORMAT=y
 # CONFIG_FDISK is not set
diff --git a/package/busybox/busybox-1.20.x.config b/package/busybox/busybox-1.20.x.config
index 5525434..085d43c 100644
--- a/package/busybox/busybox-1.20.x.config
+++ b/package/busybox/busybox-1.20.x.config
@@ -539,9 +539,9 @@ CONFIG_BLKID=y
 # CONFIG_FEATURE_BLKID_TYPE is not set
 CONFIG_DMESG=y
 CONFIG_FEATURE_DMESG_PRETTY=y
-# CONFIG_FBSET is not set
-# CONFIG_FEATURE_FBSET_FANCY is not set
-# CONFIG_FEATURE_FBSET_READMODE is not set
+CONFIG_FBSET=y
+CONFIG_FEATURE_FBSET_FANCY=y
+CONFIG_FEATURE_FBSET_READMODE=y
 CONFIG_FDFLUSH=y
 CONFIG_FDFORMAT=y
 # CONFIG_FDISK is not set
diff --git a/package/busybox/busybox-1.21.x.config b/package/busybox/busybox-1.21.x.config
index e46b528..fbae26e 100644
--- a/package/busybox/busybox-1.21.x.config
+++ b/package/busybox/busybox-1.21.x.config
@@ -541,9 +541,9 @@ CONFIG_BLKID=y
 # CONFIG_FEATURE_BLKID_TYPE is not set
 CONFIG_DMESG=y
 CONFIG_FEATURE_DMESG_PRETTY=y
-# CONFIG_FBSET is not set
-# CONFIG_FEATURE_FBSET_FANCY is not set
-# CONFIG_FEATURE_FBSET_READMODE is not set
+CONFIG_FBSET=y
+CONFIG_FEATURE_FBSET_FANCY=y
+CONFIG_FEATURE_FBSET_READMODE=y
 CONFIG_FDFLUSH=y
 CONFIG_FDFORMAT=y
 # CONFIG_FDISK is not set
diff --git a/package/busybox/busybox-1.22.x.config b/package/busybox/busybox-1.22.x.config
index e8db3bc..544b82f 100644
--- a/package/busybox/busybox-1.22.x.config
+++ b/package/busybox/busybox-1.22.x.config
@@ -544,9 +544,9 @@ CONFIG_BLKID=y
 # CONFIG_FEATURE_BLKID_TYPE is not set
 CONFIG_DMESG=y
 CONFIG_FEATURE_DMESG_PRETTY=y
-# CONFIG_FBSET is not set
-# CONFIG_FEATURE_FBSET_FANCY is not set
-# CONFIG_FEATURE_FBSET_READMODE is not set
+CONFIG_FBSET=y
+CONFIG_FEATURE_FBSET_FANCY=y
+CONFIG_FEATURE_FBSET_READMODE=y
 CONFIG_FDFLUSH=y
 CONFIG_FDFORMAT=y
 # CONFIG_FDISK is not set
-- 
1.9.3
