From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 22:07:04 +0200
Subject: [Buildroot] [git commit] cups-filters: bump to version 1.20.3
Message-ID: <20180503200725.5D8268B562@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b4b01d7fe4b77ebd673d3fd7ac0adc2a0bb74db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cups-filters/cups-filters.hash | 3 ++-
 package/cups-filters/cups-filters.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index 043252803f..7bb00818df 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 f7b3853f9567e0213b4e1602bc670a626c3060e2a043e31b6dee21174d5469a5  cups-filters-1.20.1.tar.gz
+sha256 aad95e35033154f54639923b439e0657fc9f616b9eac7490df89514362551f98  cups-filters-1.20.3.tar.gz
+sha256 24cc91478ca68d6d982dfd86181210ad5f0931ec431bdb740793e3d6555fdcd8  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index fd21bff6d4..82ea46dd94 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.20.1
+CUPS_FILTERS_VERSION = 1.20.3
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
