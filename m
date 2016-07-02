From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:50 +0200
Subject: [Buildroot] [PATCH 21/69] libcroco: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-22-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/libcroco/libcroco.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcroco/libcroco.mk b/package/libcroco/libcroco.mk
index c4cb6762d83c..39dd52795e32 100644
--- a/package/libcroco/libcroco.mk
+++ b/package/libcroco/libcroco.mk
@@ -10,6 +10,7 @@ LIBCROCO_SITE = http://ftp.gnome.org/pub/gnome/sources/libcroco/$(LIBCROCO_VERSI
 LIBCROCO_SOURCE = libcroco-$(LIBCROCO_VERSION).tar.xz
 LIBCROCO_INSTALL_STAGING = YES
 LIBCROCO_DEPENDENCIES = host-pkgconf libglib2 libxml2
+HOST_LIBCROCO_DEPENDENCIES = host-pkgconf host-libglib2 host-libxml2
 LIBCROCO_CONFIG_SCRIPTS = croco-$(LIBCROCO_VERSION_MAJOR)-config
 # NEWS states that it's only LGPL
 # Source code says v2.1+ even though COPYING.LIB is v2
-- 
2.1.0
