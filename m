From: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
Date: Mon, 26 Jun 2017 10:34:23 +0900
Subject: [Buildroot] [PATCH 1/1] libcurl: LICENSE value changes to SPDX
Message-ID: <2574e255-bee6-092b-986a-7faab9a94234@melcoinc.co.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Curl license is MIT/X derivative license.
It's totally distinction in SPDX.

Signed-off-by: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
---
  package/libcurl/libcurl.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 45bd080..6848449 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -11,7 +11,7 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
  	$(if $(BR2_PACKAGE_ZLIB),zlib) \
  	$(if $(BR2_PACKAGE_LIBIDN),libidn) \
  	$(if $(BR2_PACKAGE_RTMPDUMP),rtmpdump)
-LIBCURL_LICENSE = ISC
+LIBCURL_LICENSE = curl
  LIBCURL_LICENSE_FILES = COPYING
  LIBCURL_INSTALL_STAGING = YES

-- 
2.7.4
