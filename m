From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Dec 2018 07:19:26 -0000
Subject: [Buildroot] [git commit] libmicrohttpd: bump to version 0.9.60
Message-ID: <20181202071554.80BB280FDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35f468b0f0dc8de16fda6f8b5824e41e5fd94266
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index e534e8e80b..d54d2bbc14 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9b9ccd7d0b11b0e179f1f58dc2caa3e0c62c8609e1e1dc7dcaadf941b67d923c  libmicrohttpd-0.9.59.tar.gz
+sha256 cd0e5d3f95a9e55ef7cdf4d0530e997ba00b8411af9149d9287db785d729c471  libmicrohttpd-0.9.60.tar.gz
 sha256 70e12e2a60151b9ed1a4c94a5ffeb99cd086fa94542b5a92fec581506e8d3121  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 1cda434819..f5bf774bea 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.59
+LIBMICROHTTPD_VERSION = 0.9.60
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
