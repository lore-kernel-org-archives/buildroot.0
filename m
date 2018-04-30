From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 22:14:48 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] libglib2: fix license
Message-ID: <20180501073414.A8F9F88036@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce241dbf21b343d9856170072b918490e82d9ac4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

libglib2 is licensed under LGPL-2.1+ and not LGPL-2.0+ since release
2.53.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fbd809c5f2c826b13d99843bf6fd003f8a5a128f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglib2/libglib2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 097c980393..ff28ca611a 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -8,7 +8,7 @@ LIBGLIB2_VERSION_MAJOR = 2.54
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
-LIBGLIB2_LICENSE = LGPL-2.0+
+LIBGLIB2_LICENSE = LGPL-2.1+
 LIBGLIB2_LICENSE_FILES = COPYING
 # 0002-disable-tests.patch
 LIBGLIB2_AUTORECONF = YES
