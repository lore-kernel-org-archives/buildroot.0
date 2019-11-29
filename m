From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:40:47 +0100
Subject: [Buildroot] [git commit] package/most: update the upstream URL in
 Config.in
Message-ID: <20191129093446.B4DC782664@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddc324d76ce5d73404ddf8aec9bd2741fe5f8886
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
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
