From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  4 Jul 2014 10:27:47 -0300
Subject: [Buildroot] [PATCH] lz4: security bump to r119
Message-ID: <1404480467-687-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes issue 134 - https://code.google.com/p/lz4/issues/detail?id=134
AKA CVE-2014-4611.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lz4/lz4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index a089b0e..819cc54 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZ4_VERSION = r117
+LZ4_VERSION = r119
 LZ4_SITE = $(call github,Cyan4973,lz4,$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2c
-- 
1.8.5.5
