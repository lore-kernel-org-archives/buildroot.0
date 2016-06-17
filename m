From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 17 Jun 2016 17:54:24 +0100
Subject: [Buildroot] [PATCH] lvm2: bump version to 2.02.156
Message-ID: <1466182464-10796-1-git-send-email-Vincent.Riera@imgtec.com>
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
index fb72358..22c507e 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 f2c7bad06d443aa96961f70951b55de764a882c67e94fdeec2eba83f8a9c9b736971a58bbb01ae7c35d43b39ad2a69128369c6bd74ab81f3c5770c4b67e753f8  LVM2.2.02.155.tgz
+sha512 b69736b189a9f458aa942aeb0e5770b7661fc345827d82b58bda13e6e5667869664194ee5f4c9a7f9a1c6a9bc3bcbd88a6e0b79a47ef6c27fcce35f8e1975a7f  LVM2.2.02.156.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 65860b5..b36b521 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.155
+LVM2_VERSION = 2.02.156
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-- 
2.7.3
