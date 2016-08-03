From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Aug 2016 20:50:39 +0200
Subject: [Buildroot] [git commit] libcurl: security bump version to 7.50.1
Message-ID: <20160803185356.AEA6E81844@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=559c3820f871c8efabb161013b6fb5f5b02981e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Contains fixes for CVE-2016-5419..5421:
https://curl.haxx.se/docs/vuln-7.50.0.html

[Peter: extend commit message with CVE info]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 9e7f7ac..ff0026d 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 608dfe2db77f48db792c387e7791aca55a25f0b42385707ad927164199ecfa9a  curl-7.50.0.tar.bz2
+sha256 3c12c5f54ccaa1d40abc65d672107dcc75d3e1fcb38c267484334280096e5156  curl-7.50.1.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index f899e2e..4a018b8 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.50.0
+LIBCURL_VERSION = 7.50.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
