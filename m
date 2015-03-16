From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Mar 2015 09:22:34 +0100
Subject: [Buildroot] [git commit] connman: bump to version 1.28
Message-ID: <20150316083709.D24B6817ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a831ae5164e47c25365e23a996efd2d42bff669
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/connman.hash |    2 +-
 package/connman/connman.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index dfeef4b..35654ec 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256	13997824c076af150c68d6d79e48277216e8192278a5c6615cfd4905d65600f5	connman-1.27.tar.xz
+sha256	b1d5e7dd2652725906e220a8b0206477e97080e835272971e3b2fd10943c5c94    connman-1.28.tar.xz
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 4d9b03e..4b55392 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.27
+CONNMAN_VERSION = 1.28
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
