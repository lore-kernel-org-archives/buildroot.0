From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 14 Jan 2016 09:25:16 -0300
Subject: [Buildroot] [PATCH] connman: bump to version 1.31
Message-ID: <1452774316-20163-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/connman/connman.hash | 2 +-
 package/connman/connman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index 06bd48d..4810f81 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256	5c5e464bacc9c27ed4e7269fb9b5059f07947f5be26433b59212133663ffa991  connman-1.30.tar.xz
+sha256	88fcf0b6df334796b90e2fd2e434d6f5b36cd6f13b886a119b8c90276b72b8e2  connman-1.31.tar.xz
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 3b14a80..1fe103c 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.30
+CONNMAN_VERSION = 1.31
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
-- 
2.4.10
