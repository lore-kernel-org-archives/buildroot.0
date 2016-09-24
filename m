From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 24 Sep 2016 14:28:42 -0300
Subject: [Buildroot] [PATCH 9/9] gtkmm3: bump to version 3.22.0
In-Reply-To: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1474738122-18949-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gtkmm3/gtkmm3.hash | 4 ++--
 package/gtkmm3/gtkmm3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gtkmm3/gtkmm3.hash b/package/gtkmm3/gtkmm3.hash
index f2fc960..951b481 100644
--- a/package/gtkmm3/gtkmm3.hash
+++ b/package/gtkmm3/gtkmm3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gtkmm/3.20/gtkmm-3.20.1.sha256sum
-sha256	051de1b8756ca6ec61f26264338cfc3060af936fd70bf4558bfe1e115418c612	gtkmm-3.20.1.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gtkmm/3.22/gtkmm-3.22.0.sha256sum
+sha256	05da4d4b628fb20c8384630ddf478a3b5562952b2d6181fe28d58f6cbc0514f5	gtkmm-3.22.0.tar.xz
diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
index 8c3e079..57b9b1f 100644
--- a/package/gtkmm3/gtkmm3.mk
+++ b/package/gtkmm3/gtkmm3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GTKMM3_VERSION_MAJOR = 3.20
-GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).1
+GTKMM3_VERSION_MAJOR = 3.22
+GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).0
 GTKMM3_SOURCE = gtkmm-$(GTKMM3_VERSION).tar.xz
 GTKMM3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
 GTKMM3_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
-- 
2.7.3
