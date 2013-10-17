From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 16 Oct 2013 20:11:37 -0400
Subject: [Buildroot] [PATCH] libsoup: add license info
Message-ID: <1381968697-1748-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libsoup/libsoup.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index d57960c..d847f24 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -9,6 +9,8 @@ LIBSOUP_MINOR_VERSION = 1
 LIBSOUP_VERSION = $(LIBSOUP_MAJOR_VERSION).$(LIBSOUP_MINOR_VERSION)
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_MAJOR_VERSION)
+LIBSOUP_LICENSE = LGPLv2+
+LIBSOUP_LICENSE_FILES = COPYING
 LIBSOUP_INSTALL_STAGING = YES
 
 LIBSOUP_CONF_ENV = ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
-- 
1.7.9.5
