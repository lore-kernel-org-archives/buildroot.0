From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 23:17:24 +0200
Subject: [Buildroot] [git commit] connman: bump to version 1.29
Message-ID: <20150721211734.28BC281E94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ebeac236a4ef856ab1779885bc99aee63688f4c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/connman/connman.hash |    2 +-
 package/connman/connman.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index 35654ec..3f266f5 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256	b1d5e7dd2652725906e220a8b0206477e97080e835272971e3b2fd10943c5c94    connman-1.28.tar.xz
+sha256	2a5a69693566f7fd59b2e677fa89356ada6d709998aa665caef8707b1e7a8594  connman-1.29.tar.xz
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 016eff7..5250c20 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.28
+CONNMAN_VERSION = 1.29
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
