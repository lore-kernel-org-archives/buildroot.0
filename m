From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Aug 2014 23:02:02 +0200
Subject: [Buildroot] [git commit] package/fbv: Typo fix
Message-ID: <20140811213123.A920E9D3E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a21566d317c1f1814f9445bc7a8a6cfb4d7a063b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fbv/fbv.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index a702a9b..6f41d9f 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -29,7 +29,7 @@ else
 FBV_CONFIGURE_OPTS += --without-libungif
 endif
 
-#fbv donesn't support cross-compilation
+#fbv doesn't support cross-compilation
 define FBV_CONFIGURE_CMDS
 	(cd $(FBV_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
