From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 00:00:35 +0200
Subject: [Buildroot] [git commit] libfuse: security bump to version 2.9.4
Message-ID: <20150601220249.A1E9F81D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b6d8ec4e930c7a7884d8a5363b448078cf1972a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

CVE-2015-3202 - fix exec environment for mount and umount.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfuse/libfuse.hash |    5 +++--
 package/libfuse/libfuse.mk   |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libfuse/libfuse.hash b/package/libfuse/libfuse.hash
index d37c521..b1bbee3 100644
--- a/package/libfuse/libfuse.hash
+++ b/package/libfuse/libfuse.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  0beb83eaf2c5e50730fc553406ef124d77bc02c64854631bdfc86bfd6437391c  fuse-2.9.3.tar.gz
+# From http://sourceforge.net/projects/fuse/files/fuse-2.X/2.9.4/
+md5	ecb712b5ffc6dffd54f4a405c9b372d8	fuse-2.9.4.tar.gz
+sha1	c8b25419f33624dc5240af6a5d26f2c04367ca71	fuse-2.9.4.tar.gz
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 000d2b4..7a28a81 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE_VERSION = 2.9.3
+LIBFUSE_VERSION = 2.9.4
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = http://downloads.sourceforge.net/project/fuse/fuse-2.X/$(LIBFUSE_VERSION)
 LIBFUSE_LICENSE = GPLv2 LGPLv2.1
