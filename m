From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 12 Jul 2021 22:10:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/iproute2: bump version to 5.13.0
Message-ID: <20210712201052.11911-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NOTE: 0001-lib-fs-fix-issue-when-name-open-_to_handle_at-is-not.patch
will be merged in 5.14.0.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

tested:

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed

Kind regards,
Petr

 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index a5d6bf022c..de4d09a3c1 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  9d268db98a36ee2a0e3ff3b92b2efff66fc1138a51e409bdef6ab3cfe15f326f  iproute2-5.12.0.tar.xz
+sha256  72a2e53774cac9e65f7b617deebb2059f87e8960d6e9713e4d788cea966f1b36  iproute2-5.13.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 6cc0dd5210..46d3662767 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.12.0
+IPROUTE2_VERSION = 5.13.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.32.0
