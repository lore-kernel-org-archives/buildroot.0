From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:50 +0100
Subject: [Buildroot] [PATCH 16/30] lsof: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-16-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lsof/lsof.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index fa55e6a..f74eca4 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -7,6 +7,10 @@
 LSOF_VERSION = 4.85
 LSOF_SOURCE = lsof_$(LSOF_VERSION).tar.bz2
 LSOF_SITE = ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
+LSOF_LICENSE = lsof license
+# License is repeated in each file, this is a relatively small one.
+# It is also defined in 00README, but that contains a lot of other cruft.
+LSOF_LICENSE_FILES = dialects/linux/dproto.h
 
 # Make certain full-blown lsof gets built after the busybox version (1.20+)
 LSOF_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-- 
1.7.10.4
