From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2020 22:00:24 +0100
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20200105205312.22EFC8EC62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38621c2fdf45db283ac96f7683b1273f2d526be5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 3bda417fb8..92dc921825 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 831ffec13240a93b63d74d508a416091b67f0d54f3596775a698c4ded4781ec4  tvheadend-6540ff23747499bfa28ba04cc76347a9209f4a1e.tar.gz
+sha256 0c2cc2ee09d21b34f2d72d971557a843b20a9e7da3d6550c4ce2fbe37c35ba13  tvheadend-221c29b40b1e53ae09a69d9458442dd4fea665f5.tar.gz
 sha256 54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index df88cdc31d..df7fd7fd9c 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 6540ff23747499bfa28ba04cc76347a9209f4a1e
+TVHEADEND_VERSION = 221c29b40b1e53ae09a69d9458442dd4fea665f5
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
