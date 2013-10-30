From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Wed, 30 Oct 2013 22:20:09 +0200
Subject: [Buildroot] [PATCH 2/5] lttng-tools: bump to version 2.3.0
In-Reply-To: <1383164412-20657-1-git-send-email-olivier.schonken@gmail.com>
References: <1383164412-20657-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1383164412-20657-2-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/lttng-tools/lttng-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index f6eff96..2daed43 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.2.0
+LTTNG_TOOLS_VERSION = 2.3.0
 LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools/
 LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2; LGPLv2.1 for include/lttng/* and src/lib/lttng-ctl/*
-- 
1.8.3.2
