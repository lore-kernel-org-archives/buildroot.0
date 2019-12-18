From: Mark Corbin <mark@dibsco.co.uk>
Date: Wed, 18 Dec 2019 13:14:41 +0000
Subject: [Buildroot] [PATCH 1/1] package/tcllib: update the upstream URL in
 Config.in
Message-ID: <20191218131441.7151-1-mark@dibsco.co.uk>
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
 package/tcllib/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcllib/Config.in b/package/tcllib/Config.in
index b0a4ad060e..3a307b9aee 100644
--- a/package/tcllib/Config.in
+++ b/package/tcllib/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_TCLLIB
 	  is to collect commonly used function into a single library,
 	  which users can rely on to be available and stable
 
-	  http://tcl.activestate.com/software/tcllib/
+	  https://www.tcl.tk/software/tcllib/
-- 
2.20.1
