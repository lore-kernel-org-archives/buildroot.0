From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 30 Nov 2015 16:20:41 +0000
Subject: [Buildroot] [PATCH next] lvm2: bump version to 2.02.136
Message-ID: <1448900441-3389-1-git-send-email-Vincent.Riera@imgtec.com>
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
index a51b9a4..99c576e 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 698fadf1a12f6bfc6f8bd9d6499d2cf181e2cf7b9a5105b58cb55168f6104c949aa5d5da0585194d54614128a14abc7b939d43b32f7175057ad14cb1c62796a0  LVM2.2.02.135.tgz
+sha512 ebda683e7dbeb2c4860a583d47e60756d18127e37a373ab2958af8e54b9bee0d2e3370b7803d88fa4b08564345c88af55bfbac317081160118ce4b3733b69f9d  LVM2.2.02.136.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 9caa051..71e69d6 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.135
+LVM2_VERSION = 2.02.136
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-- 
2.4.10
