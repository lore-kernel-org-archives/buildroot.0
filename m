From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:45:16 +0200
Subject: [Buildroot] [git commit] libwebsockets: bump to version 1.7.5
Message-ID: <20160413204522.5804B81DF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf51b0b2c0d9287bcdda9fd9c3b50a0427928923
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libwebsockets/libwebsockets.hash | 3 +--
 package/libwebsockets/libwebsockets.mk   | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 2559445..c931a0d 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,2 @@
 # Locally computed:
-sha256  8d99aa369cb972b97520a40270086bde24645fafc2deaf6ccca93753691a7a2f  libwebsockets-v1.7.4.tar.gz
-sha256  c7627d8e3d9d695b965a6c5fe30f4b4c04666984b384acd9e24c3b59cef13816  9eec5e4470397632af035c429295a41b74bd0585.patch
+sha256  e91f59fb6238462b4ffdfef2482239558b8a02198c9c6076eb3f86eb1c4e935d  libwebsockets-v1.7.5.tar.gz
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 95d1309..5bb7ae4 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v1.7.4
+LIBWEBSOCKETS_VERSION = v1.7.5
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = LGPLv2.1 with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
 LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
 LIBWEBSOCKETS_CONF_OPTS = -DLWS_WITHOUT_TESTAPPS=ON -DLWS_IPV6=ON
-LIBWEBSOCKETS_PATCH = https://github.com/warmcat/libwebsockets/commit/9eec5e4470397632af035c429295a41b74bd0585.patch
 
 # If LWS_MAX_SMP=1, then there is no code related to pthreads compiled
 # in the library. If unset, LWS_MAX_SMP defaults to 32 and a small
