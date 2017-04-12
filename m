From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:53:14 +0200
Subject: [Buildroot] [git commit] package/libva-intel-driver: bump version
	to 1.8.1
Message-ID: <20170412195328.1E11D82189@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3401485d06d9059e5118bc1d52b11b3e1caa9f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva-intel-driver/libva-intel-driver.hash | 6 +++---
 package/libva-intel-driver/libva-intel-driver.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index ea885bc..6115f81 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,4 +1,4 @@
-# From https://lists.01.org/pipermail/intel-vaapi-media/2017-March/000016.html
-sha1 9982122c8ef36aad01aa09c083974532afa8f8ca intel-vaapi-driver-1.8.0.tar.bz2
+# From https://github.com/01org/intel-vaapi-driver/releases
+sha1 f29e89b9a9fcafa153110a6a1762541c2a80f899 intel-vaapi-driver-1.8.1.tar.bz2
 # Locally computed
-sha256 4fcbb282957cf4f33b6c43a0f476d8df21f7721e586a8546c71242551986b3a6  intel-vaapi-driver-1.8.0.tar.bz2
+sha256 efd041602635ce9450fbdf864563d3b95341ef3877337772af708d9cc17b2fce  intel-vaapi-driver-1.8.1.tar.bz2
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index ef14ca1..8683210 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 1.8.0
+LIBVA_INTEL_DRIVER_VERSION = 1.8.1
 LIBVA_INTEL_DRIVER_SOURCE = intel-vaapi-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = \
 	https://github.com/01org/intel-vaapi-driver/releases/download/$(LIBVA_INTEL_DRIVER_VERSION)
