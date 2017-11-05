From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 Nov 2017 17:45:05 +0100
Subject: [Buildroot] [git commit] package/check: add license hash
Message-ID: <20171105163751.42C22811C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ac717693ce6f0ea6a0707b8f998f0e0b5e3d3ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/check/check.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/check/check.hash b/package/check/check.hash
index f0c02ba..3c41a96 100644
--- a/package/check/check.hash
+++ b/package/check/check.hash
@@ -1,2 +1,4 @@
 # Locally computed
 sha256	24f7a48aae6b74755bcbe964ce8bc7240f6ced2141f8d9cf480bc3b3de0d5616	check-0.11.0.tar.gz
+# License files, locally calculated
+sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861	COPYING.LESSER
