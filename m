From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 16:00:52 +0000
Subject: [Buildroot] [PATCH 1/7] package/matchbox-common: add an upstream
 URL to Config.in
Message-ID: <20191128160058.24118-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
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
-- 
2.20.1
