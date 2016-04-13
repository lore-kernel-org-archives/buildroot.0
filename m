From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:34:58 +0200
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.150
Message-ID: <20160413203501.8917F81838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ac2c983b2b17130b3459b5c228a0530cc78ad0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 88998c4..959be39 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 f00310fd398d4f84d67677e47b148ab5cc79319e25547ee56160703a425f2f506a4c92ee9958c363a1640ae1fa17b4337242d76e0c5e4a256192edfbf9c4fcdc  LVM2.2.02.149.tgz
+sha512 66d1a247170f685c72d91d5fc52a2394ba5d5a477686101b9a472a8ac163813f9c80c0d75e4f29939b16000456263e9191cd294520ab5b320915f23f0797f22e  LVM2.2.02.150.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index d17a772..d78f621 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.149
+LVM2_VERSION = 2.02.150
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
