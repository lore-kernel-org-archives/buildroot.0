From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:46:17 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 support/scripts/pkg-stats: fix flake8 warning
Message-ID: <20200828155254.4880786539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cc13f49afd2d898bf62e147f572299f1d2626ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This fixes the following flake8 warning:

support/scripts/pkg-stats:1005:9: E117 over-indented

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 204d03ae43bcf9578e2d356a9a243c78eddf3453)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 505836b35f..f52bad30fb 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1001,7 +1001,7 @@ def dump_json(packages, defconfigs, stats, date, commit, output):
 
 
 def resolvepath(path):
-        return os.path.abspath(os.path.expanduser(path))
+    return os.path.abspath(os.path.expanduser(path))
 
 
 def parse_args():
