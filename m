From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Sep 2012 16:23:21 +0200
Subject: [Buildroot] [git commit] unionfs: add missing dependency on
	host-pkg-config
Message-ID: <20120921143623.65CE49963D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1aee0638f5a3657f27f5de18a33b2c0a15d839c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/unionfs/unionfs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index e2ffd72..eb8109e 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -7,7 +7,7 @@
 UNIONFS_VERSION = 0.26
 UNIONFS_SITE = http://podgorny.cz/unionfs-fuse/releases
 UNIONFS_SOURCE = unionfs-fuse-$(UNIONFS_VERSION).tar.xz
-UNIONFS_DEPENDENCIES = libfuse
+UNIONFS_DEPENDENCIES = libfuse host-pkg-config
 UNIONFS_LICENSE = BSD-3c
 UNIONFS_LICENSE_FILES = LICENSE
 
