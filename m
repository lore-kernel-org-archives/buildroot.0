From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 08:38:07 +0200
Subject: [Buildroot] [git commit branch/2020.05.x]
 support/scripts/pkg-stats: fix flake8 warning
Message-ID: <20200721064041.B44C07FBE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ef5d51a2bc8a252a1f72306404b201627c57559
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

This fixes the following flake8 warning:

support/scripts/pkg-stats:1005:9: E117 over-indented

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 204d03ae43bcf9578e2d356a9a243c78eddf3453)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 170f99e7fc..ec4d538758 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1002,7 +1002,7 @@ def dump_json(packages, defconfigs, stats, date, commit, output):
 
 
 def resolvepath(path):
-        return os.path.abspath(os.path.expanduser(path))
+    return os.path.abspath(os.path.expanduser(path))
 
 
 def parse_args():
