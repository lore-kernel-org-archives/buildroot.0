From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 21 Mar 2017 01:07:03 +0100
Subject: [Buildroot] [PATCH 07/16] uhttpd: add hash
In-Reply-To: <20170321000712.26500-1-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
Message-ID: <20170321000712.26500-8-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uhttpd had a hash file, but is says "none" because it is a git download.
Since our git downloads are not reproducible, we can actually add a
hash.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/uhttpd/uhttpd.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
index 59e54ad49a..bfeb5571c5 100644
--- a/package/uhttpd/uhttpd.hash
+++ b/package/uhttpd/uhttpd.hash
@@ -1,2 +1,2 @@
-# No hash for this git snapshot
-none	xxx	uhttpd-59e0c739634f46a164d939e54416287b91ff8a9b.tar.gz
+# Locally calculated
+sha256 b01aec584daaa367b85eddd950da27e3a41bcb265507cf42f79ff2ebcf0972d4  uhttpd-59e0c739634f46a164d939e54416287b91ff8a9b.tar.gz
-- 
2.11.0
