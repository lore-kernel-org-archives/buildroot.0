From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Oct 2017 18:02:43 +0100
Subject: [Buildroot] [PATCH 1/1] libmediaart: bump to version 1.9.4
Message-ID: <20171030170243.29005-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmediaart/libmediaart.hash | 4 ++--
 package/libmediaart/libmediaart.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmediaart/libmediaart.hash b/package/libmediaart/libmediaart.hash
index 46e4035d7..65cf3cf9a 100644
--- a/package/libmediaart/libmediaart.hash
+++ b/package/libmediaart/libmediaart.hash
@@ -1,2 +1,2 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.1.sha256sum:
-sha256	5b14aa4e0cc84eaec57b6cb28f39092d503fdaecf36d5d165fac37583b7fe949	libmediaart-1.9.1.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.4.sha256sum:
+sha256	a57be017257e4815389afe4f58fdacb6a50e74fd185452b23a652ee56b04813d	libmediaart-1.9.4.tar.xz
diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index cac45f112..db4f1fa2a 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMEDIAART_VERSION_MAJOR = 1.9
-LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).1
+LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).4
 LIBMEDIAART_SOURCE = libmediaart-$(LIBMEDIAART_VERSION).tar.xz
 LIBMEDIAART_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/libmediaart/$(LIBMEDIAART_VERSION_MAJOR)
-- 
2.14.1
