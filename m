From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 12 Feb 2018 17:52:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/lib{va, va-intel-driver,
 va-utils}: bump version to 2.1.0
Message-ID: <20180212165236.18471-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-intel-driver/libva-intel-driver.hash | 4 ++--
 package/libva-intel-driver/libva-intel-driver.mk   | 2 +-
 package/libva-utils/libva-utils.hash               | 4 ++--
 package/libva-utils/libva-utils.mk                 | 2 +-
 package/libva/libva.hash                           | 4 ++--
 package/libva/libva.mk                             | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index 4ffc60cab5..dbe5d67fb4 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,5 +1,5 @@
 # From https://github.com/01org/intel-vaapi-driver/releases
-sha1 19e83c084a404817263c04371c42345b617900ff intel-vaapi-driver-2.0.0.tar.bz2
+sha1 a40c6bd89b71b547986bf9f9fa2533bb50cf269e intel-vaapi-driver-2.1.0.tar.bz2
 # Locally computed
-sha256 10f6b0a91f34715d8d4d9a9e0fb3cc0afe5fcf85355db1272bd5fff31522f469  intel-vaapi-driver-2.0.0.tar.bz2
+sha256 ecfaf2ccc4b9af7340e002d2ef807d1e33051d4992f1983f5f4d60e516f86bdf  intel-vaapi-driver-2.1.0.tar.bz2
 sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index 0255038b0a..dd1903024f 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 2.0.0
+LIBVA_INTEL_DRIVER_VERSION = 2.1.0
 LIBVA_INTEL_DRIVER_SOURCE = intel-vaapi-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = \
 	https://github.com/01org/intel-vaapi-driver/releases/download/$(LIBVA_INTEL_DRIVER_VERSION)
diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 3429fb53a6..46674a3675 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,5 +1,5 @@
 # From https://github.com/01org/libva-utils/releases
-sha1 b4dc39459f8539c1ea16e7ca957a853fb7735ec4 libva-utils-2.0.0.tar.bz2
+sha1 9902eb944c3ace00be4fe95627708f156fc5ace7 libva-utils-2.1.0.tar.bz2
 # Locally computed
-sha256 a921df31311d8f49d2e392a5fc2a068d79f89aeb588309fbff24365310dbc5f6  libva-utils-2.0.0.tar.bz2
+sha256 f6a7790c3dcc56537372c90a83036a3136194a8b397e84e97bf9cc9254fa2c51  libva-utils-2.1.0.tar.bz2
 sha256 c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 275d599606..85ee3083fd 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.0.0
+LIBVA_UTILS_VERSION = 2.1.0
 LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
 LIBVA_UTILS_SITE = https://github.com/01org/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
 LIBVA_UTILS_LICENSE = MIT
diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 1736575447..e5b344def4 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
 # From https://github.com/01org/libva/releases
-sha1 762a49f8925ca1d0531c5071afbd629ffea93b90  libva-2.0.0.tar.bz2
+sha1 9ecde2b6c9deda16e895a0b00b8aef3a765acb4c  libva-2.1.0.tar.bz2
 # Locally computed
-sha256 bb0601f9a209e60d8d0b867067323661a7816ff429021441b775452b8589e533  libva-2.0.0.tar.bz2
+sha256 f3fa953a11d3210c3a4ee79031abdbe0863d5ce13d9b3f93f315f1eec60a4b0f  libva-2.1.0.tar.bz2
 sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 8d1e27f270..79956a9d8e 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.0.0
+LIBVA_VERSION = 2.1.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/01org/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
-- 
2.11.0
