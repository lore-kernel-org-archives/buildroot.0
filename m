From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 11:46:23 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libcurl: bump
 version to 7.76.1
Message-ID: <20210426093055.5E526862E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee78156d105100e70a0fe92aeb7ab38c11200bbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Bugfix release.  For details, see the changelog:
https://curl.se/changes.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cffe295259d11c4229163ea3f9a18374c6a0479c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 1906834e7a..9ee98f1e13 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.76.0.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.76.1.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  6302e2d75c59cdc6b35ce3fbe716481dd4301841bbb5fd71854653652a014fc8  curl-7.76.0.tar.xz
+sha256  64bb5288c39f0840c07d077e30d9052e1cbb9fa6c2dc52523824cc859e679145  curl-7.76.1.tar.xz
 sha256  6fd1a1c008b5ef4c4741dd188c3f8af6944c14c25afa881eb064f98fb98358e7  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index b02a926351..f2cfd72897 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.76.0
+LIBCURL_VERSION = 7.76.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
