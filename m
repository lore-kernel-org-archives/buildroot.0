From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:49 +0100
Subject: [Buildroot] [PATCH 15/30] logrotate: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-15-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/logrotate/logrotate.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index ae622b0..da8e4b3 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -6,6 +6,8 @@
 LOGROTATE_VERSION = 3.7.9
 LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.gz
 LOGROTATE_SITE = https://fedorahosted.org/releases/l/o/logrotate/
+LOGROTATE_LICENSE = GPLv2+
+LOGROTATE_LICENSE_FILES = COPYING
 
 LOGROTATE_DEPENDENCIES = popt
 
-- 
1.7.10.4
