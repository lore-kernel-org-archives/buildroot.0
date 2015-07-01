From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Jul 2015 21:58:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/eudev: bump version to 3.1.2
Message-ID: <1435780733-24093-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/eudev/eudev.hash |    2 +-
 package/eudev/eudev.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index 7c750a9..06bedab 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,2 +1,2 @@
 # From http://dev.gentoo.org/~blueness/eudev/
-md5	d8d6b2ae5c9a740967b1ae2dccbae95b	eudev-3.1.1.tar.gz
+md5	07ab33fe310d250f06fc28f010e3fde2	eudev-3.1.2.tar.gz
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index a97154c..87bce3e 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.1.1
+EUDEV_VERSION = 3.1.2
 EUDEV_SOURCE = eudev-$(EUDEV_VERSION).tar.gz
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
-- 
1.7.10.4
