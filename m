From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 30 Oct 2012 14:04:25 +0100
Subject: [Buildroot] [PATCH 1/2] xz: bump to 5.0.4
Message-ID: <1351602266-14650-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/xz/xz.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index e700c0d..e00c91b 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -3,7 +3,7 @@
 # xz-utils
 #
 #############################################################
-XZ_VERSION = 5.0.3
+XZ_VERSION = 5.0.4
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz/
 XZ_INSTALL_STAGING = YES
-- 
1.7.7
