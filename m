From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 30 Oct 2019 10:22:44 +0100
Subject: [Buildroot] [PATCH 1/2] package/matchbox-desktop: remove
 unrecognized option
Message-ID: <20191030092245.10235-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--enable-expat is not a recognized option so remove it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/matchbox-desktop/matchbox-desktop.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/matchbox-desktop/matchbox-desktop.mk b/package/matchbox-desktop/matchbox-desktop.mk
index 81b13c079c..9054dd80c6 100644
--- a/package/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox-desktop/matchbox-desktop.mk
@@ -11,7 +11,6 @@ MATCHBOX_DESKTOP_SITE = http://downloads.yoctoproject.org/releases/matchbox/matc
 MATCHBOX_DESKTOP_LICENSE = GPL-2.0+
 MATCHBOX_DESKTOP_LICENSE_FILES = COPYING
 MATCHBOX_DESKTOP_DEPENDENCIES = matchbox-lib zlib
-MATCHBOX_DESKTOP_CONF_OPTS = --enable-expat
 
 # The bundled configure script does not properly replace LIBADD_DL, so
 # we force an autoreconf even if we don't have any patches touching
-- 
2.23.0
