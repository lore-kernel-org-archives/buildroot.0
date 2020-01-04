From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 21:55:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/x265: bump version to 3.2.1
Message-ID: <20200104205517.431054-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x265/x265.hash | 6 +++---
 package/x265/x265.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x265/x265.hash b/package/x265/x265.hash
index 96a53b8abe..4e9524d134 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,5 +1,5 @@
-# From https://bitbucket.org/multicoreware/x265/wiki/Home
-md5 374e6359a00d17fd82195c02c341c861  x265_3.2.tar.gz
+# From https://mailman.videolan.org/pipermail/x265-devel/2019-October/012721.html
+md5 94808045a34d88a857e5eaf3f68f4bca  x265_3.2.1.tar.gz
 # Locally generated
-sha256 364d79bcd56116a9e070fdeb1d9d2aaef1a786b4970163fb56ff0991a183133b  x265_3.2.tar.gz
+sha256 fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b58cbbcc  x265_3.2.1.tar.gz
 sha256 d8afb1bcc7a2cfc603683b168d6987ef0a48e59e0da3693bf55c5d33b67e2b49  COPYING
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index ccb46bf251..5082d0ca27 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X265_VERSION = 3.2
+X265_VERSION = 3.2.1
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
 X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
 X265_LICENSE = GPL-2.0+
-- 
2.20.1
