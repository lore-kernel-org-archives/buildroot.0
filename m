From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Dec 2016 19:36:45 +0100
Subject: [Buildroot] [git commit] gdk-pixbuf: security bump to version 2.36.1
Message-ID: <20161213184951.366658186B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=660b3308cf01fafd789989359bd15362d7e038c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes an integer buffer overflow in the jpeg loader (details still
embargoed).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdk-pixbuf/gdk-pixbuf.hash | 4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index e5a8958..5508fd2 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.0.sha256sum
-sha256	85ab52ce9f2c26327141b3dcf21cca3da6a3f8de84b95fa1e727d8871a23245c	gdk-pixbuf-2.36.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.1.sha256sum
+sha256	9d5ba72070460c1b5b74115d395a3e33daeb7b7b67fb256cdccc9d7187c42a38	gdk-pixbuf-2.36.1.tar.xz
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 6d1a84d..4f1fe59 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.36
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).0
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).1
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPLv2+
