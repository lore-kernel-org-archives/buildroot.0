From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 15:27:57 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix flake8 E117
 warning
Message-ID: <20200324144153.292F17FBD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=198d76efb35c84b397c1e960cc454f4988f50eb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  support/scripts/pkg-stats:146:17: E117 over-indented

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 93035495ad..039a1937b9 100755
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
