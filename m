From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 18 Jun 2019 12:15:24 -0600
Subject: [Buildroot] [PATCH 1/1] kmod: bump version to 26
Message-ID: <20190618181524.32924-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/kmod/kmod.hash | 2 +-
 package/kmod/kmod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index f970093cf1..b4beabff46 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256 7165e6496656159dcb909a91ed708a0fe273a4b128b4b1dc997ccb5189eef1cd  kmod-25.tar.xz
+sha256 57bb22c8bb56435991f6b0810a042b0a65e2f1e217551efa58235b7034cdbb9d  kmod-26.tar.xz
 
 # Locally calculated
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index ea5d291133..a5bcf2f2d6 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 25
+KMOD_VERSION = 26
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
-- 
2.20.1
