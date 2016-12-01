From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 01 Dec 2016 22:21:46 -0000
Subject: [Buildroot] [git commit] cryptsetup: bump version to 1.7.3
Message-ID: <20161201222136.EFB937FB56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10189569cae26bdd2bb40c586590b0975940249f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index 5972bf8..b8c0d2b 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.7/sha256sums.asc
-sha256	dbb35dbf5f0c1749168c86c913fe98e872247bfc8425314b494c2423e7e43342	cryptsetup-1.7.2.tar.xz
+sha256 af2b04e8475cf40b8d9ffd97a1acfa73aa787c890430afd89804fb544d6adc02  cryptsetup-1.7.3.tar.xz
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index d7bd251..50bf5f2 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 1.7
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).2
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf \
