From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:45:22 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/matchbox-lib: add
 an upstream URL to Config.in
Message-ID: <20191205213859.424667FCD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93c399f496c62935f9fd379d394e47f20419bba0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 45f5c12c4b2b9637f45a6004ba6c0e66edb3d313)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matchbox-lib/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/matchbox-lib/Config.in b/package/matchbox-lib/Config.in
index d758ab35a8..98cdae730d 100644
--- a/package/matchbox-lib/Config.in
+++ b/package/matchbox-lib/Config.in
@@ -3,3 +3,5 @@ config BR2_PACKAGE_MATCHBOX_LIB
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	help
 	  Matchbox common functionality library.
+
+	  http://git.yoctoproject.org/cgit/cgit.cgi/libmatchbox
