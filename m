From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jun 2016 10:31:35 +0200
Subject: [Buildroot] [git commit] libfuse: bump to version 2.9.7
Message-ID: <20160622083404.652608213A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88841c5633ff331fb303893eca6dfd9f717c0276
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfuse/libfuse.hash | 2 +-
 package/libfuse/libfuse.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse/libfuse.hash b/package/libfuse/libfuse.hash
index d00d723..60bdf63 100644
--- a/package/libfuse/libfuse.hash
+++ b/package/libfuse/libfuse.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	0cb48bbc7106632d15a0c6bb582496c9884b869e329428891fe075a9e916f16b	fuse-2.9.6.tar.gz
+sha256	832432d1ad4f833c20e13b57cf40ce5277a9d33e483205fc63c78111b3358874	fuse-2.9.7.tar.gz
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 1709b56..57aabcd 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE_VERSION = 2.9.6
+LIBFUSE_VERSION = 2.9.7
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFUSE_VERSION)
 LIBFUSE_LICENSE = GPLv2, LGPLv2.1
