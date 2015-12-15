From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:01:28 +0100
Subject: [Buildroot] [git commit] trace-cmd: comma separate licenses
Message-ID: <20151215210843.7BFD680409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9d383110fa077c2d1505fbd78fb6fb7598397f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/trace-cmd/trace-cmd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 02836ce..55958b0 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -8,7 +8,7 @@ TRACE_CMD_VERSION = trace-cmd-v2.3.2
 TRACE_CMD_SITE = $(BR2_KERNEL_MIRROR)/scm/linux/kernel/git/rostedt/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
 TRACE_CMD_INSTALL_STAGING = YES
-TRACE_CMD_LICENSE = GPLv2 LGPLv2.1
+TRACE_CMD_LICENSE = GPLv2, LGPLv2.1
 TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB
 
 TRACE_CMD_DEPENDENCIES = host-pkgconf
