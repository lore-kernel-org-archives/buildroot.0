From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Apr 2015 15:06:27 +0200
Subject: [Buildroot] [git commit] Makefile: fix typo in a comment
Message-ID: <20150422131028.C395381D78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60e9a79308d7e8f39faade5059319b40b3be5071
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index d1d6ab3..5de4789 100644
--- a/Makefile
+++ b/Makefile
@@ -577,7 +577,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 endif
 
 	mkdir -p $(TARGET_DIR)/etc
-	# Mandatory configuration file and auxilliary cache directory
+	# Mandatory configuration file and auxiliary cache directory
 	# for recent versions of ldconfig
 	touch $(TARGET_DIR)/etc/ld.so.conf
 	mkdir -p $(TARGET_DIR)/var/cache/ldconfig
