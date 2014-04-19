From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 19 Apr 2014 11:47:30 +0200
Subject: [Buildroot] [PATCH 2/5] lttng-libust: bump version to 2.4.1
In-Reply-To: <1397900853-7235-1-git-send-email-romain.naour@openwide.fr>
References: <1397900853-7235-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1397900853-7235-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixes:
http://autobuild.buildroot.net/results/a6f/a6f5550cc63260126cb66a954af60f1633b97faf/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/lttng-libust/lttng-libust.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 375a6a3..b6d1911 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust/
-LTTNG_LIBUST_VERSION = 2.4.0
+LTTNG_LIBUST_VERSION = 2.4.1
 LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
-- 
1.9.0
