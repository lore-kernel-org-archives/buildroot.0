From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 19 Apr 2014 11:47:31 +0200
Subject: [Buildroot] [PATCH 3/5] lttng-modules: bump version to 2.4.1
In-Reply-To: <1397900853-7235-1-git-send-email-romain.naour@openwide.fr>
References: <1397900853-7235-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1397900853-7235-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/lttng-modules/lttng-modules.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index ca51e87..44cf651 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.4.0
+LTTNG_MODULES_VERSION = 2.4.1
 LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules/
 LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for lib/bitfield.h and lib/prio_heap/*
-- 
1.9.0
