From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2019 19:15:05 +0100
Subject: [Buildroot] [git commit] package/matchbox-panel: add an upstream
 URL to Config.in
Message-ID: <20191201180900.2B86E8366F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=484b687f79d06945c581cdaf709c2ecd8cbb3774
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matchbox-panel/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/matchbox-panel/Config.in b/package/matchbox-panel/Config.in
index 47bd10ad7e..1fc38336a5 100644
--- a/package/matchbox-panel/Config.in
+++ b/package/matchbox-panel/Config.in
@@ -4,3 +4,5 @@ config BR2_PACKAGE_MATCHBOX_PANEL
 	help
 	  A flexible always present 'window bar' for holding
 	  application launchers.
+
+	  http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-panel/
