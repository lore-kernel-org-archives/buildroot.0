From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2019 19:14:35 +0100
Subject: [Buildroot] [git commit] package/matchbox-desktop: add an upstream
 URL to Config.in
Message-ID: <20191201180900.0AE418366F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fb87bbd3526c23e1c6d4ff7a233c3cd06a8187c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matchbox-desktop/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/matchbox-desktop/Config.in b/package/matchbox-desktop/Config.in
index 22c568bc1a..9d3e522a5a 100644
--- a/package/matchbox-desktop/Config.in
+++ b/package/matchbox-desktop/Config.in
@@ -4,3 +4,5 @@ config BR2_PACKAGE_MATCHBOX_DESKTOP
 	select BR2_PACKAGE_ZLIB
 	help
 	  A PDA style application launcher or 'item browser'.
+
+	  http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-desktop
