From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 2 Oct 2020 19:51:49 +0200
Subject: [Buildroot] [PATCH] uclibc-ng: update to 1.0.36
Message-ID: <20201002175149.z5hdspytdmszi474@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/uclibc.hash | 4 ++--
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index aea2802bac..7319a70c82 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.35/uClibc-ng-1.0.35.tar.xz.sha256
-sha256  4d0ee138f037017695a66b556b70f77a0eab8a238819bcb60af890b7b3382a2b  uClibc-ng-1.0.35.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.36/uClibc-ng-1.0.36.tar.xz.sha256
+sha256  010f40841669809422e01b47e7169d49c61bf3382f493c2571a8a96634ed300c  uClibc-ng-1.0.36.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 0b5e45bcf4..524fc98d29 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.35
+UCLIBC_VERSION = 1.0.36
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.11.0
