From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  6 Mar 2014 14:16:53 +0100
Subject: [Buildroot] [PATCH] libmbim: bump to 1.8.0
Message-ID: <1394111813-733-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libmbim/libmbim.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 305a0a4..3606d71 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.6.0
+LIBMBIM_VERSION = 1.8.0
 LIBMBIM_SITE    = http://www.freedesktop.org/software/libmbim/
 LIBMBIM_SOURCE  = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
-- 
1.7.7
