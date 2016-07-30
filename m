From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 14:01:01 +0200
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.162
Message-ID: <20160730120116.F07D88180E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc755aed9229d38056e4996cefd149c234b21c3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 4cce78c..65945a1 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 7717d9f3b5bfb57dc240bc18673c66bc308de95c32f02090bc36b7d5264c2bfdadf234b0fcadc24b6099cf9f9c1d10be521200567b1e9744e71c252dc57dbf46  LVM2.2.02.161.tgz
+sha512 9544bb7706488ac128d477af7294bcfd7b7e47cb0b1d604ea52c4545d6c3a5a71311945994dd1114cb1ce086d2006a35ef1d8b0fdd3082dfe5cc468cb0168057  LVM2.2.02.162.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index fed8273..8a51120 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.161
+LVM2_VERSION = 2.02.162
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
