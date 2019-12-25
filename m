From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:57:16 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/mali-t76x: update
 the upstream URL in Config.in
Message-ID: <20191225214903.7C5CB8E4E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d458bfd6cd0298bffc93a9dd79ce30626313703d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update the upstream URL in the help text in Config.in. Removing
the text from the beginning of the URL line addresses the 'Missing'
URL status in the package stats web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7cc6df7a69ee040ef6d374d5558a0fafe43db2ee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mali-t76x/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mali-t76x/Config.in b/package/mali-t76x/Config.in
index a85fa5b27e..2533f10002 100644
--- a/package/mali-t76x/Config.in
+++ b/package/mali-t76x/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_MALI_T76X
 	  Midgard T76X GPU. This package requires a kernel with the
 	  ARM Mali Midgard GPU Kernel Drivers enabled.
 
-	  Source: http://malideveloper.arm.com/resources/drivers/
+	  http://malideveloper.arm.com/resources/drivers/
 
 if BR2_PACKAGE_MALI_T76X
 
