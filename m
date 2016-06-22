From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 22 Jun 2016 20:40:40 +0300
Subject: [Buildroot] [PATCH] gflags: put hash in .hash file
Message-ID: <667566b6818e789a6a47731019ad964a9c887c48.1466617240.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

github archives should be stable now.

Fixes:
http://autobuild.buildroot.net/results/ac9/ac92ec88c9e26df579a5e44f58c34a3e4dd5b2b0/
http://autobuild.buildroot.net/results/79c/79cecd4fa98bdad5b5bdc57725d8cb8118b1cf2e/
http://autobuild.buildroot.net/results/bb2/bb2e04a643784beb78f38c016a1c621786b575fe/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gflags/gflags.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gflags/gflags.hash b/package/gflags/gflags.hash
index 9c8b27a4b529..5b224113d981 100644
--- a/package/gflags/gflags.hash
+++ b/package/gflags/gflags.hash
@@ -1,2 +1,2 @@
-# No hash for v2.1.2, comes from the github-helper:
-none	xxx	gflags-v2.1.2.tar.gz
+# Locally computed
+sha256	d8331bd0f7367c8afd5fcb5f5e85e96868a00fd24b7276fa5fcee1e5575c2662	gflags-v2.1.2.tar.gz
-- 
2.8.1
