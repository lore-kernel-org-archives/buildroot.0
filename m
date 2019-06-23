From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 23 Jun 2019 23:31:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/hiawatha: bump to version 1.9
Message-ID: <1561325496-9765-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://gitlab.com/hsleisink/hiawatha/-/releases

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/hiawatha/hiawatha.hash | 2 +-
 package/hiawatha/hiawatha.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
index 7d98c01..8c3dcd3 100644
--- a/package/hiawatha/hiawatha.hash
+++ b/package/hiawatha/hiawatha.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 0f013afc71284bab7267b0d80a51133a8fd4248575dbcbabf338cf826095cda8  hiawatha-10.8.1.tar.gz
+sha256 74dd43812272c3ddbf067b6d4da1773cdeef2ffe71e8f164449fabf8431752b8  hiawatha-10.9.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 776efc1..e740ed9 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 10.8.1
+HIAWATHA_VERSION = 10.9
 HIAWATHA_SITE = https://www.hiawatha-webserver.org/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPL-2.0
-- 
2.7.4
