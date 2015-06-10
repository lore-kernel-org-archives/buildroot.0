From: Hoang Tran <hoang.tran@vnoss.org>
Date: Wed, 10 Jun 2015 16:59:22 -0700
Subject: [Buildroot] [PATCH 1/2] package/lxc: bump version to 1.1.2
Message-ID: <1433980762-3384-1-git-send-email-hoang.tran@vnoss.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Hoang Tran <hoang.tran@vnoss.org>
---
 package/lxc/lxc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 11a89f2..c7ebda4 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 1.0.6
+LXC_VERSION = 1.1.2
 LXC_SITE = https://linuxcontainers.org/downloads
 LXC_LICENSE = LGPLv2.1+
 LXC_LICENSE_FILES = COPYING
-- 
2.3.5
