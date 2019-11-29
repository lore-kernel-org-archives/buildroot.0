From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:02:48 +0100
Subject: [Buildroot] [git commit] package/mii-diag: add an upstream URL to
 Config.in
Message-ID: <20191129090525.BEB0A81432@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eeba8339ca704be5cef207a7ccce47b5b5d77907
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mii-diag/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mii-diag/Config.in b/package/mii-diag/Config.in
index ca48ba216f..37f3647bb9 100644
--- a/package/mii-diag/Config.in
+++ b/package/mii-diag/Config.in
@@ -3,3 +3,5 @@ config BR2_PACKAGE_MII_DIAG
 	help
 	  mii-diag allows you to manipulate the MII registers of
 	  network cards.
+
+	  https://launchpad.net/ubuntu/+source/mii-diag
