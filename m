From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 11:13:12 +0000
Subject: [Buildroot] [PATCH 1/1] package/libass: update the upstream URL in
 Config.in
Message-ID: <20191128111312.19096-1-mark@dibsco.co.uk>
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
 package/libass/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libass/Config.in b/package/libass/Config.in
index 7690685187..c654d8212a 100644
--- a/package/libass/Config.in
+++ b/package/libass/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LIBASS
 	  libass is a portable subtitle renderer for the ASS/SSA
 	  (Advanced Substation Alpha/Substation Alpha) subtitle format
 
-	  http://code.google.com/p/libass/
+	  https://github.com/libass/libass
-- 
2.20.1
