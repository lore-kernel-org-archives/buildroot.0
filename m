From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 21 Apr 2017 15:53:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/pcsc-lite: bump version to 1.8.20
Message-ID: <20170421135351.8992-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pcsc-lite/pcsc-lite.hash | 2 +-
 package/pcsc-lite/pcsc-lite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index 3adb86524..8df43a105 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 607c4bd730526d282a63edb2ba4ee043f497877be642c5c647e37995e21f2612 pcsc-lite-1.8.10.tar.bz2
+sha256 ec7d0114016c788c1c09859c84860f6cec6c4595436d23245105154b9c046bb2 pcsc-lite-1.8.20.tar.bz2
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index f868b852a..c6c4962ce 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.8.10
+PCSC_LITE_VERSION = 1.8.20
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
-PCSC_LITE_SITE = http://alioth.debian.org/frs/download.php/file/3963
+PCSC_LITE_SITE = http://alioth.debian.org/frs/download.php/file/4203
 PCSC_LITE_INSTALL_STAGING = YES
 PCSC_LITE_DEPENDENCIES = host-pkgconf
 PCSC_LITE_LICENSE = BSD-3-Clause
-- 
2.11.0
