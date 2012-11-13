From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:43 +0100
Subject: [Buildroot] [PATCH 09/30] file: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-9-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
This may look exaggerated, but I prefer to err on the safe side.
---
 package/file/file.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/file/file.mk b/package/file/file.mk
index 3fa3fb3..db68f66 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -8,6 +8,8 @@ FILE_VERSION = 5.11
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 FILE_INSTALL_STAGING = YES
+FILE_LICENSE = BSD-2c, one file BSD-4c, one file BSD-3c
+FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
 
 define FILE_UNINSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(FILE_DIR)
-- 
1.7.10.4
