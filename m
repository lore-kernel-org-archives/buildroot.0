From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 19 Apr 2014 11:47:29 +0200
Subject: [Buildroot] [PATCH 1/5] liburcu: bump version to 0.8.4
Message-ID: <1397900853-7235-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/liburcu/liburcu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 44b640d..aec45a8 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.8.3
+LIBURCU_VERSION = 0.8.4
 LIBURCU_SITE    = http://lttng.org/files/urcu/
 LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE; GPLv2+ for test; GPLv3 for few *.m4 files
-- 
1.9.0
