From: Julien Floret <julien.floret@6wind.com>
Date: Thu, 14 Sep 2017 14:53:16 +0200
Subject: [Buildroot] [PATCH] CHANGES: update after netsnmp changes
Message-ID: <20170914125316.1872-1-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 CHANGES | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/CHANGES b/CHANGES
index c042bf5e3e6e..89d9e2a5fa95 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,9 @@
+2017.11-rc1, To be released
+
+	netsnmp: all MIB files are now installed, making the target filesystem a
+	bit bigger than before. To remove unneeded MIBS, you should use a
+	post-build script.
+
 2017.08, Released September 1st, 2017
 
 	Minor fixes.
-- 
2.13.1
