From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 13:46:00 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] package/bandwidthd: put
 upstream URL on separate lines in Config.in help
Message-ID: <20181005114504.8F57A8D284@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8aad5a8d0b4fe3ffed5ce2e6f6383a7a088e4475
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Allows scripting of URL checking to be simplier

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4bdb24c5d95ad1ec5f656ed135d34eabc9e90199)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bandwidthd/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
index a503da43ff..8a19733c2c 100644
--- a/package/bandwidthd/Config.in
+++ b/package/bandwidthd/Config.in
@@ -25,8 +25,10 @@ config BR2_PACKAGE_BANDWIDTHD
 	  available on github that works on making BandwidthD's build
 	  process more compatible with buildroot's.
 
-	  Upstream: http://bandwidthd.sourceforge.net/
-	  Github fork: http://github.com/nroach44/bandwidthd
+	  Upstream:
+	  http://bandwidthd.sourceforge.net/
+	  Github fork:
+	  http://github.com/nroach44/bandwidthd
 
 if BR2_PACKAGE_BANDWIDTHD
 
