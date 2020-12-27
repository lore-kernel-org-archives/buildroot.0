From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 14:17:47 +0100
Subject: [Buildroot] [git commit] package/uclibc: bump version to 1.0.37
Message-ID: <20201227130124.5F3C082AA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7da7e8aacf4cf674bde76fc5a562632d47c9fe8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.hash | 4 ++--
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 7319a70c82..e8bd5c5192 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.36/uClibc-ng-1.0.36.tar.xz.sha256
-sha256  010f40841669809422e01b47e7169d49c61bf3382f493c2571a8a96634ed300c  uClibc-ng-1.0.36.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.37/uClibc-ng-1.0.37.tar.xz.sha256
+sha256  b2b815d20645cf604b99728202bf3ecb62507ce39dfa647884b4453caf86212c  uClibc-ng-1.0.37.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 524fc98d29..53983e852d 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.36
+UCLIBC_VERSION = 1.0.37
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
