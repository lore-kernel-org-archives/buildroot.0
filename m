From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:49:26 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/flashbench:
 update the upstream URL in Config.in
Message-ID: <20191203134126.7568A84295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd9ee2c6d31836aeee32e46e5a4a3e8af60a82f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b6c8313829cb0d02c659aae68684e1e70ab93c34)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
