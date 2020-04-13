From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Apr 2020 09:25:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/vnstat: bump version to 2.6
Message-ID: <20200413072517.355611-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://humdi.net/vnstat/CHANGES

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vnstat/vnstat.hash | 2 +-
 package/vnstat/vnstat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vnstat/vnstat.hash b/package/vnstat/vnstat.hash
index 94b4adc40b..6934c569b2 100644
--- a/package/vnstat/vnstat.hash
+++ b/package/vnstat/vnstat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a0955999abd56d5463d257ffdccc9b1e9ad9ea504de81e64ba4c197f1245abaa  vnstat-2.4.tar.gz
+sha256 89276e0a7281943edb554b874078278ad947dc312938a2451e03eb80679f7ff7  vnstat-2.6.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
index f0ef1cc69d..be1b75a6b3 100644
--- a/package/vnstat/vnstat.mk
+++ b/package/vnstat/vnstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VNSTAT_VERSION = 2.4
+VNSTAT_VERSION = 2.6
 VNSTAT_SITE = http://humdi.net/vnstat
 VNSTAT_LICENSE = GPL-2.0
 VNSTAT_LICENSE_FILES = COPYING
-- 
2.25.0
