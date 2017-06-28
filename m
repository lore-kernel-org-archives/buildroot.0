From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jun 2017 23:29:21 +0200
Subject: [Buildroot] [git commit] libva-intel-driver: bump version to 1.8.3
Message-ID: <20170628212845.F32067FD82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87d0964e0b815d39b140be8ee5cd322d6714ee14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libva-intel-driver/libva-intel-driver.hash | 4 ++--
 package/libva-intel-driver/libva-intel-driver.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index d20ecd1..75c1e95 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,4 +1,4 @@
 # From https://github.com/01org/intel-vaapi-driver/releases
-sha1 1564e41f36b1ec646250418eeb344a916eb28407 intel-vaapi-driver-1.8.2.tar.bz2
+sha1 b0cfc0807993aafe78e209dd28cdceb4dfa57e78 intel-vaapi-driver-1.8.3.tar.bz2
 # Locally computed
-sha256 866cdf9974911e58b0d3a2cade29dbe7b5b68836e142cf092b99db68e366b702  intel-vaapi-driver-1.8.2.tar.bz2
+sha256 54411d9e579300ed63f8b9b06152a1a9ec95b7699507d7ffa014cd7b2aeaff6f  intel-vaapi-driver-1.8.3.tar.bz2
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index c8d28e2..7a06465 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 1.8.2
+LIBVA_INTEL_DRIVER_VERSION = 1.8.3
 LIBVA_INTEL_DRIVER_SOURCE = intel-vaapi-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = \
 	https://github.com/01org/intel-vaapi-driver/releases/download/$(LIBVA_INTEL_DRIVER_VERSION)
