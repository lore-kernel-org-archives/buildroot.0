From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Sep 2019 19:47:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/cups-filters: bump to version 1.25.4
Message-ID: <20190904174747.11415-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update hash of license file (year, authors, files have been updated)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cups-filters/cups-filters.hash | 4 ++--
 package/cups-filters/cups-filters.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index c4e0a40e43..dd3cbe3dbf 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 3c03ab7dbfe3642b6cd279a0b63edc8274b7d9740cb087f68d3186c9144988a6  cups-filters-1.23.0.tar.gz
-sha256 8e697cf4681ebbca716bf8cc30dde51c264e32ceee41fa63ceb5213334204b83  COPYING
+sha256 ecc4169a3253e14e5d0a0d6b923adfeeeae4faef8eca27822f25134e968a024c  cups-filters-1.25.4.tar.gz
+sha256 527463af65312372111804589a9624f4c52813e253062ae351e75af5003f317f  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 214647a90e..784cedfc1e 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.23.0
+CUPS_FILTERS_VERSION = 1.25.4
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
-- 
2.23.0.rc1
