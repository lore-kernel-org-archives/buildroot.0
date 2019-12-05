From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 19:38:17 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libglob: add an
 upstream URL to Config.in
Message-ID: <20191205185702.CE42087F6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=002e1bdeba24ecb3fc94f1b90bf213b5533cb53b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 813b9c34cfc3af2f92bc2c4cf3f6ccfc591c5373)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglob/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libglob/Config.in b/package/libglob/Config.in
index 029ed6a1d3..7ae2bfd250 100644
--- a/package/libglob/Config.in
+++ b/package/libglob/Config.in
@@ -2,3 +2,5 @@ config BR2_PACKAGE_LIBGLOB
 	bool "libglob"
 	help
 	  OpenBSD implementation of glob(3).
+
+	  https://github.com/void-linux/libglob
