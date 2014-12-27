From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 27 Dec 2014 20:45:35 -0300
Subject: [Buildroot] [PATCH] iproute2: bump to version 3.18.0
Message-ID: <1419723935-23738-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{iproute2-01-optional-ipv6.patch => 0001-optional-ipv6.patch}       | 0
 ...ute2-02-vxlan-optional-ipv6.patch => 0002-vxlan-optional-ipv6.patch} | 0
 package/iproute2/iproute2.hash                                          | 2 +-
 package/iproute2/iproute2.mk                                            | 2 +-
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename package/iproute2/{iproute2-01-optional-ipv6.patch => 0001-optional-ipv6.patch} (100%)
 rename package/iproute2/{iproute2-02-vxlan-optional-ipv6.patch => 0002-vxlan-optional-ipv6.patch} (100%)

diff --git a/package/iproute2/iproute2-01-optional-ipv6.patch b/package/iproute2/0001-optional-ipv6.patch
similarity index 100%
rename from package/iproute2/iproute2-01-optional-ipv6.patch
rename to package/iproute2/0001-optional-ipv6.patch
diff --git a/package/iproute2/iproute2-02-vxlan-optional-ipv6.patch b/package/iproute2/0002-vxlan-optional-ipv6.patch
similarity index 100%
rename from package/iproute2/iproute2-02-vxlan-optional-ipv6.patch
rename to package/iproute2/0002-vxlan-optional-ipv6.patch
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 3aecbfc..35dc554 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,2 +1,2 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	09e406636e7598e46d5d4f7b928bf5db57049d65dbeb9a496005957ee16f6000	iproute2-3.17.0.tar.xz
+sha256	d5a182154abd0749b1df7d1649115a32c65f559951477396203b1f514dbff1df	iproute2-3.18.0.tar.xz
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index a6ab445..0838463 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 3.17.0
+IPROUTE2_VERSION = 3.18.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex
-- 
2.0.5
