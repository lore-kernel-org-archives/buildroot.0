From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Aug 2017 11:30:42 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/lzo: bump version to 2.10
Message-ID: <20170805093042.481-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added locally computed sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lzo/lzo.hash | 4 +++-
 package/lzo/lzo.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lzo/lzo.hash b/package/lzo/lzo.hash
index 415ed99da..cf2734fc7 100644
--- a/package/lzo/lzo.hash
+++ b/package/lzo/lzo.hash
@@ -1,2 +1,4 @@
 # From http://www.oberhumer.com/opensource/lzo/
-sha1 e2a60aca818836181e7e6f8c4f2c323aca6ac057 lzo-2.09.tar.gz
+sha1 4924676a9bae5db58ef129dc1cebce3baa3c4b5d  lzo-2.10.tar.gz
+# Locally computed
+sha256 c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b4221a072  lzo-2.10.tar.gz
diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 17d8d0fca..5b8efdd54 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZO_VERSION = 2.09
+LZO_VERSION = 2.10
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_LICENSE = GPL-2.0+
 LZO_LICENSE_FILES = COPYING
-- 
2.11.0
