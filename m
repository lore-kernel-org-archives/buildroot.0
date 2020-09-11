From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Sep 2020 23:06:34 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libraw: drop
 unrecognized options
Message-ID: <20200911210018.7F4AC85EEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81e54c98e2f0b38aca434050d099a47d39f856bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

demosaic packs have been removed since version 0.19.0 and
https://github.com/LibRaw/LibRaw/commit/b85690eb4881d613dd48068ee82f98ac246690b8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 68480c9bf03cc65f332fd001f72bcc2068e7ba97)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libraw/libraw.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 9a647f8d54..e786b844a9 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -10,9 +10,7 @@ LIBRAW_SITE = http://www.libraw.org/data
 LIBRAW_INSTALL_STAGING = YES
 LIBRAW_CONF_OPTS += \
 	--disable-examples \
-	--disable-openmp \
-	--disable-demosaic-pack-gpl2 \
-	--disable-demosaic-pack-gpl3
+	--disable-openmp
 LIBRAW_LICENSE = LGPL-2.1 or CDDL-1.0
 LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL README.md
 LIBRAW_DEPENDENCIES = host-pkgconf
