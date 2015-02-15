From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 15 Feb 2015 17:02:52 +0100
Subject: [Buildroot] [PATCH 1/1] make clean : also remove graphs.
Message-ID: <1424016172-659-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 85e8c24..96dd9fb 100644
--- a/Makefile
+++ b/Makefile
@@ -833,7 +833,7 @@ printvars:
 
 clean:
 	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
-		$(BUILD_DIR) $(BASE_DIR)/staging \
+		$(BUILD_DIR) $(BASE_DIR)/staging $(BASE_DIR)/graphs \
 		$(LEGAL_INFO_DIR)
 
 distclean: clean
-- 
2.3.0
