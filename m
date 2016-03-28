From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Mar 2016 22:32:30 +0200
Subject: [Buildroot] [git commit] gzip: bump to version 1.7
Message-ID: <20160328203340.CD93D7FC80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c155336a07b1098ed570b046a8ea21db6b56898
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gzip/gzip.hash | 2 +-
 package/gzip/gzip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
index 56f052f..755c450 100644
--- a/package/gzip/gzip.hash
+++ b/package/gzip/gzip.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	37dfed1a485d53212c43b3fa2a7c7952f09bf5cd86e37121c222341ee1b27847  gzip-1.6.tar.xz
+sha256	fb31c57e7ce7703596ef57329be7cc5c5fd741b4a0f659fea7ee6a54706b41ab  gzip-1.7.tar.xz
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 1b2f678..b5dc361 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GZIP_VERSION = 1.6
+GZIP_VERSION = 1.7
 GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 # Some other tools expect it to be in /bin
