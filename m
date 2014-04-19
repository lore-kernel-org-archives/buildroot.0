From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 19 Apr 2014 11:47:32 +0200
Subject: [Buildroot] [PATCH 4/5] lttng-tools: bump version to 2.4.1
In-Reply-To: <1397900853-7235-1-git-send-email-romain.naour@openwide.fr>
References: <1397900853-7235-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1397900853-7235-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/lttng-tools/lttng-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.9.0
