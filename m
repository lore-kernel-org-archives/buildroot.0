From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 15:21:28 +0200
Subject: [Buildroot] [git commit] package/trace-cmd: update download url
Message-ID: <20140608132137.E7C6F9CE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70740ddc0a3bbf9a6fd54a9e2799d30cdd0dc101
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The git repository has been moved to http://www.kernel.org/pub/ which
allows to use $(BR2_KERNEL_MIRROR)

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/trace-cmd/trace-cmd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
