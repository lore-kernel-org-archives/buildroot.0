From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:33:29 +0100
Subject: [Buildroot] [git commit] file: add license info
Message-ID: <20121114214727.08ABF99C3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba1c9131537573169f7bc1cfbb39a261118107ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/file/file.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
