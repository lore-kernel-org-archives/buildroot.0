From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Jan 2018 21:30:01 +0100
Subject: [Buildroot] [git commit] fis: fix typo in build command
Message-ID: <20180125205008.C124584018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=840d1a8d56eb3807b1f2b3ab16974f2f0abe9c94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fis/fis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fis/fis.mk b/package/fis/fis.mk
index 6d3a227..6db06bf 100644
--- a/package/fis/fis.mk
+++ b/package/fis/fis.mk
@@ -12,7 +12,7 @@ FIS_LICENSE_FILES = fis.c
 
 define FIS_BUILD_CMDS
 	$(TARGET_CC) $(TARGET_CFLAGS) -std=c99 -o $(@D)/fis \
-		$(@D)/fis.c $(@D)/crc.c $(TARGE_LDFLAGS)
+		$(@D)/fis.c $(@D)/crc.c $(TARGET_LDFLAGS)
 endef
 
 define FIS_INSTALL_TARGET_CMDS
