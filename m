From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 14:05:09 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/libgpiod: bump
 version to v1.2.1
Message-ID: <20190221130342.550A98C5FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b515faa3391a66ceecfc138f9a99b71dbaed0221
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

This is a bugfix release fixing two problems with C++ bindings.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 92f34e8fe297b740709a32aa49de58985783e95d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 318a107adf..e68ebdb8c7 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256 b6b9079c933f7c8524815437937dda6b795a16141bca202a9eec70ba5844b5ba  libgpiod-1.2.tar.xz
+sha256 736d8b511ad247c2acb01b592f2bbe5e757e14e1d8347b2d80683081ab4b31b8  libgpiod-1.2.1.tar.xz
 # Hash for license file
 sha256 ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 545526515f..c46ffa871c 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = 1.2
+LIBGPIOD_VERSION = 1.2.1
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
