From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 15:26:12 +0200
Subject: [Buildroot] [git commit] package/libmicrohttpd: bump version to
 0.9.64
Message-ID: <20190801132735.E346B7FE71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5dd1bcf1a4e0701ddfd4dc8ccb8c827293351952
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.gnu.org/archive/html/libmicrohttpd/2019-06/msg00004.html

Updated license hash after upstream commit
https://git.gnunet.org/libmicrohttpd.git/commit/?id=d0e81c8e0fb9676602db14a4120235f1524b1306

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmicrohttpd/libmicrohttpd.hash | 4 ++--
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 33160d90f2..315c70630a 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 37c36f1be177f0e37ef181a645cd3baac1000bd322a01c2eff70f3cc8c91749c  libmicrohttpd-0.9.63.tar.gz
-sha256 70e12e2a60151b9ed1a4c94a5ffeb99cd086fa94542b5a92fec581506e8d3121  COPYING
+sha256 e792d8ed5990823a0baadea0adf94365999e702f6f1314ef9c555018dafc350e  libmicrohttpd-0.9.64.tar.gz
+sha256 7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 5e138aaea9..3d96bfc61d 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.63
+LIBMICROHTTPD_VERSION = 0.9.64
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
