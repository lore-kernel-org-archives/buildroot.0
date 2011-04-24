From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Apr 2011 23:54:28 +0200
Subject: [Buildroot] [git commit] lockfile-progs: fix make dependency
Message-ID: <20110424215455.16D5B82A2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7edfd3c1b4fed7d7211024ae5f5a428a5187ea4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lockfile-progs/lockfile-progs.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index f8d8cee..031712e 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -6,6 +6,7 @@
 LOCKFILE_PROGS_VERSION = 0.1.15
 LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
 LOCKFILE_PROGS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs/
+LOCKFILE_PROGS_DEPENDENCIES = liblockfile
 
 LOCKFILE_BINS = \
 	$(addprefix lockfile-,check create remove touch) \
-- 
1.7.3.4
