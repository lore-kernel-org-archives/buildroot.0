From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 23:32:32 +0100
Subject: [Buildroot] [git commit] cramfs: removed redundant
	HOST_FOO_DEPENDENCIES
Message-ID: <20120117224424.3CFE99036D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b49bfe67631978be0b90dc91c867325a911532f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cramfs/cramfs.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 4a0ec1c..57dbe40 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -9,7 +9,6 @@ CRAMFS_SOURCE=cramfs-$(CRAMFS_VERSION).tar.gz
 CRAMFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/cramfs
 
 CRAMFS_DEPENDENCIES = zlib
-HOST_CRAMFS_DEPENDENCIES = host-zlib
 
 define CRAMFS_BUILD_CMDS
  $(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
