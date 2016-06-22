From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 22 Jun 2016 21:03:37 +0300
Subject: [Buildroot] [PATCH] glog: put hash in .hash file
Message-ID: <2e64c7bc9e4f2773c7ce1dd47f48f32da4929aea.1466618617.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

github archives should be stable now.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/glog/glog.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glog/glog.hash b/package/glog/glog.hash
index dad15434d068..4548ebac2c72 100644
--- a/package/glog/glog.hash
+++ b/package/glog/glog.hash
@@ -1,2 +1,2 @@
-# No hash for v0.3.4, comes from the github-helper:
-none	xxx	glog-v0.3.4.tar.gz
+# Locally computed
+sha256	ce99d58dce74458f7656a68935d7a0c048fa7b4626566a71b7f4e545920ceb10	glog-v0.3.4.tar.gz
-- 
2.8.1
