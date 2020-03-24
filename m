From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 15:27:57 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix flake8 E302
 warning
Message-ID: <20200324144153.180238805D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e03bdef0ec0a32d9c472ab050ea29f8d3ad8c35e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  support/scripts/pkg-stats:57:1: E302 expected 2 blank lines, found 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 7b144a5ba6..93035495ad 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -54,6 +54,7 @@ RM_API_STATUS_NOT_FOUND = 4
 # because it's used by sub-processes.
 http_pool = None
 
+
 class Defconfig:
     def __init__(self, name, path):
         self.name = name
