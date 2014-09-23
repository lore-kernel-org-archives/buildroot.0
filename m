From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 23 Sep 2014 11:45:43 +0200
Subject: [Buildroot] [PATCH 4/8] lttng-modules: bump to version 2.5.0
In-Reply-To: <1411465547-6847-1-git-send-email-jezz@sysmic.org>
References: <1411465547-6847-1-git-send-email-jezz@sysmic.org>
Message-ID: <1411465547-6847-4-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version should support kernel up to 3.15.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/lttng-modules/lttng-modules.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.9.1
