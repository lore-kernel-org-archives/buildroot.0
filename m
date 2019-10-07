From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Oct 2019 23:39:21 +0200
Subject: [Buildroot] [git commit] utils/checkpackagelib:
 CommentsMenusPackagesOrder: use '-' to describe state
Message-ID: <20191007213952.0AC358B465@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a5f6ea7e2095da4076df05a8af3d3bc8ac8bb47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 06c066c5ca..d1d4a4f549 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -115,7 +115,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
             self.initialize_level_elements(text)
 
         elif text.startswith("endif") or text.startswith("endmenu"):
-            if self.state.endswith("comment"):
+            if self.state.endswith("-comment"):
                 self.state = self.state[:-8]
 
             if text.startswith("endif"):
