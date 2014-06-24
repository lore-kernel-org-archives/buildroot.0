From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:33 -0300
Subject: [Buildroot] [PATCH 27/54] pango: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-27-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pango/pango.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 31d92ba..7e5f9a7 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -6,11 +6,12 @@
 
 PANGO_VERSION_MAJOR = 1.28
 PANGO_VERSION = $(PANGO_VERSION_MAJOR).4
-
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.bz2
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_AUTORECONF = YES
 PANGO_INSTALL_STAGING = YES
+PANGO_LICENSE = LGPLv2+
+PANGO_LICENSE_FILES = COPYING
 
 PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
-- 
1.8.5.5
