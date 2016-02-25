From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 25 Feb 2016 12:51:14 +0100
Subject: [Buildroot] [PATCH v3 1/2] COPYING: add exception about patch
	licensing
In-Reply-To: <1456401075-16948-1-git-send-email-luca@lucaceresoli.net>
References: <1456401075-16948-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1456401075-16948-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Several people have been asking what is the license of the patches
provided by Buildroot. COPYING is the authoritative place to state it.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Steve Calfee <stevecalfee@gmail.com>

---
Changes v2 -> v3:
 - Rewrite it entirely based on comments on the mailing list (Yann,
   Arnout, Thomas, Peter, Steve).

Changes v1 -> v2:
 - Rewrite it almost entirely (Arnout, Thomas).
---
 COPYING | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/COPYING b/COPYING
index d511905..0c018b0 100644
--- a/COPYING
+++ b/COPYING
@@ -1,3 +1,19 @@
+With the exceptions below, Buildroot is distributed under the terms of
+the GNU General Public License, reproduced below; either version 2 of
+the License, or (at your option) any later version.
+
+Some files in Buildroot contain a different license statement. Those
+files are licensed under the license contained in the file itself.
+
+Buildroot also bundles patch files, which are applied to the sources
+of the various packages. Those patches are not covered by the license
+of Buildroot. Instead, they are covered by the license of the software
+to which the patches are applied. When said software is available
+under multiple licenses, the Buildroot patches are only provided under
+the publicly accessible licenses.
+
+-----------------------------------------------------------------
+
 		    GNU GENERAL PUBLIC LICENSE
 		       Version 2, June 1991
 
-- 
1.9.1
