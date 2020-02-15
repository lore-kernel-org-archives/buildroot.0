From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2020 11:57:22 +0100
Subject: [Buildroot] [git commit] package/libmicrohttpd: bump to version
 0.9.70
Message-ID: <20200215105640.8DE0C8E094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=deec4444924103491dff677376c92ca397f4ba81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release. For details, see the release notes:
https://lists.gnu.org/archive/html/libmicrohttpd/2020-02/msg00006.html

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index c13eccf837..0fc451fcde 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 fb9b6b148b787493e637d3083588711e65cbcb726fa02cee2cd543c5de27e37e  libmicrohttpd-0.9.69.tar.gz
+sha256 90d0a3d396f96f9bc41eb0f7e8187796049285fabef82604acd4879590977307  libmicrohttpd-0.9.70.tar.gz
 sha256 7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 3fc61fe2c7..f47d7ec214 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.69
+LIBMICROHTTPD_VERSION = 0.9.70
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
