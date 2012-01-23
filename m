From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 23 Jan 2012 10:09:09 +0100
Subject: [Buildroot] [PATCH 2/3] feh: bump to 2.2
In-Reply-To: <1327309750-7104-1-git-send-email-yegorslists@googlemail.com>
References: <1327309750-7104-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1327309750-7104-2-git-send-email-yegorslists@googlemail.com>
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
index eb68277..f036393 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -1,4 +1,4 @@
-FEH_VERSION = 2.0
+FEH_VERSION = 2.2
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org/
 FEH_DEPENDENCIES = libcurl giblib imlib2 libpng xlib_libXinerama xlib_libXt
-- 
1.7.1.1
