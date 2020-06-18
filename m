From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 15:32:56 +0200
Subject: [Buildroot] [git commit] package/libva-intel-driver: bump version
 to 2.4.1
Message-ID: <20200618133116.280BA8050F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e16785dc7c158b9a640136a09b6d7a59296b9044
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva-intel-driver/libva-intel-driver.hash | 6 +++---
 package/libva-intel-driver/libva-intel-driver.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index 555aa9473b..4bf827748f 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,5 +1,5 @@
 # From https://github.com/intel/intel-vaapi-driver/releases
-sha1 5f805f6a040f5beab6693d11765618cc92d2076b  intel-vaapi-driver-2.4.0.tar.bz2
+sha1  c998e06f13238c6419bb38ede9a13e453312737b  intel-vaapi-driver-2.4.1.tar.bz2
 # Locally computed
-sha256 71e2ddd985af6b221389db1018c4e8ca27a7f939fb51dcdf49d0efcb5ff3d089  intel-vaapi-driver-2.4.0.tar.bz2
-sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
+sha256  0081fce08eb3a83f7d99c3b853c8fdfa0af437b8f5b0fb7c66faeb83bcbe0c19  intel-vaapi-driver-2.4.1.tar.bz2
+sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index 1cf113c406..ad801dc957 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 2.4.0
+LIBVA_INTEL_DRIVER_VERSION = 2.4.1
 LIBVA_INTEL_DRIVER_SOURCE = intel-vaapi-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = \
 	https://github.com/intel/intel-vaapi-driver/releases/download/$(LIBVA_INTEL_DRIVER_VERSION)
