From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 03:49:18 +0200
Subject: [Buildroot] [git commit] libwebsockets: bump to version 1.7.4
Message-ID: <20160331015641.B0B5D80789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ecaf770360b97f168eaee4d204798c5803ba9485
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libwebsockets/libwebsockets.hash | 2 +-
 package/libwebsockets/libwebsockets.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 745bc49..2559445 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c6f3272d7e0234a9ef92b38622f36c4166eede4225e36fe4f78dd2ade03e9c52  libwebsockets-v1.7.3.tar.gz
+sha256  8d99aa369cb972b97520a40270086bde24645fafc2deaf6ccca93753691a7a2f  libwebsockets-v1.7.4.tar.gz
 sha256  c7627d8e3d9d695b965a6c5fe30f4b4c04666984b384acd9e24c3b59cef13816  9eec5e4470397632af035c429295a41b74bd0585.patch
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 8d3663f..95d1309 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v1.7.3
+LIBWEBSOCKETS_VERSION = v1.7.4
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = LGPLv2.1 with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
