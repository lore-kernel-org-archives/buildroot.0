From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 16:49:06 +0000
Subject: [Buildroot] [PATCH 1/1] package/most: update the upstream URL in
 Config.in
Message-ID: <20191128164906.30486-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
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
-- 
2.20.1
