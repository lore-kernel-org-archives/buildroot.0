From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:33 -0600
Subject: [Buildroot] [NEXT 18/26] libopenssl: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-19-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/libopenssl/libopenssl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 5a78676..ec466eb 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -15,6 +15,7 @@ HOST_LIBOPENSSL_DEPENDENCIES = host-zlib
 LIBOPENSSL_TARGET_ARCH = generic32
 LIBOPENSSL_CFLAGS = $(TARGET_CFLAGS)
 LIBOPENSSL_PROVIDES = openssl
+LIBOPENSSL_CPE_ID = openssl:openssl:$(LIBOPENSSL_VERSION)
 LIBOPENSSL_PATCH = \
 	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
 	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
-- 
1.9.1
