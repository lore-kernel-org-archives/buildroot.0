From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Nov 2018 18:48:46 +0100
Subject: [Buildroot] [PATCH/next 1/2] trace-cmd: fix site
Message-ID: <20181110174847.19674-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace $(BR2_KERNEL_MIRROR) by https://git.kernel.org/pub

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/trace-cmd/trace-cmd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 0dc145674f..578e9f124f 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TRACE_CMD_VERSION = trace-cmd-v2.6.1
-TRACE_CMD_SITE = $(BR2_KERNEL_MIRROR)/scm/linux/kernel/git/rostedt/trace-cmd.git
+TRACE_CMD_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
 TRACE_CMD_INSTALL_STAGING = YES
 TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
-- 
2.17.1
