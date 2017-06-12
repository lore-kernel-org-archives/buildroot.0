From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 12 Jun 2017 06:15:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/mcelog: fix legal-info
Message-ID: <20170612041512.9374-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

README was renamed to README.md
https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/commit/README.md?id=2fda0091a0628480a08cbf6ebe309fcb83aeae34

Fixes
http://autobuild.buildroot.net/results/02b/02b897a843b995bf5bf3f993f48689870a551dd5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mcelog/mcelog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index 695261302..d12fc44f7 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -8,7 +8,7 @@ MCELOG_VERSION = v152
 MCELOG_SITE = $(BR2_KERNEL_MIRROR)/scm/utils/cpu/mce/mcelog.git
 MCELOG_SITE_METHOD = git
 MCELOG_LICENSE = GPL-2.0
-MCELOG_LICENSE_FILES = README
+MCELOG_LICENSE_FILES = README.md
 
 define MCELOG_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
-- 
2.11.0
