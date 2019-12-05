From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:09:22 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/netperf: update
 the upstream URL in Config.in
Message-ID: <20191205210734.359E6880A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0a064fb33a75bb9c80f00b977b2a4da238aa78c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 08f2c31c054e5fa57baef1b476e46b3b8dc9853b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netperf/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netperf/Config.in b/package/netperf/Config.in
index 2f36b1b0da..a935fde507 100644
--- a/package/netperf/Config.in
+++ b/package/netperf/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_NETPERF
 	help
 	  Network performance benchmark tool
 
-	  http://www.netperf.org/
+	  https://hewlettpackard.github.io/netperf/
