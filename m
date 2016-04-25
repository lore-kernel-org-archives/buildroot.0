From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Apr 2016 21:15:53 +0200
Subject: [Buildroot] [git commit] libfuse: bump to version 2.9.6
Message-ID: <20160425192429.AE472803C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=daa8145d9afda21e5e2b29bd0d3f9782bc60a845
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfuse/libfuse.hash | 2 +-
 package/libfuse/libfuse.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libfuse/libfuse.hash b/package/libfuse/libfuse.hash
index c9c2302..d00d723 100644
--- a/package/libfuse/libfuse.hash
+++ b/package/libfuse/libfuse.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	579f371cc5ffc1afca7057512bf7d52988a9ede57859a7c55e5b9f72435cdbb5	fuse-2.9.5.tar.gz
+sha256	0cb48bbc7106632d15a0c6bb582496c9884b869e329428891fe075a9e916f16b	fuse-2.9.6.tar.gz
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index bece18d..1709b56 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBFUSE_VERSION = 2.9.5
+LIBFUSE_VERSION = 2.9.6
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
-LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse_$(subst .,_,$(LIBFUSE_VERSION))
+LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFUSE_VERSION)
 LIBFUSE_LICENSE = GPLv2, LGPLv2.1
 LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
 LIBFUSE_INSTALL_STAGING = YES
