From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 27 Sep 2016 10:26:32 +0100
Subject: [Buildroot] [PATCH] lvm2: bump version to 2.02.166
Message-ID: <20160927092632.15855-1-Vincent.Riera@imgtec.com>
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
index c7e7307..a269eb6 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 33324ad334852bc4217a9c33ded0a05645dac5141c68e34f1d385662be7e5bd5a4bc73539dd9c507cd7013d67b893b171df5d59e4f0b253233b003e7d48ac7a0  LVM2.2.02.165.tgz
+sha512 8bebe9b474f791b5edf5366b0bd24861fbbaf8a83afa2a9e2a8e3917e05e4ecbf6877f018be03ffb4e9b4c8832208264165b85182bf79a07661adf35128b4a21  LVM2.2.02.166.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 3a5dcff..d76cdd2 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.165
+LVM2_VERSION = 2.02.166
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-- 
2.10.0
