From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Sep 2016 12:17:28 +0200
Subject: [Buildroot] [git commit] libcurl: bump version to 7.50.2
Message-ID: <20160907101839.33A21802A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=475387b43987b73a76b321599fb8da90c6b81c40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index ff0026d..c2b4ecc 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 3c12c5f54ccaa1d40abc65d672107dcc75d3e1fcb38c267484334280096e5156  curl-7.50.1.tar.bz2
+sha256 0c72105df4e9575d68bcf43aea1751056c1d29b1040df6194a49c5ac08f8e233  curl-7.50.2.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 4a018b8..00a61d2 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.50.1
+LIBCURL_VERSION = 7.50.2
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
