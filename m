From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  1 Feb 2016 23:19:54 +0100
Subject: [Buildroot] [PATCH v2 3/5] COPYING: add exception about patch
	licensing
In-Reply-To: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
References: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1454365196-26319-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Several people have been asking what is the license of the patches
provided by Buildroot. COPYING is the authoritative place to state it.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
 - Rewrite it almost entirely (Arnout, Thomas).
---
 COPYING | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/COPYING b/COPYING
index d511905..3596777 100644
--- a/COPYING
+++ b/COPYING
@@ -1,3 +1,11 @@
+Except for the patches provided for packages, Buildroot is licensed
+under the GNU General Public License, version 2.
+
+Patches provided by Buildroot for packages are released under the same
+license as the software that they modify.
+
+-----------------------------------------------------------------
+
 		    GNU GENERAL PUBLIC LICENSE
 		       Version 2, June 1991
 
-- 
1.9.1
