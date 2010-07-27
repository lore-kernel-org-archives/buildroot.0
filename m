From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 27 Jul 2010 23:01:29 +0200
Subject: [Buildroot] [git commit master 1/1] pango: bump to 1.28
Message-ID: <20100727210245.E5142835A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4eff47e91a0af339fe4c0f421358ca84d1112209
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/pango/pango.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index ad38246..875c0bc 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -3,9 +3,12 @@
 # pango
 #
 #############################################################
-PANGO_VERSION = 1.20.5
+PANGO_VERSION_MAJOR = 1.28
+PANGO_VERSION_MINOR = 0
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).$(PANGO_VERSION_MINOR)
+
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.bz2
-PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/1.20
+PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_AUTORECONF = YES
 PANGO_INSTALL_STAGING = YES
 PANGO_INSTALL_TARGET = YES
-- 
1.7.1
