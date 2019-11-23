From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Nov 2019 21:37:51 +0100
Subject: [Buildroot] [git commit] package/libffi: bump to version 3.3
Message-ID: <20191202083934.6AFD57FAE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fd660c2f41670cad8b270f56861f6e6190dd6c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash for license file (update in year:
https://github.com/libffi/libffi/commit/058aa4130445b4ef3c2f77f796c33506873031ca)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libffi/libffi.hash | 4 ++--
 package/libffi/libffi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index d8d2d2629a..496ae0d904 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	db41cfb9ec8052fcd116a94c12237303c4447af4844d50e4fea7163661e31743  libffi-3.3-rc0.tar.gz
+sha256	3f2f86094f5cf4c36cfe850d2fe029d01f5c2c2296619407c8ba0d8207da9a6b  libffi-3.3.tar.gz
 # License files, locally calculated
-sha256	0f4d7a0bfb83c37465d42dc305f124189196cc0cc2cc8d6f8461103682aebbc5  LICENSE
+sha256	deaf3a42effb551a5b140fa9afefed183a27f1341c6d1bf430d106a5e6931fc0  LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index fb8e18a456..722a03dca0 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = 3.3-rc0
+LIBFFI_VERSION = 3.3
 LIBFFI_SITE = $(call github,libffi,libffi,v$(LIBFFI_VERSION))
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
