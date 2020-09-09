From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  9 Sep 2020 17:14:35 +0200
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.46.1
Message-ID: <20200909151435.1874506-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pango/pango.hash | 8 +++++---
 package/pango/pango.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 1cd19d3cf..95999bcf8 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,3 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.44/pango-1.44.6.sha256sum
-sha256	3e1e41ba838737e200611ff001e3b304c2ca4cdbba63d200a20db0b0ddc0f86c	pango-1.44.6.tar.xz
-sha256	d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5	COPYING
+# From https://ftp.gnome.org/pub/GNOME/sources/pango/1.46/pango-1.46.1.sha256sum
+sha256  fe516b10711bbb6fd75011d66dd08fabfce18f7931aed7415136d53c4aadf1c5  pango-1.46.1.tar.xz
+
+# Locally computed
+sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 1b12c09b2..9d2d88ec0 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGO_VERSION_MAJOR = 1.44
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).6
+PANGO_VERSION_MAJOR = 1.46
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).1
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.25.1
