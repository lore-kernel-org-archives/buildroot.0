From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 19:29:50 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/most: update the
 upstream URL in Config.in
Message-ID: <20191205185717.1CA4487FAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efaaaf0c11e17a44c919dec1d6ea8f9c55e3131c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ddc324d76ce5d73404ddf8aec9bd2741fe5f8886)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/most/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/most/Config.in b/package/most/Config.in
index 943042c3fd..194d2bd355 100644
--- a/package/most/Config.in
+++ b/package/most/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_MOST
 	  most is a powerful pager, including features like multi
 	  document support, hex view and unpack on-the-fly.
 
-	  https://www.jedsoft.com/most/
-
 	  Note: this program depends on the slang library which is
 	  rather large to be used just for this pager.
+
+	  https://www.jedsoft.org/most/
