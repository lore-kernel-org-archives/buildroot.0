From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  1 Mar 2013 15:17:49 +0100
Subject: [Buildroot] [PATCH 1/2] feh: bump to 2.9.1
Message-ID: <1362147470-23992-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/feh/feh.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index fab1c0a..97a272d 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -1,4 +1,4 @@
-FEH_VERSION = 2.7
+FEH_VERSION = 2.9.1
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org/
 FEH_DEPENDENCIES = libcurl giblib imlib2 libpng xlib_libXinerama xlib_libXt
-- 
1.7.7
