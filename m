From: Henrique Camargo <henrique@henriquecamargo.com>
Date: Mon, 18 Feb 2013 18:28:19 -0300
Subject: [Buildroot] [PATCH] glib-networking: fix a typo in the .mk file
Message-ID: <1361222899-1853-1-git-send-email-henrique@henriquecamargo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The variable GLIB_NETWORKING_MINOR_VERSION had a typo.

Signed-off-by: Henrique Camargo <henrique@henriquecamargo.com>
---
 package/glib-networking/glib-networking.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index e8d71e5..4812fd6 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -5,8 +5,8 @@
 #############################################################
 
 GLIB_NETWORKING_MAJOR_VERSION = 2.30
-GLIB_NETWORLING_MINOR_VERSION = 2
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_MAJOR_VERSION).$(GLIB_NETWORLING_MINOR_VERSION)
+GLIB_NETWORKING_MINOR_VERSION = 2
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_MAJOR_VERSION).$(GLIB_NETWORKING_MINOR_VERSION)
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_MAJOR_VERSION)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 
-- 
1.7.10.4
