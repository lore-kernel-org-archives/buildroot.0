From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:45:03 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 support/scripts/pkg-stats: fix flake8 E302 warning
Message-ID: <20200828155254.06613811FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f21e323413f0e7fc3899767a0eabdf6ff441c36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:

  support/scripts/pkg-stats:57:1: E302 expected 2 blank lines, found 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e03bdef0ec0a32d9c472ab050ea29f8d3ad8c35e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 3de4c2023c..4bce551957 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -54,6 +54,7 @@ RM_API_STATUS_NOT_FOUND = 4
 # because it's used by sub-processes.
 http_pool = None
 
+
 class Defconfig:
     def __init__(self, name, path):
         self.name = name
