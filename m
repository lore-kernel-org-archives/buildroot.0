From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2019 19:14:06 +0100
Subject: [Buildroot] [git commit] package/matchbox-common: add an upstream
 URL to Config.in
Message-ID: <20191201180859.F29048366F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99eb6cfb242b4bfaf00f8b5389f902c3167a3eee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matchbox-common/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/matchbox-common/Config.in b/package/matchbox-common/Config.in
index 587a0694e8..3717a551f2 100644
--- a/package/matchbox-common/Config.in
+++ b/package/matchbox-common/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_MATCHBOX_COMMON
 	help
 	  Common desktop folders and matchbox-session script.
 
+	  http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-common/
+
 config BR2_PACKAGE_MATCHBOX_COMMON_PDA
 	bool "PDA style app folder"
 	depends on BR2_PACKAGE_MATCHBOX_COMMON
