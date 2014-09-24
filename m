From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Sep 2014 23:12:42 +0200
Subject: [Buildroot] [git commit] stress: update homepage link
Message-ID: <20140924211303.006B19D69D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f00e374903fccca855ec0b9fa63aafda3df40a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old link returns HTTP 404 error.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/stress/Config.in b/package/stress/Config.in
index 37f8946..b22c3f1 100644
--- a/package/stress/Config.in
+++ b/package/stress/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_STRESS
 	  It imposes a configurable amount of CPU, memory, I/O, and
 	  disk stress on the system.
 
-	  http://weather.ou.edu/~apw/projects/stress/
+	  http://people.seas.harvard.edu/~apw/stress/
