From: Romain Naour <romain.naour@openwide.fr>
Date: Fri,  6 Jun 2014 00:07:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/trace-cmd: update download url
Message-ID: <1402006038-8840-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The git repository has been moved to http://www.kernel.org/pub/ which allows to use $(BR2_KERNEL_MIRROR)

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/trace-cmd/trace-cmd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 6a732db..9a1ba71 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TRACE_CMD_VERSION = trace-cmd-v2.2.1
-TRACE_CMD_SITE = http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git
+TRACE_CMD_SITE = $(BR2_KERNEL_MIRROR)/scm/linux/kernel/git/rostedt/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
 TRACE_CMD_INSTALL_STAGING = YES
 TRACE_CMD_LICENSE = GPLv2 LGPLv2.1
-- 
1.9.3
