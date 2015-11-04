From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  4 Nov 2015 10:06:16 -0300
Subject: [Buildroot] [PATCH] iproute2: bump to version 4.3.0
Message-ID: <1446642376-7850-1-git-send-email-gustavo@zacarias.com.ar>
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
index e3fe013..b3605b9 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,2 +1,2 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	a4101e743e0da36b55f63353ff489699ddcd634ceca854a9a272346588f30f30	iproute2-4.2.0.tar.xz
+sha256	f03b1188dd6c039512424de82ff7a8f3b446680bd4e908ff42a7b9b137422995	iproute2-4.3.0.tar.xz
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 6660eb2..afe2d29 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 4.2.0
+IPROUTE2_VERSION = 4.3.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.4.10
