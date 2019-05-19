From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 19 May 2019 23:49:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/connman: bump to version 1.37
Message-ID: <20190519214928.14338-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/connman/connman.hash | 2 +-
 package/connman/connman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index fad1c55d2d..ff5b4d48f0 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256 c789db41cc443fa41e661217ea321492ad59a004bebcd1aa013f3bc10a6e0074  connman-1.36.tar.xz
+sha256 6ce29b3eb0bb16a7387bc609c39455fd13064bdcde5a4d185fab3a0c71946e16  connman-1.37.tar.xz
 # Locally computed
 sha256 b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index b67d1c4b86..839bc7a0e2 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.36
+CONNMAN_VERSION = 1.37
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
-- 
2.21.0
