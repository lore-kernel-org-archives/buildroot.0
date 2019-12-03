From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:55:49 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libbson: add an
 upstream URL to Config.in
Message-ID: <20191203134737.4AF678447E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85d53709428ccb88815baf2bae9d00ad619155fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0f6a817c7e1ca0ef325ecc963d08c783829cb8b6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbson/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libbson/Config.in b/package/libbson/Config.in
index 4305ca9037..95f224e29e 100644
--- a/package/libbson/Config.in
+++ b/package/libbson/Config.in
@@ -5,5 +5,7 @@ config BR2_PACKAGE_LIBBSON
 	  libbson is a library providing useful routines related to
 	  building, parsing, and iterating BSON documents.
 
+	  http://mongoc.org/libbson/
+
 comment "libbson needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
