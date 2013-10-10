From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 10 Oct 2013 17:58:27 +0200
Subject: [Buildroot] [PATCH 1/1] chrony: bump to version 1.29
Message-ID: <1381420708-7536-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/chrony/chrony.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 59fd3cb..f000e4a 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 1.27
+CHRONY_VERSION = 1.29
 CHRONY_SITE = http://download.tuxfamily.org/chrony/
 CHRONY_LICENSE = GPLv2
 CHRONY_LICENSE_FILES = COPYING
-- 
1.7.9.5
