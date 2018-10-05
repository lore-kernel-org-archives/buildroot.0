From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Fri,  5 Oct 2018 15:30:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/cups-filters: bump to version 1.21.3
Message-ID: <20181005133019.1061-1-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/cups-filters/cups-filters.hash | 4 ++--
 package/cups-filters/cups-filters.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index 7bb00818df..e426ad8b86 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 aad95e35033154f54639923b439e0657fc9f616b9eac7490df89514362551f98  cups-filters-1.20.3.tar.gz
-sha256 24cc91478ca68d6d982dfd86181210ad5f0931ec431bdb740793e3d6555fdcd8  COPYING
+sha256 981b280bc5275a21c6f436aff6207e03cab36dc304c119bbac507db940e7421c  cups-filters-1.21.3.tar.gz
+sha256 8e697cf4681ebbca716bf8cc30dde51c264e32ceee41fa63ceb5213334204b83  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 131e58246e..b7f002f418 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.20.3
+CUPS_FILTERS_VERSION = 1.21.3
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
+CUPS_FILTERS_AUTORECONF = YES
 
 CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
 
-- 
2.17.1
