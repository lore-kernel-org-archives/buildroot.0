From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed,  4 Nov 2020 18:14:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/iproute2: Bump version to 5.9.0
Message-ID: <20201104171416.1062-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
NOTE: this replaces [1] and it still have to wait for rebuilding uClibc
toolchain to use >= 1.0.35 (currently 1.0.36).

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20200903155728.19448-2-petr.vorel at gmail.com/

 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 4d82de4c46..6acff83d0d 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  cfcd1f890290f8c8afcc91d9444ad929b9252c16f9ab3f286c50dd3c59dc646e  iproute2-5.8.0.tar.xz
+sha256  a25dac94bcdcf2f73316c7f812115ea7a5710580bad892b08a83d00c6b33dacf  iproute2-5.9.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 98fbe4f3cd..071aeab6be 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.8.0
+IPROUTE2_VERSION = 5.9.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.29.1
