From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Thu, 17 Oct 2019 03:30:46 +0000
Subject: [Buildroot] [PATCH 1/1] package/glorytun: bump to version 0.2.2
Message-ID: <20191017033045.30625-1-adrien@gallouet.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
---
 package/glorytun/glorytun.hash | 2 +-
 package/glorytun/glorytun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glorytun/glorytun.hash b/package/glorytun/glorytun.hash
index 202c15666b..30e8fd34ae 100644
--- a/package/glorytun/glorytun.hash
+++ b/package/glorytun/glorytun.hash
@@ -1,2 +1,2 @@
-sha256 6c35b044bf08a624bebf2374b33625c0462858a3f75efb810aebcccc0634e7ee  glorytun-0.2.1.tar.gz
+sha256 457552232c72d5fec7ba46382784685c2e8167d49d8182ab3afbfb2b0bce1b01  glorytun-0.2.2.tar.gz
 sha256 02e492aa724ce3a64800ed9429cbabf811935ad1be95d667fae9187baa94e359  LICENSE
diff --git a/package/glorytun/glorytun.mk b/package/glorytun/glorytun.mk
index 41f49810ca..9207388d7e 100644
--- a/package/glorytun/glorytun.mk
+++ b/package/glorytun/glorytun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLORYTUN_VERSION = 0.2.1
+GLORYTUN_VERSION = 0.2.2
 GLORYTUN_SITE = https://github.com/angt/glorytun/releases/download/v$(GLORYTUN_VERSION)
 GLORYTUN_DEPENDENCIES = libsodium host-pkgconf
 GLORYTUN_LICENSE = BSD-2-clause
-- 
2.19.1
