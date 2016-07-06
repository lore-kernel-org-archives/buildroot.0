From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 13:54:45 +0200
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.159
Message-ID: <20160706115454.89365821AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f324adc465d6f5f9c26f49eff0178e9854355cb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index ed9f0dd..12edc96 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 f00762ef4413c19d0d33c55f03946f27e234583af1096c320d43adb34189521da8bdd8c29b9ac96df20cdabffbe9eb11bacd1902f00c0a07d01b68a04792e326  LVM2.2.02.158.tgz
+sha512 57f784e0d252865f8b75ef8b5cc3fcd15eedd94c0cd590ba8e4a9edaeb80e0befa3f9df27357e7216047e94b079ced4b524d5b6cb68ad12c62adb88addf53d21  LVM2.2.02.159.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 7e66aa2..64eb926 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.158
+LVM2_VERSION = 2.02.159
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
