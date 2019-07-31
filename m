From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 00:41:37 +0200
Subject: [Buildroot] [git commit] package/libmatroska: bump to version 1.5.2
Message-ID: <20190731224011.32C9281191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8025ed680295bffb3035195d4ada5a7bc18b3ae7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build with libebml 1.3.9

Fixes:
 - http://autobuild.buildroot.org/results/148ba335dbf51cdba19185fc23f0d13b707b54f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmatroska/libmatroska.hash | 2 +-
 package/libmatroska/libmatroska.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmatroska/libmatroska.hash b/package/libmatroska/libmatroska.hash
index e42a9b2824..827f08921c 100644
--- a/package/libmatroska/libmatroska.hash
+++ b/package/libmatroska/libmatroska.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	38a61dd5d87c070928b5deb3922b63b2b83c09e2e4a10f9393eecb6afa9795c8	libmatroska-1.4.9.tar.xz
+sha256	0ac6debfbf781d47f001b830aaf9be9dfbcefd13bcfb80ca5efc1c04b4a3c962	libmatroska-1.5.2.tar.xz
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL
diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index b8d0d84d35..7b7c5f03ef 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMATROSKA_VERSION = 1.4.9
+LIBMATROSKA_VERSION = 1.5.2
 LIBMATROSKA_SOURCE = libmatroska-$(LIBMATROSKA_VERSION).tar.xz
 LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska
 LIBMATROSKA_INSTALL_STAGING = YES
