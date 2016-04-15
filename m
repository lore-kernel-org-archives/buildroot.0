From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 15 Apr 2016 08:01:04 -0300
Subject: [Buildroot] [PATCH] gtkmm3: bump to version 3.20.1
Message-ID: <1460718064-28787-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gtkmm3/gtkmm3.hash | 4 ++--
 package/gtkmm3/gtkmm3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gtkmm3/gtkmm3.hash b/package/gtkmm3/gtkmm3.hash
index 3ab2513..f2fc960 100644
--- a/package/gtkmm3/gtkmm3.hash
+++ b/package/gtkmm3/gtkmm3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gtkmm/3.20/gtkmm-3.20.0.sha256sum
-sha256	f021573f870df8a0b40ba37a7864c37be517c7a88cc957a193dbab28449b028a	gtkmm-3.20.0.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gtkmm/3.20/gtkmm-3.20.1.sha256sum
+sha256	051de1b8756ca6ec61f26264338cfc3060af936fd70bf4558bfe1e115418c612	gtkmm-3.20.1.tar.xz
diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
index b62d592..8c3e079 100644
--- a/package/gtkmm3/gtkmm3.mk
+++ b/package/gtkmm3/gtkmm3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GTKMM3_VERSION_MAJOR = 3.20
-GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).0
+GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).1
 GTKMM3_SOURCE = gtkmm-$(GTKMM3_VERSION).tar.xz
 GTKMM3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
 GTKMM3_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
-- 
2.7.3
