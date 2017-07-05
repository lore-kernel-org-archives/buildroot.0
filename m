From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 Jul 2017 14:09:50 +0200
Subject: [Buildroot] [PATCH 3/3] CHANGES: update with removal of
	$(HOST_DIR)/usr
In-Reply-To: <20170705120950.23189-1-arnout@mind.be>
References: <20170705120950.23189-1-arnout@mind.be>
Message-ID: <20170705120950.23189-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 CHANGES | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/CHANGES b/CHANGES
index 105c9318f4..a530e8fb45 100644
--- a/CHANGES
+++ b/CHANGES
@@ -17,6 +17,13 @@
 	Therefore, if you need NLS support in packages, you must now
 	explicitly enable the BR2_SYSTEM_ENABLE_NLS option.
 
+	Infrastructure:
+
+	- The host directory no longer has a usr/ component. This
+	  makes it much more natural to use that directory as an
+	  externally used toolchain. For compatibility with existing
+	  scripts, a link usr -> . is still added.
+
 2017.05.1, Released July 4th, 2017
 
 	Important / security related fixes.
-- 
2.13.2
