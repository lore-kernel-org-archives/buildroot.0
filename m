From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Aug 2014 17:03:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/fbv: Typo fix
Message-ID: <1407683021-25243-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fbv/fbv.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.10.4
