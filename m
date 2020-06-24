From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 24 Jun 2020 22:43:42 +0200
Subject: [Buildroot] [PATCH v3 2/7] package/cups-filters: bump to version
 1.27.5
In-Reply-To: <20200624204347.797088-1-angelo@amarulasolutions.com>
References: <20200624204347.797088-1-angelo@amarulasolutions.com>
Message-ID: <20200624204347.797088-3-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps cups-filters to version 1.27.5.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 package/cups-filters/cups-filters.hash | 2 +-
 package/cups-filters/cups-filters.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index 9e24abe393..61cb42a438 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 ff8679fcd0c31c25d229262c7ad100ba161ef6b2aa455a2df673dd74ef93f488  cups-filters-1.26.0.tar.gz
+sha256 08e4081ce50ce2e620af6e950bdcf64cea2ab4c81ab3c5ea05da25d82ad62db6  cups-filters-1.27.5.tar.gz
 sha256 527463af65312372111804589a9624f4c52813e253062ae351e75af5003f317f  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 0a2622b87b..c622fb68af 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.26.0
+CUPS_FILTERS_VERSION = 1.27.5
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
-- 
2.25.1
