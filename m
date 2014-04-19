From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 18:53:49 +0200
Subject: [Buildroot] [git commit] lttng-tools: bump version to 2.4.1
Message-ID: <20140419165650.7AABF9C912@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3d4382dba30d650e6e074c4cd2a116c7fd52e3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-tools/lttng-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 260bf82..a510adf 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.4.0
+LTTNG_TOOLS_VERSION = 2.4.1
 LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools/
 LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+; LGPLv2.1+ for include/lttng/* and src/lib/lttng-ctl/*
