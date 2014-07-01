From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:23:18 +0200
Subject: [Buildroot] [git commit] glib-networking: add license information
Message-ID: <20140701224921.9E35E9D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b4b38bda5e15f7b82e8d0eb3b9a1b19a3f916f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glib-networking/glib-networking.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
