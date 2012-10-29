From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 29 Oct 2012 12:22:03 +0100
Subject: [Buildroot] [PATCH] feh: bump to 2.7
Message-ID: <1351509723-4326-1-git-send-email-yegorslists@googlemail.com>
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
index 2dbe296..fab1c0a 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -1,4 +1,4 @@
-FEH_VERSION = 2.6.3
+FEH_VERSION = 2.7
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org/
 FEH_DEPENDENCIES = libcurl giblib imlib2 libpng xlib_libXinerama xlib_libXt
-- 
1.7.7
