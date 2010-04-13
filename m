From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 01:06:09 +0200
Subject: [Buildroot] [PATCH 36/41] libgtk2: force to compile png loader in
	gdk-pixbuf
In-Reply-To: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1271199974-30434-37-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/libgtk2/libgtk2.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 1e732d0..f041ce2 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -133,6 +133,7 @@ HOST_LIBGTK2_CONF_OPT = \
 		--disable-glibtest \
 		--without-libtiff \
 		--without-libjpeg \
+		--with-included-loaders=png \
 		--with-gdktarget=none \
 		--disable-cups \
 		--disable-debug
-- 
1.7.0.4
