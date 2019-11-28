From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 16:00:53 +0000
Subject: [Buildroot] [PATCH 2/7] package/matchbox-desktop: add an upstream
 URL to Config.in
In-Reply-To: <20191128160058.24118-1-mark@dibsco.co.uk>
References: <20191128160058.24118-1-mark@dibsco.co.uk>
Message-ID: <20191128160058.24118-2-mark@dibsco.co.uk>
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
-- 
2.20.1
