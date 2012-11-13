From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:56 +0100
Subject: [Buildroot] [PATCH 22/30] procps: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-22-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/procps/procps.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/procps/procps.mk b/package/procps/procps.mk
index ced04a4..189da1f 100644
--- a/package/procps/procps.mk
+++ b/package/procps/procps.mk
@@ -6,6 +6,8 @@
 
 PROCPS_VERSION = 3.2.8
 PROCPS_SITE = http://procps.sourceforge.net/
+PROCPS_LICENSE = GPLv2+, libproc and libps LGPLv2+
+PROCPS_LICENSE_FILES = COPYING COPYING.LIB
 
 PROCPS_DEPENDENCIES = ncurses
 
-- 
1.7.10.4
