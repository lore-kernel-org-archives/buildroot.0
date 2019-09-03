From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:41 -0000
Subject: [Buildroot] [git commit] package/libmicrohttpd: bump to version
 0.9.66
Message-ID: <20190903133620.3F31281413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4da9642c52b4c1fcebdc58970be937f689666cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://lists.gnu.org/archive/html/libmicrohttpd/2019-08/msg00000.html

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 315c70630a..a7fbe92940 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e792d8ed5990823a0baadea0adf94365999e702f6f1314ef9c555018dafc350e  libmicrohttpd-0.9.64.tar.gz
+sha256 4e66d4db1574f4912fbd2690d10d227cc9cc56df6a10aa8f4fc2da75cea7ab1b  libmicrohttpd-0.9.66.tar.gz
 sha256 7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 3d96bfc61d..3bc33390c3 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.64
+LIBMICROHTTPD_VERSION = 0.9.66
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
