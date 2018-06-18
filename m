From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jun 2018 06:53:57 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] cups-filters: bump to
 version 1.20.3
Message-ID: <20180618051254.AB5078842D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9011938a27565954f2a939b4daf03f8bf5318848
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2b4b01d7fe4b77ebd673d3fd7ac0adc2a0bb74db)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 527b357849..131e58246e 100644
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
