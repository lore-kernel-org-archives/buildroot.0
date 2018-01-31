From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 12:15:56 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] fis: fix typo in build
 command
Message-ID: <20180131123645.4E94988170@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a4e93f44a402f5974809c03e88a8b1cb77a35c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 840d1a8d56eb3807b1f2b3ab16974f2f0abe9c94)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fis/fis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fis/fis.mk b/package/fis/fis.mk
index 876b127268..f559bdf7ce 100644
--- a/package/fis/fis.mk
+++ b/package/fis/fis.mk
@@ -12,7 +12,7 @@ FIS_LICENSE_FILES = fis.c
 
 define FIS_BUILD_CMDS
 	$(TARGET_CC) $(TARGET_CFLAGS) -std=c99 -o $(@D)/fis \
-		$(@D)/fis.c $(@D)/crc.c $(TARGE_LDFLAGS)
+		$(@D)/fis.c $(@D)/crc.c $(TARGET_LDFLAGS)
 endef
 
 define FIS_INSTALL_TARGET_CMDS
