From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 13 Jul 2021 15:53:54 +0200
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.48.7
Message-ID: <20210713135354.1196171-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pango/pango.hash | 2 +-
 package/pango/pango.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 3d6167058..94568a68e 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
 # From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.48/pango-1.48.4.sha256sum
-sha256  418913fb062071a075846244989d4a67aa5c80bf0eae8ee4555a092fd566a37a  pango-1.48.4.tar.xz
+sha256  28a82f6a6cab60aa3b75a90f04197ead2d311fa8fe8b7bfdf8666e2781d506dc  pango-1.48.7.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index cc09e3a64..2a4a9f49d 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.48
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).4
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).7
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.30.2
