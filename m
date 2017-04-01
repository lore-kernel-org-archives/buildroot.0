From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 22:37:57 +0200
Subject: [Buildroot] [git commit] libraw: use SPDX short identifier for CDDL
	license
Message-ID: <20170401203935.7AC108227D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8233d6dcfa60714a55119aea61c56e032d803a47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libraw/libraw.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index bb8edf7..589ff89 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -18,7 +18,7 @@ LIBRAW_CONF_OPTS += \
 	--disable-openmp \
 	--disable-demosaic-pack-gpl2 \
 	--disable-demosaic-pack-gpl3
-LIBRAW_LICENSE = LGPL-2.1 or CDDL 1.0 or LibRaw Software License 27032010
+LIBRAW_LICENSE = LGPL-2.1 or CDDL-1.0 or LibRaw Software License 27032010
 LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL LICENSE.LibRaw.pdf README
 LIBRAW_DEPENDENCIES = host-pkgconf
 LIBRAW_CXXFLAGS = $(TARGET_CXXFLAGS)
