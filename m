From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Jun 2014 16:46:32 -0300
Subject: [Buildroot] [PATCH 1/2] iw: bump to version 3.15
Message-ID: <1401738393-17814-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iw/iw.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index cfab481..4eb0b07 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 3.14
+IW_VERSION = 3.15
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = iw license
-- 
1.8.5.5
