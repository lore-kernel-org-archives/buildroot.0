From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jan 2014 21:44:00 +0100
Subject: [Buildroot] [git commit] libcurl: security bump to version 7.35.0
Message-ID: <20140129204559.1216E9C166@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8abdd5fa3e0728dace216741f410db08156730f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-0015.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 5285995..458dfb6 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.34.0
+LIBCURL_VERSION = 7.35.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
