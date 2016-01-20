From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Jan 2016 15:45:43 +0100
Subject: [Buildroot] [git commit] libfuse: bump to version 2.9.5
Message-ID: <20160120145035.5CC937FB00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3f662b56d42bf4d282923ec125cb5113e18eb36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfuse/libfuse.hash | 6 ++----
 package/libfuse/libfuse.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/libfuse/libfuse.hash b/package/libfuse/libfuse.hash
index 618ab3b..c9c2302 100644
--- a/package/libfuse/libfuse.hash
+++ b/package/libfuse/libfuse.hash
@@ -1,4 +1,2 @@
-# From http://sourceforge.net/projects/fuse/files/fuse-2.X/2.9.4/
-# Currently still valid for github release tarballs
-md5	ecb712b5ffc6dffd54f4a405c9b372d8	fuse-2.9.4.tar.gz
-sha1	c8b25419f33624dc5240af6a5d26f2c04367ca71	fuse-2.9.4.tar.gz
+# Locally calculated after checking pgp signature
+sha256	579f371cc5ffc1afca7057512bf7d52988a9ede57859a7c55e5b9f72435cdbb5	fuse-2.9.5.tar.gz
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 9928d62..bece18d 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE_VERSION = 2.9.4
+LIBFUSE_VERSION = 2.9.5
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse_$(subst .,_,$(LIBFUSE_VERSION))
 LIBFUSE_LICENSE = GPLv2, LGPLv2.1
