From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 20:57:03 +0200
Subject: [Buildroot] [git commit] package/libuv: bump to version 1.33.0
Message-ID: <20191018191755.57C60826DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efae1a6e2300ed84d7566db1bedf84c068905d8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index d13a476264..3a9526cf9f 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c9818f38eee79d4e56f3ae55320d207ab183c5d4aff0fb148b5d6f5702f371cd  libuv-1.32.0.tar.gz
+sha256  d085b46aea791fb7772c274ccc58faadc56fdf6252d3b09b7fb24bd03881efdb  libuv-1.33.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 5cf09c8f49..9e58de6734 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = 1.32.0
+LIBUV_VERSION = 1.33.0
 LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
