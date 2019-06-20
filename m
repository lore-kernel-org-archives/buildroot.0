From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jun 2019 13:30:38 +0200
Subject: [Buildroot] [git commit] package/haveged: fix legal-info
Message-ID: <20190620113224.24C338212D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ae29b98d1293b0e89fa2f5686fe743af1f45c34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for COPYING file

Fixes:

$: make haveged-legal-info
 >>> haveged 1.9.4 Collecting legal info
 ERROR: No hash found for COPYING

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haveged/haveged.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index d98e1d984b..048941849c 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  c4959d3cb1fa6391d16a3aa1ba4d82cd3a0d497206ae4b87d638088c0664e5aa	haveged-1.9.4.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
