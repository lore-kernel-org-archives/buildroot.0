From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Jun 2019 06:13:23 +0200
Subject: [Buildroot] [git commit] package/hiawatha: bump to version 1.9
Message-ID: <20190624043041.E3CE48829D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93ca4f965264964bc944bbff4ef6160e4b4a1a63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://gitlab.com/hsleisink/hiawatha/-/releases

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hiawatha/hiawatha.hash | 2 +-
 package/hiawatha/hiawatha.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
index 7d98c01bf7..8c3dcd39b2 100644
--- a/package/hiawatha/hiawatha.hash
+++ b/package/hiawatha/hiawatha.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 0f013afc71284bab7267b0d80a51133a8fd4248575dbcbabf338cf826095cda8  hiawatha-10.8.1.tar.gz
+sha256 74dd43812272c3ddbf067b6d4da1773cdeef2ffe71e8f164449fabf8431752b8  hiawatha-10.9.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 776efc1dcf..e740ed9c73 100644
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
