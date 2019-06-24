From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 21:05:46 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/haveged: fix
 legal-info
Message-ID: <20190624190446.CC7567FC2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a543e25c0d60c6ea258d88cf78c2dbd7f4e6d88e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Add hash for COPYING file

Fixes:

$: make haveged-legal-info
 >>> haveged 1.9.4 Collecting legal info
 ERROR: No hash found for COPYING

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0ae29b98d1293b0e89fa2f5686fe743af1f45c34)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haveged/haveged.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index d1133b6931..44be222a1e 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,2 +1,4 @@
 # From http://www.issihosts.com/haveged/verify/haveged-1.9.1.sha1
 sha1	ab7234b7f57dbb7d500a5ab3cbf0494715ce6499	haveged-1.9.1.tar.gz
+# Locally calculated
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
