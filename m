From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 15:07:17 +0200
Subject: [Buildroot] [PATCH 2/9] package/feh: bump version to 2.12.1
In-Reply-To: <1429448844-12598-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429448844-12598-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429448844-12598-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/feh/feh.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 15d3218..0c4c164 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 2.12
+FEH_VERSION = 2.12.1
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
-- 
1.7.10.4
