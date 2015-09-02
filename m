From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Sep 2015 16:18:53 -0300
Subject: [Buildroot] [PATCH] iproute2: bump to version 4.2.0
Message-ID: <1441221533-4801-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 2263e89..e3fe013 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,2 +1,2 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	73077a989efb934450bd655cbd9aaddaa747cb696c64d0c9a3323768a6a8e66f	iproute2-4.1.1.tar.xz
+sha256	a4101e743e0da36b55f63353ff489699ddcd634ceca854a9a272346588f30f30	iproute2-4.2.0.tar.xz
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index c42c5c9..d1aa6bf 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 4.1.1
+IPROUTE2_VERSION = 4.2.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.4.6
