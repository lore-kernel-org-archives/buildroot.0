From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 17:25:34 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] libcurl: LICENSE value
	changes to SPDX
Message-ID: <20170704154804.4B1B281EBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d888db7a306f694ec3aa0de08eff3ed1b2aa14a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

The curl license is a MIT/X derivative license, but
has a distinct identifier in SPDX, so use that:

https://spdx.org/licenses/curl.html

[Peter: reword commit message]
Signed-off-by: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit d80110a635c23aac17dabf2e58b580470749a2c9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 6f4803e..355b81f 100644
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
 
