From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Jun 2017 22:03:11 +0200
Subject: [Buildroot] [git commit] libuv: bump to version 1.12.0
Message-ID: <20170607200904.B1A8F801B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e7fbfca55f559637fa10b2bad17f62386156122
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 9ad1c8a..c8289cd 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6ec7eec6ecc24b1a8ffedebedb2fe9313fffb5410de89aaf784dd01080411c7a  libuv-v1.11.0.tar.gz
+sha256  41ce914a88da21d3b07a76023beca57576ca5b376c6ac440c80bc581cbca1250  libuv-v1.12.0.tar.gz
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 33525ff..891ac74 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.11.0
+LIBUV_VERSION = v1.12.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
