From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 11:38:07 +0100
Subject: [Buildroot] [git commit] package/libglob: add an upstream URL to
 Config.in
Message-ID: <20191129103153.D54C482787@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=813b9c34cfc3af2f92bc2c4cf3f6ccfc591c5373
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
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
