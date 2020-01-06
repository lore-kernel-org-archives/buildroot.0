From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jan 2020 13:02:02 +0100
Subject: [Buildroot] [git commit] package/doxygen: bump to v1.8.17
Message-ID: <20200106120633.593FE8EE4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e82d927da6cfb3c7acf110dcf27ea9c6ccc2cd03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/doxygen/doxygen.hash | 2 +-
 package/doxygen/doxygen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/doxygen/doxygen.hash b/package/doxygen/doxygen.hash
index 375d3e0aed..90d4e978bc 100644
--- a/package/doxygen/doxygen.hash
+++ b/package/doxygen/doxygen.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256 ff981fb6f5db4af9deb1dd0c0d9325e0f9ba807d17bd5750636595cf16da3c82  doxygen-1.8.16.src.tar.gz
+sha256 2cba988af2d495541cbbe5541b3bee0ee11144dcb23a81eada19f5501fd8b599  doxygen-1.8.17.src.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index ce240ae64e..52e96f3807 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOXYGEN_VERSION = 1.8.16
+DOXYGEN_VERSION = 1.8.17
 DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
 DOXYGEN_SITE = http://doxygen.nl/files
 DOXYGEN_LICENSE = GPL-2.0
