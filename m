From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 10:40:57 +0200
Subject: [Buildroot] [git commit] gdk-pixbuf: add license info
Message-ID: <20130605090357.0F95A9A8FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70f28576000c7ef1d60883c1a8a024c7958c9ea6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gdk-pixbuf/gdk-pixbuf.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
