From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Thu,  2 Apr 2020 12:08:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: bump to version 1.1.1f
Message-ID: <20200402100820.22283-1-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 package/libopenssl/libopenssl.hash | 2 +-
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 1b239fbee7..3becd790ac 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
 # From https://www.openssl.org/source/openssl-1.1.1d.tar.gz.sha256
-sha256	1e3a91bc1f9dfce01af26026f856e064eab4c8ee0a8f457b5ae30b40b8b711f2	openssl-1.1.1d.tar.gz
+sha256	186c6bfe6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35	openssl-1.1.1f.tar.gz
 
 # License files
 sha256	c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c	LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index da4ae291c0..4639c63fac 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1d
+LIBOPENSSL_VERSION = 1.1.1f
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
-- 
2.24.1
