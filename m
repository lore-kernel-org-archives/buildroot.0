From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 23:35:46 +0200
Subject: [Buildroot] [git commit] libcurl: LICENSE value changes to SPDX
Message-ID: <20170702213302.7B87D80641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d80110a635c23aac17dabf2e58b580470749a2c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The curl license is a MIT/X derivative license, but
has a distinct identifier in SPDX, so use that:

https://spdx.org/licenses/curl.html

[Peter: reword commit message]
Signed-off-by: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
