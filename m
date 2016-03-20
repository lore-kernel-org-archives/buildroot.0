From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 14:56:59 +0100
Subject: [Buildroot] [git commit] package/libva-intel-driver: bump version
	to 1.7.0
Message-ID: <20160320135747.4E5E4817A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b94891ce1cfe4c194a388d2b1d659304bb9d6899
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva-intel-driver/libva-intel-driver.hash | 4 ++--
 package/libva-intel-driver/libva-intel-driver.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index 1b2d754..9d77aed 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/libva/2015-December/003820.html
-sha1	7ecc2a10d22129407fa5ce011da7066037e13255	libva-intel-driver-1.6.2.tar.bz2
+# From https://lists.freedesktop.org/archives/libva/2016-March/003886.html
+sha1	6766ff2e8134e09e9204ec9ccd3b8d550890d5d2	libva-intel-driver-1.7.0.tar.bz2
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index 909d73b..e930ade 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 1.6.2
+LIBVA_INTEL_DRIVER_VERSION = 1.7.0
 LIBVA_INTEL_DRIVER_SOURCE = libva-intel-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver
 LIBVA_INTEL_DRIVER_LICENSE = MIT
