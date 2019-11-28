From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 16:00:56 +0000
Subject: [Buildroot] [PATCH 5/7] package/matchbox-lib: add an upstream URL
 to Config.in
In-Reply-To: <20191128160058.24118-1-mark@dibsco.co.uk>
References: <20191128160058.24118-1-mark@dibsco.co.uk>
Message-ID: <20191128160058.24118-5-mark@dibsco.co.uk>
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
-- 
2.20.1
