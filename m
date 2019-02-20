From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Wed, 20 Feb 2019 12:20:16 +0000
Subject: [Buildroot] [PATCH 1/1] package/glorytun: bump to version 0.1.0
Message-ID: <20190220122015.19229-1-adrien@gallouet.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The hash of the license file is only changed due to a year update:

-Copyright (c) 2015-2016, angt
+Copyright (c) 2015-2019, angt

Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
---
 package/glorytun/glorytun.hash | 4 ++--
 package/glorytun/glorytun.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glorytun/glorytun.hash b/package/glorytun/glorytun.hash
index 59a5f09c0e..85ae338c48 100644
--- a/package/glorytun/glorytun.hash
+++ b/package/glorytun/glorytun.hash
@@ -1,2 +1,2 @@
-sha256 5e23afad4592d6af27ffd2cb3c826cf0ea1b5166a05ef1ae5c77fb4e465bb735  glorytun-0.0.99-mud.tar.gz
-sha256 bd418f8ef7d62f2c89e3aa1e5dc41c7d7a6212eb1cdb4d39a26a5bd333e1b4a3  LICENSE
+sha256 65adee2945f377ec41c1384745d5676c99768bba8fd4456755ee4c7d73915ede  glorytun-0.1.0.tar.gz
+sha256 051ef5a4c3c8fe64f8641e0ed50b4cd35c64703d972130f9725c8fee7976f90b  LICENSE
diff --git a/package/glorytun/glorytun.mk b/package/glorytun/glorytun.mk
index f6d87c2605..9fed5d260d 100644
--- a/package/glorytun/glorytun.mk
+++ b/package/glorytun/glorytun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLORYTUN_VERSION = 0.0.99-mud
+GLORYTUN_VERSION = 0.1.0
 GLORYTUN_SITE = https://github.com/angt/glorytun/releases/download/v$(GLORYTUN_VERSION)
 GLORYTUN_DEPENDENCIES = libsodium host-pkgconf
 GLORYTUN_LICENSE = BSD-2-clause
-- 
2.19.1
