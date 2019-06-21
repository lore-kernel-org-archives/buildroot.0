From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Jun 2019 22:21:51 +0200
Subject: [Buildroot] [git commit] package/python-daemon: add hashes for
 license files
Message-ID: <20190621202117.90435821C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb0eb10872dab013e037bcb73ca9269f62891c0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

$: make python-daemon-legal-info
 >>> python-daemon 2.2.3 Collecting legal info
 ERROR: No hash found for LICENSE.ASF-2
 ERROR: No hash found for LICENSE.GPL-3

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-daemon/python-daemon.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-daemon/python-daemon.hash b/package/python-daemon/python-daemon.hash
index 536641818c..4f53902d3f 100644
--- a/package/python-daemon/python-daemon.hash
+++ b/package/python-daemon/python-daemon.hash
@@ -1,3 +1,6 @@
 # md5, sha256 https://pypi.org/pypi/python-daemon/json
 md5  3ab10a93472201214cd95c05f1923af6  python-daemon-2.2.3.tar.gz
 sha256  affeca9e5adfce2666a63890af9d6aff79f670f7511899edaddca7f96593cc25  python-daemon-2.2.3.tar.gz
+# Locally computed sha256
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.ASF-2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL-3
