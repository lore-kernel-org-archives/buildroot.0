From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 10 Apr 2017 19:24:32 +0200
Subject: [Buildroot] [PATCH 2/2] package/libva-intel-driver: bump version to
	1.8.1
In-Reply-To: <20170410172432.10315-1-bernd.kuhls@t-online.de>
References: <20170410172432.10315-1-bernd.kuhls@t-online.de>
Message-ID: <20170410172432.10315-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-intel-driver/libva-intel-driver.hash | 6 +++---
 package/libva-intel-driver/libva-intel-driver.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index ea885bc529..6115f815b5 100644
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
index ef14ca1e2c..8683210ebf 100644
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
-- 
2.11.0
