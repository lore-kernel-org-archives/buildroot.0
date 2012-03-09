From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  9 Mar 2012 15:39:47 +0100
Subject: [Buildroot] [PATCH 2/5] feh: bump to 2.4
In-Reply-To: <1331303990-13548-1-git-send-email-yegorslists@googlemail.com>
References: <1331303990-13548-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1331303990-13548-2-git-send-email-yegorslists@googlemail.com>
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
index f459f8a..c461ac6 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -1,4 +1,4 @@
-FEH_VERSION = 2.3
+FEH_VERSION = 2.4
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org/
 FEH_DEPENDENCIES = libcurl giblib imlib2 libpng xlib_libXinerama xlib_libXt
-- 
1.7.7
