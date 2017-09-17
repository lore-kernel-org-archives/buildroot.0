From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Sep 2017 10:25:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/pcsc-lite: bump version to 1.8.22
Message-ID: <20170917082524.14938-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
http://lists.alioth.debian.org/pipermail/pcsclite-muscle/2017-June/000925.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pcsc-lite/pcsc-lite.hash | 2 +-
 package/pcsc-lite/pcsc-lite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index 4a3bd63199..e0b8bf6aca 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ec7d0114016c788c1c09859c84860f6cec6c4595436d23245105154b9c046bb2 pcsc-lite-1.8.21.tar.bz2
+sha256 ec7d0114016c788c1c09859c84860f6cec6c4595436d23245105154b9c046bb2 pcsc-lite-1.8.22.tar.bz2
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 0fbc3b3909..15c37f9ef0 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.8.21
+PCSC_LITE_VERSION = 1.8.22
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = http://alioth.debian.org/frs/download.php/file/4203
 PCSC_LITE_INSTALL_STAGING = YES
-- 
2.11.0
