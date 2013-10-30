From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Wed, 30 Oct 2013 22:20:10 +0200
Subject: [Buildroot] [PATCH 3/5] lttng-modules: bump to version 2.3.2
In-Reply-To: <1383164412-20657-1-git-send-email-olivier.schonken@gmail.com>
References: <1383164412-20657-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1383164412-20657-3-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/lttng-modules/lttng-modules.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index baa421e..22a33cd 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.2.0
+LTTNG_MODULES_VERSION = 2.3.2
 LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules/
 LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for lib/bitfield.h and lib/prio_heap/*
-- 
1.8.3.2
