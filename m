From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2019 18:57:07 +0100
Subject: [Buildroot] [git commit] package/netperf: update the upstream URL
 in Config.in
Message-ID: <20191201175208.9714482910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08f2c31c054e5fa57baef1b476e46b3b8dc9853b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
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
