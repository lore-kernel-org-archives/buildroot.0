From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 23:09:36 +0200
Subject: [Buildroot] [git commit] gflags: put hash in .hash file
Message-ID: <20160626211011.A3B2C805F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a489913a80f553d68b1534e272986122f1de46ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

github archives should be stable now.

Fixes:
http://autobuild.buildroot.net/results/ac9/ac92ec88c9e26df579a5e44f58c34a3e4dd5b2b0/
http://autobuild.buildroot.net/results/79c/79cecd4fa98bdad5b5bdc57725d8cb8118b1cf2e/
http://autobuild.buildroot.net/results/bb2/bb2e04a643784beb78f38c016a1c621786b575fe/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gflags/gflags.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gflags/gflags.hash b/package/gflags/gflags.hash
index 9c8b27a..5b22411 100644
--- a/package/gflags/gflags.hash
+++ b/package/gflags/gflags.hash
@@ -1,2 +1,2 @@
-# No hash for v2.1.2, comes from the github-helper:
-none	xxx	gflags-v2.1.2.tar.gz
+# Locally computed
+sha256	d8331bd0f7367c8afd5fcb5f5e85e96868a00fd24b7276fa5fcee1e5575c2662	gflags-v2.1.2.tar.gz
