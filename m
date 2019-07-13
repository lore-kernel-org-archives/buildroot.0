From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 13 Jul 2019 08:58:23 +0200
Subject: [Buildroot] [PATCH] package/iozone: bump to version 3_487
Message-ID: <1563001107-17687-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/iozone/iozone.hash | 2 +-
 package/iozone/iozone.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index 2a02731..29dba67 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	eeaf16cfbee095b16e4934180c6c7438539629489ce42ef4ace48feb23916b12	iozone3_483.tar
+sha256	2c488a7ccddd624fd557af16e71442c367b131d6178e1b4023bbd532bacdda59	iozone3_487.tar
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 903d2a1..00573d9 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3_483
+IOZONE_VERSION = 3_487
 IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
-- 
2.7.4
