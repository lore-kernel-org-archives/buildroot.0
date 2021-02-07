From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:43:29 +0100
Subject: [Buildroot] [git commit] package/libblockdev: bump version to 2.25
Message-ID: <20210207092319.755C281964@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f62efbcf17002e2c723ceb6c55579f1cd1f7c4a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/storaged-project/libblockdev/blob/2.x-branch/NEWS.rst

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libblockdev/libblockdev.hash | 2 +-
 package/libblockdev/libblockdev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index 1c4b1ec7bf..101b99f1a8 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dc207c70dbef52c818a8abbcb6b8e298a6b63c0b78a5e1f2773b5f7b89300773  libblockdev-2.24.tar.gz
+sha256  555aa42a2db39649ad83253bdc902ab5bd63d39c123e0c8055c4de7fe7571668  libblockdev-2.25.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index a38912514c..39ae9230d9 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 2.24
+LIBBLOCKDEV_VERSION = 2.25
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)-1
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
