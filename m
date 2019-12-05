From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:44:36 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/matchbox-common:
 add an upstream URL to Config.in
Message-ID: <20191205213859.1519A80F82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5b7e576da0e945b67ccc14fa72386384250c93e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 99eb6cfb242b4bfaf00f8b5389f902c3167a3eee)
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
