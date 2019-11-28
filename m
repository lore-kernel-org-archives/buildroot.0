From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 12:13:08 +0000
Subject: [Buildroot] [PATCH 1/1] package/libglob: add an upstream URL to
 Config.in
Message-ID: <20191128121308.29264-1-mark@dibsco.co.uk>
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
-- 
2.20.1
