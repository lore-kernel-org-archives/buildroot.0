From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 21:46:42 +0200
Subject: [Buildroot] [git commit] package/libva-intel-driver: bump version
	to 1.8.2
Message-ID: <20170601202853.C4EDA807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea3b6a4083b708e6f9c52d8241aaac4e8aa43098
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva-intel-driver/libva-intel-driver.hash | 4 ++--
 package/libva-intel-driver/libva-intel-driver.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index 6115f81..d20ecd1 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,4 +1,4 @@
 # From https://github.com/01org/intel-vaapi-driver/releases
-sha1 f29e89b9a9fcafa153110a6a1762541c2a80f899 intel-vaapi-driver-1.8.1.tar.bz2
+sha1 1564e41f36b1ec646250418eeb344a916eb28407 intel-vaapi-driver-1.8.2.tar.bz2
 # Locally computed
-sha256 efd041602635ce9450fbdf864563d3b95341ef3877337772af708d9cc17b2fce  intel-vaapi-driver-1.8.1.tar.bz2
+sha256 866cdf9974911e58b0d3a2cade29dbe7b5b68836e142cf092b99db68e366b702  intel-vaapi-driver-1.8.2.tar.bz2
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index 8683210..c8d28e2 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 1.8.1
+LIBVA_INTEL_DRIVER_VERSION = 1.8.2
 LIBVA_INTEL_DRIVER_SOURCE = intel-vaapi-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = \
 	https://github.com/01org/intel-vaapi-driver/releases/download/$(LIBVA_INTEL_DRIVER_VERSION)
