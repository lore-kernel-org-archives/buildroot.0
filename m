From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2019 19:16:08 +0100
Subject: [Buildroot] [git commit] package/musl-fts: add an upstream URL to
 Config.in
Message-ID: <20191201180900.459538366F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca440a773bd56104fe4709d721c93ec15d1db93f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
