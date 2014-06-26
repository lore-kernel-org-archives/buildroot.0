From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:44 -0300
Subject: [Buildroot] [PATCH 16/53] glib-networking: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-16-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glib-networking/glib-networking.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index fa6e20f..b7d7867 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -8,14 +8,14 @@ GLIB_NETWORKING_VERSION_MAJOR = 2.36
 GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).2
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
-
 GLIB_NETWORKING_INSTALL_STAGING = YES
-
 GLIB_NETWORKING_DEPENDENCIES = \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	host-pkgconf \
 	host-intltool \
 	libglib2
+GLIB_NETWORKING_LICENSE = LGPLv2+
+GLIB_NETWORKING_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 GLIB_NETWORKING_DEPENDENCIES += gnutls
-- 
1.8.5.5
