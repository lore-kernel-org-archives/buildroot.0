From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 30 Sep 2020 10:03:52 +0200
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.46.2
Message-ID: <20200930080353.2288535-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 95999bcf8..32808c6ca 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://ftp.gnome.org/pub/GNOME/sources/pango/1.46/pango-1.46.1.sha256sum
-sha256  fe516b10711bbb6fd75011d66dd08fabfce18f7931aed7415136d53c4aadf1c5  pango-1.46.1.tar.xz
+# From https://ftp.gnome.org/pub/GNOME/sources/pango/1.46/pango-1.46.2.sha256sum
+sha256  d89fab5f26767261b493279b65cfb9eb0955cd44c07c5628d36094609fc51841  pango-1.46.2.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 9d2d88ec0..92bd6c3ea 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.46
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).1
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).2
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.25.1
