From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Sep 2017 16:23:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/olsr: bump version to 0.9.6.1
Message-ID: <20170914142355.18173-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/olsr/olsr.hash | 4 ++--
 package/olsr/olsr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/olsr/olsr.hash b/package/olsr/olsr.hash
index c6b14153e3..6de0290559 100644
--- a/package/olsr/olsr.hash
+++ b/package/olsr/olsr.hash
@@ -1,2 +1,2 @@
-# From http://www.olsr.org/releases/0.9/SHA256SUM-0.9.0.3
-sha256	1f038ed3ea72e4f73dfc9701de83de7313f5049161c8df17b9aaeba8e9711e92 olsrd-0.9.0.3.tar.bz2
+# From http://www.olsr.org/releases/0.9/SHA256SUM-0.9.6.1
+sha256 9cac290e9bff5fc7422110b9ccd972853f10962c962d2f31a63de9c6d1520612  olsrd-0.9.6.1.tar.bz2
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 4ad5fc5720..faff2533d9 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OLSR_VERSION_MAJOR = 0.9
-OLSR_VERSION = $(OLSR_VERSION_MAJOR).0.3
+OLSR_VERSION = $(OLSR_VERSION_MAJOR).6.1
 OLSR_SOURCE = olsrd-$(OLSR_VERSION).tar.bz2
 OLSR_SITE = http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
 OLSR_PLUGINS = arprefresh bmf dot_draw dyn_gw dyn_gw_plain httpinfo jsoninfo \
-- 
2.11.0
