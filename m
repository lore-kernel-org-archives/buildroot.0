From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 22:31:05 +0100
Subject: [Buildroot] [git commit] libcurl: move site to https
Message-ID: <20161103213120.86DB781971@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9138514d1678415605b75ecfabecbb2f72f9310
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Saves a redirect.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcurl/libcurl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index d60000a..197e0b5 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -6,7 +6,7 @@
 
 LIBCURL_VERSION = 7.51.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
-LIBCURL_SITE = http://curl.haxx.se/download
+LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_ZLIB),zlib) \
 	$(if $(BR2_PACKAGE_LIBIDN),libidn) \
