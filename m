From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Sep 2017 15:11:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/openal: bump version to 1.18.1
Message-ID: <20170916131137.26227-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openal/openal.hash | 2 +-
 package/openal/openal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index cb2586aec5..aead6e15b8 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	4433b1391c61a7ca36d82c946c8f0ffe410569d6437e4ce72b3547aaf966ecde	openal-soft-1.18.0.tar.bz2
+sha256 2d51a6529526ef22484f51567e31a5c346a599767991a3dc9d4dcd9d9cec71dd  openal-soft-1.18.1.tar.bz2
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 207526a1ce..439f5f109d 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENAL_VERSION = 1.18.0
+OPENAL_VERSION = 1.18.1
 OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
 OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
 OPENAL_LICENSE = LGPL-2.0+
-- 
2.11.0
