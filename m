From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 7 Oct 2009 15:31:32 +0200
Subject: [Buildroot] [git commit master] e2fsprogs: bump version number to
	1.41.9
Message-ID: <20091007135642.8E1FA77701@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0b7ec8ea322d532711aeed92d4abe7ed7cc670e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Mack <daniel@caiaq.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/e2fsprogs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index ed9bacb..ca7a37e 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -3,7 +3,7 @@
 # e2fsprogs
 #
 #############################################################
-E2FSPROGS_VERSION:=1.41.3
+E2FSPROGS_VERSION:=1.41.9
 E2FSPROGS_SOURCE=e2fsprogs-$(E2FSPROGS_VERSION).tar.gz
 E2FSPROGS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
 E2FSPROGS_DIR=$(BUILD_DIR)/e2fsprogs-$(E2FSPROGS_VERSION)
-- 
1.6.3.3
