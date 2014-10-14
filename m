From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 12:44:17 -0300
Subject: [Buildroot] [PATCH] connman: bump to version 1.26
Message-ID: <1413301457-1426-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/connman/connman.hash | 2 ++
 package/connman/connman.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/connman/connman.hash

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
new file mode 100644
index 0000000..58f74b3
--- /dev/null
+++ b/package/connman/connman.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
+sha256	7184e4b6d954449ee00a30e188924b3e37a20ad2fd9a0b76a2bdd82c863dcf8a	connman-1.26.tar.xz
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index fc1bb2c..771a822 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.25
+CONNMAN_VERSION = 1.26
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
-- 
2.0.4
