From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 17:53:02 +0000
Subject: [Buildroot] [PATCH 1/1] package/musl-fts: add an upstream URL to
 Config.in
Message-ID: <20191128175302.1268-1-mark@dibsco.co.uk>
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
 package/musl-fts/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/musl-fts/Config.in b/package/musl-fts/Config.in
index a7f38c182e..358bf271cc 100644
--- a/package/musl-fts/Config.in
+++ b/package/musl-fts/Config.in
@@ -5,3 +5,5 @@ config BR2_PACKAGE_MUSL_FTS
 	  The musl-fts package implements the fts(3) functions
 	  fts_open, fts_read, fts_children, fts_set and fts_close,
 	  which are missing in musl and uClibc-ng C libraries.
+
+	  https://github.com/void-linux/musl-fts
-- 
2.20.1
