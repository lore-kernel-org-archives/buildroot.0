From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Sep 2016 12:01:34 -0300
Subject: [Buildroot] [PATCH 5/7] gdk-pixbuf: bump to version 2.36.0
In-Reply-To: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1474383696-4045-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gdk-pixbuf/gdk-pixbuf.hash | 4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index e73170c..e5a8958 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.34/gdk-pixbuf-2.34.0.sha256sum
-sha256	d55e5b383ee219bd0e23bf6ed4427d56a7db5379729a6e3e0a0e0eba9a8d8879	gdk-pixbuf-2.34.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.0.sha256sum
+sha256	85ab52ce9f2c26327141b3dcf21cca3da6a3f8de84b95fa1e727d8871a23245c	gdk-pixbuf-2.36.0.tar.xz
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 36eed60..6d1a84d 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDK_PIXBUF_VERSION_MAJOR = 2.34
+GDK_PIXBUF_VERSION_MAJOR = 2.36
 GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).0
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
-- 
2.7.3
