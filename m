From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 12:47:41 +0200
Subject: [Buildroot] [git commit] lmbench: Add license info
Message-ID: <20120806104900.A1F8596D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89aafcb35ec33532bd81a005f49196896d0adbd3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license info for lmbench.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lmbench/lmbench.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index bccb2de..10f6d14 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -6,6 +6,8 @@
 LMBENCH_VERSION:=3.0-a9
 LMBENCH_SOURCE:=lmbench-$(LMBENCH_VERSION).tgz
 LMBENCH_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/lmbench/development/lmbench-3.0-a9/
+LMBENCH_LICENSE =  lmbench license (based on GPLv2)
+LMBENCH_LICENSE_FILES = COPYING COPYING-2
 
 define LMBENCH_CONFIGURE_CMDS
 	$(call CONFIG_UPDATE,$(@D))
