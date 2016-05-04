From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 May 2016 22:45:45 +0200
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.152
Message-ID: <20160504205128.6F2EB81ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1eb28a351ef4608e7723a29a3c743f3e278bbc0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 7e1458a..a4febba 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 b2def85d380fb96b40537fac4fdc7c14a009a45b0a1cdfb48714fe99d6f6a659376e0f762cc7dd778c747bab75427f13948895d6eb28a05cfc752a4eca56ee81  LVM2.2.02.151.tgz
+sha512 44ebf79ee90f371835d9525db09e98e439ca5a6fcec4bfe4cb790df4c11e32e6dc4abea6a60e2f4f5a5e85c635354f10cc4d5ad04bbbf21653a357ca581defac  LVM2.2.02.152.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index b1783c9..80fecd3 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.151
+LVM2_VERSION = 2.02.152
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
