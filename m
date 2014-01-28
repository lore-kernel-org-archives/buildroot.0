From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jan 2014 15:21:59 -0300
Subject: [Buildroot] [PATCH] iw: bump to version 3.14
Message-ID: <1390933319-22126-1-git-send-email-gustavo@zacarias.com.ar>
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
index 13d92b7..cfab481 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 3.13
+IW_VERSION = 3.14
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = iw license
-- 
1.8.3.2
