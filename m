From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 Dec 2016 13:21:22 -0300
Subject: [Buildroot] [PATCH] lighttpd: bump to version 1.4.44
Message-ID: <20161226162122.12917-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lighttpd/lighttpd.hash | 2 +-
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index c00236b..c325fda 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,2 +1,2 @@
 # From http://www.lighttpd.net/
-sha256 fe0c4a06dd2408a83ee7a2bfedc45e09597f3313cbda82485507573ae8fa948a  lighttpd-1.4.43.tar.xz
+sha256 adb66ca985651957feb209c91c55ebbf917d23630bfc3a216a2f70043c7b5422  lighttpd-1.4.44.tar.xz
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 9f7599a..c36c3b6 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).43
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).44
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3c
-- 
2.10.2
