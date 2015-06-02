From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 23:12:07 +0200
Subject: [Buildroot] [git commit] lzo: bump version
Message-ID: <20150602211231.6B0978011D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9899769aa7de61780c5f6fa496075ee47378e5ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And use upstream hash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lzo/lzo.hash |    4 ++--
 package/lzo/lzo.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lzo/lzo.hash b/package/lzo/lzo.hash
index 8d7c666..415ed99 100644
--- a/package/lzo/lzo.hash
+++ b/package/lzo/lzo.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256 ac1b3e4dee46febe9fd28737eb7f5692d3232ef1a01da10444394c3d47536614 lzo-2.08.tar.gz
+# From http://www.oberhumer.com/opensource/lzo/
+sha1 e2a60aca818836181e7e6f8c4f2c323aca6ac057 lzo-2.09.tar.gz
diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index a94b5f5..ec7c749 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZO_VERSION = 2.08
+LZO_VERSION = 2.09
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_LICENSE = GPLv2+
 LZO_LICENSE_FILES = COPYING
