From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 27 Jul 2015 21:04:57 +0200
Subject: [Buildroot] [PATCH v1] evtest: bump version to 1.33
Message-ID: <1438023897-5306-1-git-send-email-ps.report@gmx.net>
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
index 1573f52..3e02f7c 100644
--- a/package/evtest/evtest.mk
+++ b/package/evtest/evtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVTEST_VERSION = 1.32
+EVTEST_VERSION = 1.33
 EVTEST_SOURCE = evtest-$(EVTEST_VERSION).tar.gz
 EVTEST_SITE = http://cgit.freedesktop.org/evtest/snapshot
 EVTEST_LICENSE = GPLv2+
-- 
2.1.4
