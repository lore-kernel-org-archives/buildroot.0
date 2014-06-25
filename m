From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 23:10:32 +0200
Subject: [Buildroot] [git commit] pango: add license information
Message-ID: <20140625211214.412519D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53b3a936e0f2a035a7e3a822341444399dedd2b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pango/pango.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
