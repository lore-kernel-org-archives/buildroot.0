From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:48:51 +0200
Subject: [Buildroot] [git commit] boost: update upstream status of
 0005-fix-static-detection-of-lock-free-atomic-ints.patch
Message-ID: <20181010194809.B2029827EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1554db330d1c8dda9926762a666a3a059d51c1b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch has been accepted upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/0005-fix-static-detection-of-lock-free-atomic-ints.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/0005-fix-static-detection-of-lock-free-atomic-ints.patch b/package/boost/0005-fix-static-detection-of-lock-free-atomic-ints.patch
index 580a298056..9e87aaedf0 100644
--- a/package/boost/0005-fix-static-detection-of-lock-free-atomic-ints.patch
+++ b/package/boost/0005-fix-static-detection-of-lock-free-atomic-ints.patch
@@ -48,7 +48,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/f46d38991385cbc2a4fa14eb31074e770cd79803
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/boostorg/thread/pull/231]
+[Upstream status: https://github.com/boostorg/thread/commit/f7581a366294c6f5381e0371c242af327c6da655]
 ---
  build/Jamfile.v2 | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
