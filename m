From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 14:54:42 +0000
Subject: [Buildroot] [PATCH 1/1] package/flashbench: update the upstream URL
 in Config.in
Message-ID: <20191126145442.28415-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/flashbench/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flashbench/Config.in b/package/flashbench/Config.in
index 7be1ea9bc3..a50f482ac3 100644
--- a/package/flashbench/Config.in
+++ b/package/flashbench/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_FLASHBENCH
 	  SD cards and other media for the Linaro flash memory
 	  survey.
 
-	  https://wiki.linaro.org/WorkingGroups/KernelConsolidation/Projects/FlashCardSurvey
+	  https://git.linaro.org/people/arnd.bergmann/flashbench.git
-- 
2.20.1
