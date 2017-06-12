From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 10:09:38 +0200
Subject: [Buildroot] [git commit] package/mcelog: fix legal-info
Message-ID: <20170612080950.CB3AE7FA4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0482616f570b148040fc3399a4403dcbac603ced
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

README was renamed to README.md
https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/commit/README.md?id=2fda0091a0628480a08cbf6ebe309fcb83aeae34

Fixes
http://autobuild.buildroot.net/results/02b/02b897a843b995bf5bf3f993f48689870a551dd5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mcelog/mcelog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index 6952613..d12fc44 100644
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
