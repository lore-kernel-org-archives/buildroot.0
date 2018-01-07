From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:05:07 +0100
Subject: [Buildroot] [git commit] cjson: bump to version 1.7.0
Message-ID: <20180107140510.2774F8145F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=579b87423f7f9c4b54645aaa01e7ccbbad075443
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index cd51369..7ec85e2 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 3d6277179282b00af232d9f97c9e0049ff212636d2a84791b03439c81d1f7b1e  cjson-v1.6.0.tar.gz
+sha256 6429f928c32c7f24714f85550b7fdff6fb424b60bc05fafa7bd8137af5182b55  cjson-v1.7.0.tar.gz
 sha256 f6f207863675ca5a5128fd120b9aef4f4bbab73ffa57e5f771ccffc8e3cc56b7  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 6dff7d6..8220f40 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.6.0
+CJSON_VERSION = v1.7.0
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
