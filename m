From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Jun 2019 19:43:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/freetype: bump version to 2.10.0
Message-ID: <20190622174356.7358-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://sourceforge.net/projects/freetype/files/freetype2/2.10.0/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freetype/freetype.hash | 8 ++++----
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index c98674c7c2..2095d6eaec 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,9 +1,9 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.9.1/
-md5 60ef7d8160cd4bf8cb118ee9d65367ca freetype-2.9.1.tar.bz2
-sha1 220c82062171c513e4017c523d196933c9de4a7d freetype-2.9.1.tar.bz2
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.10.0/
+md5 a717e6925b61b9dda946322ecd278a42 freetype-2.10.0.tar.bz2
+sha1 f6abf03e0e3189a0de883981c57d3861b5d314f5 freetype-2.10.0.tar.bz2
 
 # Locally calculated
-sha256	db8d87ea720ea9d5edc5388fc7a0497bb11ba9fe972245e0f7f4c7e8b1e1e84d	freetype-2.9.1.tar.bz2
+sha256	fccc62928c65192fff6c98847233b28eb7ce05f12d2fea3f6cc90e8b4e5fbe06	freetype-2.10.0.tar.bz2
 sha256	fd056de4196903a676208ef58cfddafc7d583d1f28fa2e44c309cf84a59e62fb	docs/LICENSE.TXT
 sha256	08c135755dd589039470f1fdbb400daaabaaa50d0b366d19cebff4d22986baa1	docs/FTL.TXT
 sha256	c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18	docs/GPLv2.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 7167061568..44a9464d13 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.9.1
+FREETYPE_VERSION = 2.10.0
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
-- 
2.20.1
