From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 14:29:34 -0800
Subject: [Buildroot] [git commit] imlib2: add license info
Message-ID: <20121130223214.C1E0C99340@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=805529ed287b903300f2baa90f7862fe6a862c32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/imlib2/imlib2.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 3c6c473..fa0f578 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -6,6 +6,9 @@
 IMLIB2_VERSION = 1.4.5
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)/
+IMLIB2_LICENSE = imlib2 license
+IMLIB2_LICENSE_FILES = COPYING
+
 IMLIB2_INSTALL_STAGING = YES
 IMLIB2_DEPENDENCIES = host-pkgconf freetype
 IMLIB2_CONF_OPT = --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
@@ -61,4 +64,3 @@ endef
 IMLIB2_POST_INSTALL_STAGING_HOOKS += IMLIB2_FIXUP_IMLIB2_CONFIG
 
 $(eval $(autotools-package))
-
