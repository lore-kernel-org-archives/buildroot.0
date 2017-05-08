From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 May 2017 18:14:19 +0100
Subject: [Buildroot] [PATCH] cryptsetup: bump version to 1.7.5
Message-ID: <20170508171419.46474-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index f328bc3..6d0fb58 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.7/sha256sums.asc
-sha256 7ccf893ef79a38fb92d61f03c17b964982119f5319cdaa85a1335b8558cca016  cryptsetup-1.7.4.tar.xz
+sha256 2b30cd1d0dd606a53ac77b406e1d37798d4b0762fa89de6ea546201906a251bd  cryptsetup-1.7.5.tar.xz
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index a3358a9..787331c 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 1.7
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).4
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).5
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf \
-- 
2.10.2
