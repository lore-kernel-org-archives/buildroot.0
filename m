From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 27 Jun 2016 09:11:13 +0100
Subject: [Buildroot] [PATCH] lvm2: bump version to 2.02.158
Message-ID: <1467015073-30018-1-git-send-email-Vincent.Riera@imgtec.com>
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
index 22c507e..ed9f0dd 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 b69736b189a9f458aa942aeb0e5770b7661fc345827d82b58bda13e6e5667869664194ee5f4c9a7f9a1c6a9bc3bcbd88a6e0b79a47ef6c27fcce35f8e1975a7f  LVM2.2.02.156.tgz
+sha512 f00762ef4413c19d0d33c55f03946f27e234583af1096c320d43adb34189521da8bdd8c29b9ac96df20cdabffbe9eb11bacd1902f00c0a07d01b68a04792e326  LVM2.2.02.158.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index b36b521..62cc4e2 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.156
+LVM2_VERSION = 2.02.158
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-- 
2.7.3
