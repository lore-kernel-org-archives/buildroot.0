From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:09:00 +0200
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.161
Message-ID: <20160718211128.011947FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22e83959f61661f54d9cb291b86ba8b967968ea3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 12edc96..4cce78c 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 57f784e0d252865f8b75ef8b5cc3fcd15eedd94c0cd590ba8e4a9edaeb80e0befa3f9df27357e7216047e94b079ced4b524d5b6cb68ad12c62adb88addf53d21  LVM2.2.02.159.tgz
+sha512 7717d9f3b5bfb57dc240bc18673c66bc308de95c32f02090bc36b7d5264c2bfdadf234b0fcadc24b6099cf9f9c1d10be521200567b1e9744e71c252dc57dbf46  LVM2.2.02.161.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 64eb926..0341670 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.159
+LVM2_VERSION = 2.02.161
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
