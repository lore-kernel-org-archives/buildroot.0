From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 17:03:01 +0200
Subject: [Buildroot] [git commit] synergy: add license information
Message-ID: <20140626151144.527B29D018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6cc9e693c61b60dd086cad85ab7313ae30dcff4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/synergy/synergy.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index 89a3d49..cd5a7a5 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -6,12 +6,12 @@
 
 SYNERGY_VERSION = 1.3.1
 SYNERGY_SITE = http://downloads.sourceforge.net/project/synergy2/Sources/$(SYNERGY_VERSION)
-
 SYNERGY_AUTORECONF = YES
 SYNERGY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
                    --x-libraries=$(STAGING_DIR)/usr/lib
-
 SYNERGY_DEPENDENCIES = xlib_libXtst \
 		$(if $(BR2_PACKAGE_XLIB_LIBXINERAMA),xlib_libXinerama)
+SYNERGY_LICENSE = GPLv2
+SYNERGY_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
