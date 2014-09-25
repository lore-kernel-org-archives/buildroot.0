From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Sep 2014 09:47:40 +0200
Subject: [Buildroot] [git commit] lttng-modules: bump to version 2.5.0
Message-ID: <20140925075214.D7F0E9C041@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c83b0ad31b9f79d2f40428d66726996a689eaa7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version should support kernel up to 3.15.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-modules/lttng-modules.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 346214a..72d2eb7 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.4.1
+LTTNG_MODULES_VERSION = 2.5.0
 LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for lib/bitfield.h and lib/prio_heap/*
