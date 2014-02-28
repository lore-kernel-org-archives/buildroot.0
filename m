From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Feb 2014 10:43:05 -0300
Subject: [Buildroot] [PATCH] haveged: bump to version 1.9.1
Message-ID: <1393594985-15152-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/haveged/haveged.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index c0e3ba3..88d85cd 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.8
+HAVEGED_VERSION = 1.9.1
 HAVEGED_SITE = http://www.issihosts.com/haveged
 HAVEGED_LICENSE = GPLv3+
 HAVEGED_LICENSE_FILES = COPYING
-- 
1.8.3.2
