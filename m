From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 22:36:10 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libcurl: bump
 version to 7.65.1
Message-ID: <20190606203554.EE65D8F0B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c788c3614478227256f5fd6dd6072a59076c693
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes a number of bugs discovered after the 7.65.0 release.

https://daniel.haxx.se/blog/2019/06/05/7-65-1-patched-up-and-ready-to-go/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1272878fd087b52b313e1e30d075574ae5265030)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index bece16dc0d..f5e90e0aa8 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.65.0.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.65.1.tar.xz.asc
 # with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256 7766d263929404f693905b5e5222aa0f2bdf8c66ab4b8758f0c0820a42b966cd  curl-7.65.0.tar.xz
+sha256 f6c22074877f235aebc7c53057dbc7ee82358f8ae58bfb767e955c18c859a77a  curl-7.65.1.tar.xz
 sha256 8c8824f50e73a021f5dde1fccbf69685939247399a33a32abab1fa448c9ddabb  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 80bf2dd245..abf7c0bf59 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.65.0
+LIBCURL_VERSION = 7.65.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
