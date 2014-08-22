From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 22 Aug 2014 22:24:40 +0200
Subject: [Buildroot] [PATCH 1/3] libmbim: bump to 1.10.0
Message-ID: <1408739082-18284-1-git-send-email-yegorslists@googlemail.com>
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
index d3df3aa..f57f5dc 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.8.0
+LIBMBIM_VERSION = 1.10.0
 LIBMBIM_SITE    = http://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE  = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
-- 
1.8.3.2
