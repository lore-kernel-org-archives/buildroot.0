From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon,  4 Nov 2019 18:14:00 +0100
Subject: [Buildroot] [PATCH] package/libxml2: bump to version 2.9.10
Message-ID: <1572887640-18616-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/libxml2/libxml2.hash | 2 +-
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index ce8f5ef..d890713 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	94fb70890143e3c6549f265cee93ec064c80a84c42ad0f23e85ee1fd6540a871	libxml2-2.9.9.tar.gz
+sha256	aafee193ffb8fe0c82d4afef6ef91972cbaf5feea100edc2f262750611b4be1f	libxml2-2.9.10.tar.gz
 # License files, locally calculated
 sha256	c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd	COPYING
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index f4b4de0..f6cf084 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXML2_VERSION = 2.9.9
+LIBXML2_VERSION = 2.9.10
 LIBXML2_SITE = http://xmlsoft.org/sources
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_LICENSE = MIT
-- 
2.7.4
