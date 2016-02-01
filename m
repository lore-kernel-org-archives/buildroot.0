From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  1 Feb 2016 15:52:22 +0100
Subject: [Buildroot] [PATCH 3/5] COPYING: add exception about patch licensing
In-Reply-To: <1454338344-24973-1-git-send-email-luca@lucaceresoli.net>
References: <1454338344-24973-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1454338344-24973-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Several people have been asking what is the license of the patches
provided by Buildroot. COPYING is the authoritative place to state this.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 COPYING | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/COPYING b/COPYING
index d511905..8f2ba0b 100644
--- a/COPYING
+++ b/COPYING
@@ -1,3 +1,13 @@
+Except for the below exception, Buildroot is licensed under the GNU
+General Public License, version 2, whose text is reported below.
+
+Exception:
+
+- Patches provided by Buildroot for packages are released under the
+  same license as the software that they modify.
+
+-----------------------------------------------------------------
+
 		    GNU GENERAL PUBLIC LICENSE
 		       Version 2, June 1991
 
-- 
1.9.1
