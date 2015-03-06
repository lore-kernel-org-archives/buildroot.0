From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Fri,  6 Mar 2015 12:35:51 -0500
Subject: [Buildroot] [PATCH 1/7] liburcu: bump to version 0.8.6
In-Reply-To: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
References: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
Message-ID: <1425663357-22541-2-git-send-email-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 package/liburcu/liburcu.hash | 2 ++
 package/liburcu/liburcu.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/liburcu/liburcu.hash

diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
new file mode 100644
index 0000000..a39daf2
--- /dev/null
+++ b/package/liburcu/liburcu.hash
@@ -0,0 +1,2 @@
+# http://www.lttng.org/files/urcu/userspace-rcu-0.8.6.tar.bz2.sha1
+sha1  f10e9bf812557cd0c2a35a277e04010ec278d25d  userspace-rcu-0.8.6.tar.bz2
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index c48f659..1582d07 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.8.4
+LIBURCU_VERSION = 0.8.6
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE; GPLv2+ for test; GPLv3 for few *.m4 files
-- 
2.2.1
