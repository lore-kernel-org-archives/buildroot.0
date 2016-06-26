From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 23:09:42 +0200
Subject: [Buildroot] [git commit] glog: put hash in .hash file
Message-ID: <20160626211011.B1D0981E94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14207adc5046208b081edc4f09f728153256b96b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

github archives should be stable now.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glog/glog.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glog/glog.hash b/package/glog/glog.hash
index dad1543..4548eba 100644
--- a/package/glog/glog.hash
+++ b/package/glog/glog.hash
@@ -1,2 +1,2 @@
-# No hash for v0.3.4, comes from the github-helper:
-none	xxx	glog-v0.3.4.tar.gz
+# Locally computed
+sha256	ce99d58dce74458f7656a68935d7a0c048fa7b4626566a71b7f4e545920ceb10	glog-v0.3.4.tar.gz
