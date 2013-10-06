From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 20:38:52 +0200
Subject: [Buildroot] [git commit] lockfile-progs: bump to version 0.1.17
Message-ID: <20131006184759.F0B1F9B92C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5d270004031338455890a19e9519a670dae71a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lockfile-progs/lockfile-progs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 35bb881..25f8134 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOCKFILE_PROGS_VERSION = 0.1.15
+LOCKFILE_PROGS_VERSION = 0.1.17
 LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
 LOCKFILE_PROGS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs/
 LOCKFILE_PROGS_DEPENDENCIES = liblockfile
