From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 01:06:13 +0200
Subject: [Buildroot] [PATCH 40/41] pango: bump to 1.28
In-Reply-To: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1271199974-30434-41-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/pango/pango.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 38e163e..7721676 100644
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
1.7.0.4
