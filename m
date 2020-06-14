From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 16:18:53 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20200614141803.0AA3082289@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec295dbcc664965dc5bde9744c55bfebff8b0951
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tvheadend/tvheadend.hash | 4 ++--
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 92dc921825..83b61ec5ae 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0c2cc2ee09d21b34f2d72d971557a843b20a9e7da3d6550c4ce2fbe37c35ba13  tvheadend-221c29b40b1e53ae09a69d9458442dd4fea665f5.tar.gz
-sha256 54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
+sha256  b44a09c6579ee7ce7e4b490bd8b7d6d22daed70ccd6571aad222b8c73ffaeeda  tvheadend-51a4c5bec7b6fc69dab7b8d559f9b1b881f0eb8e.tar.gz
+sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index df7fd7fd9c..b21ab66c9e 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 221c29b40b1e53ae09a69d9458442dd4fea665f5
+TVHEADEND_VERSION = 51a4c5bec7b6fc69dab7b8d559f9b1b881f0eb8e
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
