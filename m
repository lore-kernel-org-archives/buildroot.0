From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 23:32:43 +0200
Subject: [Buildroot] [git commit branch/next] minicom: add COPYING sha256 to
 hash
Message-ID: <20180831214537.E895F8150E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6edfa41a0a472401a87f7f2ef354b041a7c2c797
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In minicom package hash file lacks sha256 entry for COPYING file even if
it is added to MINICOM_LICENSE_FILES.

Add COPYING sha256 entry to minicom.hash file.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/minicom/minicom.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index ca3087160b..f49e430c67 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1  minicom-2.7.1.tar.gz
+sha256 cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
