From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  9 Aug 2014 00:32:14 +0200
Subject: [Buildroot] [PATCH] evetst: bump to version 1.32
Message-ID: <1407537134-3459-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/evtest/evtest.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
index 23dd495..42a7999 100644
--- a/package/evtest/evtest.mk
+++ b/package/evtest/evtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVTEST_VERSION = 1.31
+EVTEST_VERSION = 1.32
 EVTEST_SOURCE = evtest-$(EVTEST_VERSION).tar.gz
 EVTEST_SITE = http://cgit.freedesktop.org/evtest/snapshot
 EVTEST_LICENSE = GPLv2+
-- 
1.8.1.4
