From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 16 May 2016 10:46:59 +0100
Subject: [Buildroot] [PATCH next] lvm2: bump version to 2.02.154
Message-ID: <1463392019-24317-1-git-send-email-Vincent.Riera@imgtec.com>
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
index 2aa7d78..97b1b58 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 1c1c3f95ab76e23629ee54b87d36536f887d8a30976413206491a3a13101b717948b3ab4a7778cb1e74f258f429871076f0b9d098785835c4885eb61def793ca  LVM2.2.02.153.tgz
+sha512 aa0599d9c77099f750237ad230c91a35890b248130b81bfd81fc72f510b2b21f28a87491532f4ab1d040338fa6945af6391d032a574538f8672072ac8c185eef  LVM2.2.02.154.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index d45a108..1a3241d 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.153
+LVM2_VERSION = 2.02.154
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-- 
2.7.3
