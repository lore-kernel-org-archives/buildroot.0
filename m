From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:45:07 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 support/scripts/pkg-stats: fix flake8 E117 warning
Message-ID: <20200828155254.16819811FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=903b4fa92096d50fad8f51d52b839688e8de1d35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:

  support/scripts/pkg-stats:146:17: E117 over-indented

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 198d76efb35c84b397c1e960cc454f4988f50eb7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 4bce551957..06d5bd078c 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -143,7 +143,7 @@ class Package:
             if self.infras[0][1] == 'virtual':
                 return False
         except IndexError:
-                return False
+            return False
         return True
 
     def set_infra(self):
