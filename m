From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Feb 2016 19:50:13 +0100
Subject: [Buildroot] [git commit] COPYING: add exception about patch
	licensing
Message-ID: <20160226185154.6BCE881941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d830036cceade7052630ec256b35117fdaffa3fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Several people have been asking what is the license of the patches
provided by Buildroot. COPYING is the authoritative place to state it.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Steve Calfee <stevecalfee@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
