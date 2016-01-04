From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Jan 2016 07:43:58 -0300
Subject: [Buildroot] [PATCH] lighttpd: bump to version 1.4.39
Message-ID: <1451904238-23741-1-git-send-email-gustavo@zacarias.com.ar>
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
index 1158652..7ae17f2 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,2 +1,2 @@
 # From http://www.lighttpd.net/
-sha256 4912568b7befcf3f552ca4668bd7f38cd85f42a22944359d00816ec27eb1e504  lighttpd-1.4.38.tar.xz
+sha256	7eb9a1853c3d6dd5851682b0733a729ba4158d6bdff80974d5ef5f1f6887365b	lighttpd-1.4.39.tar.xz
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 49b9ac6..0146373 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).38
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).39
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3c
-- 
2.4.10
