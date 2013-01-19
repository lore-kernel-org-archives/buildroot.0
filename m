From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 19 Jan 2013 12:03:45 +0100
Subject: [Buildroot] [PATCH 1/4] liburcu: bump to version 0.7.6
In-Reply-To: <cover.1358593210.git.s.martin49@gmail.com>
References: <cover.1358593210.git.s.martin49@gmail.com>
Message-ID: <5fcd6455c4b2248db95cd3b0670afad3dcf918db.1358593210.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/liburcu/liburcu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 0bfba37..b4a4424 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -3,7 +3,7 @@
 # liburc: userspace RCU (read-copy-update) library
 #
 #############################################################
-LIBURCU_VERSION = 0.7.5
+LIBURCU_VERSION = 0.7.6
 LIBURCU_SITE    = http://lttng.org/files/urcu/
 LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 
-- 
1.8.1.1
