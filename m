From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Aug 2017 21:16:51 +0300
Subject: [Buildroot] [PATCH] connman: security bump to version 1.35
Message-ID: <90e8969c73a1c0e21f3c2f060d590de9172853c1.1503944211.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-12865: stack overflow in dns proxy feature.

Cc: Martin Bark <martin@barkynet.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/connman/connman.hash | 2 +-
 package/connman/connman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index e6485b93a61d..c822bb1fe4f5 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256	a9a0808c729c1f348fc36d8cecb52d19b72bc34cb411c502608cb0e0190fc71e	connman-1.34.tar.xz
+sha256	66d7deb98371545c6e417239a9b3b3e3201c1529d08eedf40afbc859842cf2aa	connman-1.35.tar.xz
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 4c19b4b98a86..52c45451d902 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.34
+CONNMAN_VERSION = 1.35
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
-- 
2.14.1
