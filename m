From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 22:11:27 +0100
Subject: [Buildroot] [git commit] cryptsetup: bump to version 2.0.2
Message-ID: <20180313211610.7493583250@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b85b59709b444d3fb0a2a6edfd4caafdcf105be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Martin Hicks <mort@bork.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Martin Hicks <mort@bork.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index c54b0dc607..7629691a66 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.0/sha256sums.asc
-sha256 adc623b9e3e3ab5c14145b8baf21b741e513ee5bf90d2b4d85a745c2f05da199  cryptsetup-2.0.0.tar.xz
+sha256 4f8105d7f3bf758d58da3058b3cbd66c0ca81492b2dafe8ae7c049cc9e939e97  cryptsetup-2.0.2.tar.xz
 sha256 45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256 8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 0d8480ba48..39c9b7b0bc 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.0
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).0
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).2
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf json-c \
