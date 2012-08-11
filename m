From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Aug 2012 16:13:02 -0400
Subject: [Buildroot] [PATCH 14/17] openssl: add license info
Message-ID: <1344715982-9842-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/openssl/openssl.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index f9816af..4ae65b1 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -6,6 +6,8 @@
 
 OPENSSL_VERSION = 1.0.0j
 OPENSSL_SITE = http://www.openssl.org/source
+OPENSSL_LICENSE = OpenSSL or SSLeay
+OPENSSL_LICENSE_FILES = LICENSE
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
 OPENSSL_TARGET_ARCH = generic32
-- 
1.7.9.5
