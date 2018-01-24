From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 24 Jan 2018 18:15:38 +0100
Subject: [Buildroot] [PATCH] fis: fix typo in build command
Message-ID: <20180124171538.13469-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Typo noticed while during completely unrelated stuff...
---
 package/fis/fis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fis/fis.mk b/package/fis/fis.mk
index 6d3a227183..6db06bf74a 100644
--- a/package/fis/fis.mk
+++ b/package/fis/fis.mk
@@ -12,7 +12,7 @@ FIS_LICENSE_FILES = fis.c
 
 define FIS_BUILD_CMDS
 	$(TARGET_CC) $(TARGET_CFLAGS) -std=c99 -o $(@D)/fis \
-		$(@D)/fis.c $(@D)/crc.c $(TARGE_LDFLAGS)
+		$(@D)/fis.c $(@D)/crc.c $(TARGET_LDFLAGS)
 endef
 
 define FIS_INSTALL_TARGET_CMDS
-- 
2.15.1
