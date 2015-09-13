From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Sep 2015 12:33:05 +0200
Subject: [Buildroot] [git commit] connman: bump to version 1.30
Message-ID: <20150913103308.7B7708177E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63da5180b83f843254733ec82867a73e5d104ecd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/connman/connman.hash |    2 +-
 package/connman/connman.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index 3f266f5..06bd48d 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256	2a5a69693566f7fd59b2e677fa89356ada6d709998aa665caef8707b1e7a8594  connman-1.29.tar.xz
+sha256	5c5e464bacc9c27ed4e7269fb9b5059f07947f5be26433b59212133663ffa991  connman-1.30.tar.xz
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 5250c20..87d81ce 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.29
+CONNMAN_VERSION = 1.30
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
