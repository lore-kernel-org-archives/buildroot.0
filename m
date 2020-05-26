From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 May 2020 12:02:13 +0200
Subject: [Buildroot] [git commit] package/lrzip: fix hash
Message-ID: <20200526094548.9D09C91D37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6aaed0cee95e61fc7714215199b6e344ba8c409
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hash was not updated by commit 18079e20a712c4a7d539ead52b0a0c725ec7f7e2

Fixes:
 - http://autobuild.buildroot.org/results/0f7179ed4706f05551af330d7f12b3efaeffd278

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lrzip/lrzip.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lrzip/lrzip.hash b/package/lrzip/lrzip.hash
index 447cf94ccc..3e188c41e5 100644
--- a/package/lrzip/lrzip.hash
+++ b/package/lrzip/lrzip.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7f886b248c996ef9d327e0a8ede4eb7e067186185cad7b37084607098d35c75a  lrzip-7f3bf46203bf45ea115d8bd9f310ea219be88af4.tar.gz
+sha256  4d31c429491f1378e868afe06867f68f8b1332fdca0758de24cc4da22103acfb  lrzip-7f3bf46203bf45ea115d8bd9f310ea219be88af4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
