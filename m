From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:44 +0200
Subject: [Buildroot] [PATCH 15/69] genimage: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-16-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/genimage/genimage.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 2dffbc55cfd3..489e8d013a8d 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -7,7 +7,7 @@
 GENIMAGE_VERSION = 8
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
-GENIMAGE_DEPENDENCIES = host-pkgconf libconfuse
+HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
 GENIMAGE_LICENSE = GPLv2
 
 $(eval $(host-autotools-package))
-- 
2.1.0
