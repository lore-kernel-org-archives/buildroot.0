From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Dec 2015 09:40:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/clamav: Fix LICENSE_FILES after
	last version bump
Message-ID: <1449996030-2964-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/3a1/3a12aea6a7a3500883a6d0184da3bd8cebf50e7b/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/clamav.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 75d88bc..35afd1e 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -8,7 +8,7 @@ CLAMAV_VERSION = 0.99
 CLAMAV_SITE = http://sourceforge.net/projects/clamav/files/clamav/$(CLAMAV_VERSION)
 CLAMAV_LICENSE = GPLv2
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
-	COPYING.LGPL COPYING.llvm COPYING.lzma COPYING.regex COPYING.sha256 \
+	COPYING.LGPL COPYING.llvm COPYING.lzma COPYING.pcre COPYING.regex \
 	COPYING.unrar COPYING.zlib
 CLAMAV_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.6.2
