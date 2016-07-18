From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 18 Jul 2016 10:26:37 +0100
Subject: [Buildroot] [PATCH 2/2] lvm2: bump version to 2.02.161
In-Reply-To: <1468833997-36127-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1468833997-36127-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1468833997-36127-2-git-send-email-Vincent.Riera@imgtec.com>
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
-- 
2.7.3
