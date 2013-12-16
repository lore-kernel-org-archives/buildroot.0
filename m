From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 16 Dec 2013 08:34:40 +0000
Subject: [Buildroot] [PATCH] libtpl: bump git snapshot
Message-ID: <1387182880-22757-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libtpl/libtpl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index 0a0fe8b..ff05991 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTPL_VERSION = 445b4e9f236a48e274eaace31acf56d700da142a
+LIBTPL_VERSION = 6df007e450cbee7d7a4896d3538128c5370b1c61
 LIBTPL_SITE = $(call github,troydhanson,tpl,$(LIBTPL_VERSION))
 LIBTPL_INSTALL_STAGING = YES
 LIBTPL_LICENSE = BSD-like
-- 
1.8.3.2
