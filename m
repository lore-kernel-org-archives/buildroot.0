From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 10 Dec 2018 16:34:47 -0200
Subject: [Buildroot] [PATCH] package/pkgconf: purge trailig '/' from
 PKGCONF_SITE
Message-ID: <20181210183447.6969-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

<PKG>_SITE cannot have a trailing slash.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/pkgconf/pkgconf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 5352f5c962..e3c73fd405 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PKGCONF_VERSION = 1.5.3
-PKGCONF_SITE = https://distfiles.dereferenced.org/pkgconf/
+PKGCONF_SITE = https://distfiles.dereferenced.org/pkgconf
 PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.xz
 PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
-- 
2.14.5
