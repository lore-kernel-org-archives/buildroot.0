From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Mar 2014 22:50:45 +0100
Subject: [Buildroot] [git commit] lttng-tools: bump version to 2.4.0
Message-ID: <20140323221922.130679BF81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=066085b042931564d4d16ce8553cbce8b561a9da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also adjust the license details

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-tools/lttng-tools.mk |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index f6eff96..260bf82 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.2.0
+LTTNG_TOOLS_VERSION = 2.4.0
 LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools/
 LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
-LTTNG_TOOLS_LICENSE = GPLv2; LGPLv2.1 for include/lttng/* and src/lib/lttng-ctl/*
-# gpl-2.0.txt and lgpl-2.1.txt files are missing from the sources
-LTTNG_TOOLS_LICENSE_FILES = LICENSE
+LTTNG_TOOLS_LICENSE = GPLv2+; LGPLv2.1+ for include/lttng/* and src/lib/lttng-ctl/*
+LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
 
 # The host-lttng-babeltrace technically isn't a required build
 # dependency. However, having the babeltrace utilities built for the
