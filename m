From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Jan 2012 00:07:35 +0100
Subject: [Buildroot] [git commit] dmalloc: Fix install path for headers and
	info files.
Message-ID: <20120129231156.73C619092E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4e27b11607113f178366469c4c2a827941be283
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dmalloc/dmalloc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 4de324e..89d067d 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -37,7 +37,7 @@ define DMALLOC_INSTALL_STAGING_CMDS
 		bindir="$(STAGING_DIR)/usr/bin" \
 		libdir="$(STAGING_DIR)/usr/lib" \
 		shlibdir="$(STAGING_DIR)/usr/lib" \
-		includedir="$(STAGING_DIR)/usr/share/info/" \
+		infodir="$(STAGING_DIR)/usr/share/info/" \
 		-C $(@D) install
 endef
 
