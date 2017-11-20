From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Nov 2017 10:24:24 -0500
Subject: [Buildroot] [NEXT 1/1] freetype: bump to 2.8.1
Message-ID: <20171120152424.18511-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition, add hashes for all three license files.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/freetype/freetype.hash | 15 ++++++++++-----
 package/freetype/freetype.mk   |  2 +-
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index beff858..3997e81 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,5 +1,10 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.8/
-md5 2413ac3eaf508ada019c63959ea81a92  freetype-2.8.tar.bz2
-sha1 42c6b1f733fe13a3eba135f5025b22cb68450f91  freetype-2.8.tar.bz2
-# Locally calculated after checking pgp signature
-sha256 a3c603ed84c3c2495f9c9331fe6bba3bb0ee65e06ec331e0a0fb52158291b40b  freetype-2.8.tar.bz2
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.8.1/
+md5	bf0a210b6fe781228fa0e4a80691a521		freetype-2.8.1.tar.bz2
+sha1	417bb3747c4ac95b6f2652024a53fad45581fa1c	freetype-2.8.1.tar.bz2
+
+# Locally calculated
+sha256	e5435f02e02d2b87bb8e4efdcaa14b1f78c9cf3ab1ed80f94b6382fb6acc7d78	freetype-2.8.1.tar.bz2
+sha256	fd056de4196903a676208ef58cfddafc7d583d1f28fa2e44c309cf84a59e62fb	docs/LICENSE.TXT
+sha256	4a9a548027a2c1d37788519dea833294c9c81f1ebc280e817f41f50d0c642d78	docs/FTL.TXT
+sha256	c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18	docs/GPLv2.TXT
+
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 9a98b40..1028664 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.8
+FREETYPE_VERSION = 2.8.1
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
-- 
2.13.6
