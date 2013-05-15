From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 15 May 2013 14:52:47 -0500
Subject: [Buildroot] [PATCH v5 03/11] glib-networking: Bump to version 2.36.1
In-Reply-To: <1368647575-14377-1-git-send-email-spenser@gillilanding.com>
References: <1368647575-14377-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1368647575-14377-4-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

change to version 2.36.1 of glib-networking.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/glib-networking/glib-networking.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 4812fd6..40a1e99 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-GLIB_NETWORKING_MAJOR_VERSION = 2.30
-GLIB_NETWORKING_MINOR_VERSION = 2
+GLIB_NETWORKING_MAJOR_VERSION = 2.36
+GLIB_NETWORKING_MINOR_VERSION = 1
 GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_MAJOR_VERSION).$(GLIB_NETWORKING_MINOR_VERSION)
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_MAJOR_VERSION)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
-- 
1.7.9.5
