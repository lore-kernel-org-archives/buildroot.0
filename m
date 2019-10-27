From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 10:18:16 +0100
Subject: [Buildroot] [git commit] package/ccache: bump version to 3.7.5
Message-ID: <20191027091140.BFAC988F45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=503fd718c768a9d96155ecaafb2c53a586671520
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://ccache.dev/releasenotes.html#_ccache_3_7_5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ccache/ccache.hash | 2 +-
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 5b93c2ef8a..5bbc8edb11 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  04c0af414b8cf89e541daed59735547fbfd323b1aaa983da0216f6b6731e6836  ccache-3.7.4.tar.xz
+sha256  e51c611a3da865754cb0ff1ddd95bd7a6acac603576c0bd39583f8cc30af28d2  ccache-3.7.5.tar.xz
 sha256  ec6b1a326ff93b2cc21df88a697ae470ff6927a55b8929e7e491b315e1563361  GPL-3.0.txt
 sha256  d36644184e3fd668d10fbb292b58da3f2fe473d5109534a17e32339e0b372e99  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 47735850b1..51fbf202f3 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.7.4
+CCACHE_VERSION = 3.7.5
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
