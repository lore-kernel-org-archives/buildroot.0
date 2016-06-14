From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jun 2016 12:22:41 +0200
Subject: [Buildroot] [git commit] imlib2: drop unneeded autoreconf
Message-ID: <20160614111906.ACDF780279@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6c1bd002eb3d66ad4f8e615387db3f488f6897c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was forgotten when the patch to Makefile.am was removed in 779676f62d56
(imlib2: security bump to version 1.4.8).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imlib2/imlib2.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 9781777..7da032f 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -10,7 +10,6 @@ IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/
 IMLIB2_LICENSE = imlib2 license
 IMLIB2_LICENSE_FILES = COPYING
 
-IMLIB2_AUTORECONF = YES
 IMLIB2_INSTALL_STAGING = YES
 IMLIB2_DEPENDENCIES = host-pkgconf freetype
 IMLIB2_CONF_OPTS = --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
