From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 May 2018 11:44:27 +0200
Subject: [Buildroot] [git commit] libhttpparser: bump to version 1.8.1
Message-ID: <20180501094623.8425F8A556@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff3d6c414ba0ae21311f5db937f6f0fc03b0715d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libhttpparser/libhttpparser.hash | 3 ++-
 package/libhttpparser/libhttpparser.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libhttpparser/libhttpparser.hash b/package/libhttpparser/libhttpparser.hash
index 8ffceb24d9..acbf3787f9 100644
--- a/package/libhttpparser/libhttpparser.hash
+++ b/package/libhttpparser/libhttpparser.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 7277c6f99bf6fc272eb5d8fc3dca01e7cc1d4ae609b5d2c5d5e18added98479d  libhttpparser-v2.8.0.tar.gz
+sha256 51615f68b8d67eadfd2482decc63b3e55d749ce0055502bbb5b0032726d22d96  libhttpparser-v2.8.1.tar.gz
+sha256 79e6ba8b687cb54786207342b9b6fcee0ac10218453ed9009b84d949b2233cc0  LICENSE-MIT
diff --git a/package/libhttpparser/libhttpparser.mk b/package/libhttpparser/libhttpparser.mk
index 5f50d877d9..c71e043cdc 100644
--- a/package/libhttpparser/libhttpparser.mk
+++ b/package/libhttpparser/libhttpparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTTPPARSER_VERSION = v2.8.0
+LIBHTTPPARSER_VERSION = v2.8.1
 LIBHTTPPARSER_SITE = $(call github,nodejs,http-parser,$(LIBHTTPPARSER_VERSION))
 LIBHTTPPARSER_INSTALL_STAGING = YES
 LIBHTTPPARSER_LICENSE = MIT
