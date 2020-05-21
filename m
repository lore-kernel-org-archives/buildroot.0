From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 May 2020 15:37:15 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-mythtv: bump
 version to 5.10.16-Leia
Message-ID: <20200521132050.54EE091B23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac53acc640ecd4777e94e3add1b1d5120fd2a335
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index c70e032289..4faeb1f04d 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 36d9142e0e19b904e1c4a6d8cd67063d291e63971f80a98a6f24b7f4554bb2e3  kodi-pvr-mythtv-5.10.15-Leia.tar.gz
+sha256 fef27e73009f095a22e4843e48455a343a4fe095ae9692b9fa96ffac7fb0844c  kodi-pvr-mythtv-5.10.16-Leia.tar.gz
 sha256 0efb11009d447b39ec35d77dc265db3d1c3d261730bbc33b267587254d973ec8  debian/copyright
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index b89db3a455..ca1d533a57 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 5.10.15-Leia
+KODI_PVR_MYTHTV_VERSION = 5.10.16-Leia
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = debian/copyright
