From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:06:03 +0100
Subject: [Buildroot] [PATCH 29/30] which: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-29-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/which/which.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/which/which.mk b/package/which/which.mk
index e7ebc7f..6e2dce6 100644
--- a/package/which/which.mk
+++ b/package/which/which.mk
@@ -6,5 +6,7 @@
 
 WHICH_VERSION = 2.20
 WHICH_SITE = http://carlo17.home.xs4all.nl/which
+WHICH_LICENSE = GPLv3+
+WHICH_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.10.4
