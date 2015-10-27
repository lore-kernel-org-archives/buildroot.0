From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Tue, 27 Oct 2015 16:21:08 -0500
Subject: [Buildroot] [PATCH] libcurl: fix license typo
Message-ID: <1445980868-55928-1-git-send-email-ryan.barnett@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The license for libcurl is actually 'ISC' not 'ICS'.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
---
 package/libcurl/libcurl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index ab007d6..8587baa 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -11,7 +11,7 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_ZLIB),zlib) \
 	$(if $(BR2_PACKAGE_LIBIDN),libidn) \
 	$(if $(BR2_PACKAGE_RTMPDUMP),rtmpdump)
-LIBCURL_LICENSE = ICS
+LIBCURL_LICENSE = ISC
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_INSTALL_STAGING = YES
 
-- 
1.9.1
