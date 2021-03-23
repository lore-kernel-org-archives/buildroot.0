From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 23 Mar 2021 19:10:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/iproute2: Bump version to 5.11.0
Message-ID: <20210323181004.25172-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

NOTE: this should not be applied until uclibc based toolchains are
regenerated. But posted for people who don't use uclibc and would like
to have iproute2 sync with kernel version.

Kind regards,
Petr

 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 4d82de4c46..c7c06bf5f7 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  cfcd1f890290f8c8afcc91d9444ad929b9252c16f9ab3f286c50dd3c59dc646e  iproute2-5.8.0.tar.xz
+sha256  c5e2ea108212b3445051b35953ec267f9f3469e1d5c67ac034ab559849505c54  iproute2-5.11.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 98fbe4f3cd..1be94e9a45 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.8.0
+IPROUTE2_VERSION = 5.11.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.30.2
