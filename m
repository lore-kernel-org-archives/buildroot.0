From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 23:37:01 +0200
Subject: [Buildroot] [git commit] package/olsr: bump version to 0.9.6.1
Message-ID: <20170922213002.74DB77FFC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf9cae05fde11077bd04234b301bb62e73a0608c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/olsr/olsr.hash | 4 ++--
 package/olsr/olsr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/olsr/olsr.hash b/package/olsr/olsr.hash
index c6b1415..6de0290 100644
--- a/package/olsr/olsr.hash
+++ b/package/olsr/olsr.hash
@@ -1,2 +1,2 @@
-# From http://www.olsr.org/releases/0.9/SHA256SUM-0.9.0.3
-sha256	1f038ed3ea72e4f73dfc9701de83de7313f5049161c8df17b9aaeba8e9711e92 olsrd-0.9.0.3.tar.bz2
+# From http://www.olsr.org/releases/0.9/SHA256SUM-0.9.6.1
+sha256 9cac290e9bff5fc7422110b9ccd972853f10962c962d2f31a63de9c6d1520612  olsrd-0.9.6.1.tar.bz2
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 4ad5fc5..faff253 100644
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
