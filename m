From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 11 Dec 2013 00:09:28 +0100
Subject: [Buildroot] [PATCH] libmbim: bump to 1.6.0
Message-ID: <1386716968-4140-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libmbim/libmbim.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index e10d60f..305a0a4 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.4.0
+LIBMBIM_VERSION = 1.6.0
 LIBMBIM_SITE    = http://www.freedesktop.org/software/libmbim/
 LIBMBIM_SOURCE  = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
-- 
1.8.1.2
