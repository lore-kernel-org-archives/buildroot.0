From: Mark Corbin <mark@dibsco.co.uk>
Date: Fri, 29 Nov 2019 15:48:15 +0000
Subject: [Buildroot] [PATCH 1/1] package/opentyrian-data: update the
 upstream URL in Config.in
Message-ID: <20191129154815.13298-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(405)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/opentyrian-data/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opentyrian-data/Config.in b/package/opentyrian-data/Config.in
index dd3b0c1328..c0698c297c 100644
--- a/package/opentyrian-data/Config.in
+++ b/package/opentyrian-data/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_OPENTYRIAN_DATA
 	  original Tyrian 2.1 data files, that have been released as
 	  Freeware in 2004, are compatible.
 
-	  http://code.google.com/p/opentyrian/wiki/FAQ
+	  https://bitbucket.org/opentyrian/opentyrian/wiki/Home
-- 
2.20.1
