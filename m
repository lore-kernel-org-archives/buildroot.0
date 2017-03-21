From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:17:05 +0100
Subject: [Buildroot] [git commit] uhttpd: add hash
Message-ID: <20170321221730.6E39F802E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b3beceb72dcf56c172e71ca39518e352dcc954d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uhttpd had a hash file, but is says "none" because it is a git download.
Since our git downloads are not reproducible, we can actually add a
hash.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uhttpd/uhttpd.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
index 59e54ad..bfeb557 100644
--- a/package/uhttpd/uhttpd.hash
+++ b/package/uhttpd/uhttpd.hash
@@ -1,2 +1,2 @@
-# No hash for this git snapshot
-none	xxx	uhttpd-59e0c739634f46a164d939e54416287b91ff8a9b.tar.gz
+# Locally calculated
+sha256 b01aec584daaa367b85eddd950da27e3a41bcb265507cf42f79ff2ebcf0972d4  uhttpd-59e0c739634f46a164d939e54416287b91ff8a9b.tar.gz
