From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 01:05:52 +0200
Subject: [Buildroot] [PATCH 19/41] cairo: drop target installation option
	(it's on by default)
In-Reply-To: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1271199974-30434-20-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/cairo/cairo.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index a4513bc..d6cfe42 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -8,7 +8,6 @@ CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.gz
 CAIRO_SITE = http://cairographics.org/releases
 CAIRO_LIBTOOL_PATCH = NO
 CAIRO_INSTALL_STAGING = YES
-CAIRO_INSTALL_TARGET = YES
 
 CAIRO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
-- 
1.7.0.4
