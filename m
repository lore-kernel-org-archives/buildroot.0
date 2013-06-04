From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon,  3 Jun 2013 22:03:34 -0400
Subject: [Buildroot] [PATCH 6/7] gdk-pixbuf: add license info
In-Reply-To: <1370311415-1966-1-git-send-email-danomimanchego123@gmail.com>
References: <1370311415-1966-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1370311415-1966-6-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 4e00c40..5abb39d 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -8,6 +8,8 @@ GDK_PIXBUF_MAJOR_VERSION = 2.24
 GDK_PIXBUF_VERSION = $(GDK_PIXBUF_MAJOR_VERSION).1
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_MAJOR_VERSION)
+GDK_PIXBUF_LICENSE = LGPLv2+
+GDK_PIXBUF_LICENSE_FILES = COPYING
 GDK_PIXBUF_INSTALL_STAGING = YES
 
 GDK_PIXBUF_CONF_ENV = \
-- 
1.7.9.5
