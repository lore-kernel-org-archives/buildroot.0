From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 22:27:49 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] minicom: add COPYING
 sha256 to hash
Message-ID: <20180927202746.8727B89058@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebf7d54f8890268681541c5204a07c5cf3775d5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

In minicom package hash file lacks sha256 entry for COPYING file even if
it is added to MINICOM_LICENSE_FILES.

Add COPYING sha256 entry to minicom.hash file.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6edfa41a0a472401a87f7f2ef354b041a7c2c797)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
