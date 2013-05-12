From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 12 May 2013 10:55:22 -0300
Subject: [Buildroot] [PATCH 1/3] less: bump to version 458
Message-ID: <1368366924-11330-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/less/less.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/less/less.mk b/package/less/less.mk
index 72449c3..f811733 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LESS_VERSION = 451
+LESS_VERSION = 458
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPLv3+
 LESS_LICENSE_FILES = COPYING
-- 
1.8.1.5
