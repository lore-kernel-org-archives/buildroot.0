From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:54:21 +0200
Subject: [Buildroot] [git commit] CHANGES: update with removal of
	$(HOST_DIR)/usr
Message-ID: <20170705145153.39E0D81EE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51b3315b754327afa03e18491ec684eaa98101bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/CHANGES b/CHANGES
index 105c931..a530e8f 100644
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
