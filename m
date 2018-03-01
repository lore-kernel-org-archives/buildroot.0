From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Mar 2018 23:11:23 +0100
Subject: [Buildroot] [git commit branch/next] package/libmicrohttpd: bump
 version to 0.9.59
Message-ID: <20180301222103.EB163814D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f07a64e8df0b6f1d9b11c47140ccad38ab44315
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index e628cb2c6c..e534e8e80b 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 dec1a76487d7e48ad74b468a888bfda1c05731f185ff950f1e363ca9d39caf4e  libmicrohttpd-0.9.57.tar.gz
+sha256 9b9ccd7d0b11b0e179f1f58dc2caa3e0c62c8609e1e1dc7dcaadf941b67d923c  libmicrohttpd-0.9.59.tar.gz
 sha256 70e12e2a60151b9ed1a4c94a5ffeb99cd086fa94542b5a92fec581506e8d3121  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 62fb7fc237..81785b91bc 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.57
+LIBMICROHTTPD_VERSION = 0.9.59
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
