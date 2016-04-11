From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 11 Apr 2016 16:13:49 -0300
Subject: [Buildroot] [PATCH] pango: bump to version 1.40.1
Message-ID: <1460402029-7527-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 132e458..67b67f0 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.36/pango-1.40.0.sha256sum
-sha256	da17985df314cb07d066ab5424f59c21ce973ece05b7de4df04d798ec8511c8b	pango-1.40.0.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.36/pango-1.40.1.sha256sum
+sha256	e27af54172c72b3ac6be53c9a4c67053e16c905e02addcf3a603ceb2005c1a40	pango-1.40.1.tar.xz
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index a3639dc..bdad8c6 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.40
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).0
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).1
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_AUTORECONF = YES
-- 
2.7.3
